`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/22 18:57:58
// Design Name: 
// Module Name: pre0
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module pre0(
//input pin define;
input wire rstn,//system reset
input wire clk,//system clk
//axi-in
input wire[15:0]datain,
input wire vld_i,//synchronous en
input wire last_i,
output wire ready_o,
//axi-out
//output pin define;
output reg[15:0]predata,//answer
output reg vld_o,
output reg last_o,
input wire ready_i,
output wire [1:0]keep_o
    );
 
//reg &wires define;   
reg vld_o1;
reg vld_o2;
reg vld_i0;
reg vld_i1;
reg ready_i0;
reg last_o1; 
reg last_o2;
reg last_o3;
reg[15:0]datatmp1; 
//reg[15:0]predata0;
reg[15:0]dataindelay;

wire[15:0]datadiv; //data/32

//time delay for 1 clk,reset&en included
always@(posedge clk or negedge rstn)
    if(!rstn) datatmp1[15:0]<=16'b0; 
    else if((vld_i|vld_o2)&ready_o)   datatmp1[15:0]<=datain[15:0];
    
always@(posedge clk or negedge rstn)
    if(!rstn) dataindelay[15:0]<=16'b0;
    else   if(ready_o) dataindelay[15:0]<=datatmp1[15:0];

//right move
assign datadiv=dataindelay>>5;

//pre emphasis
always@(posedge clk or negedge rstn)
    if(!rstn) predata<=16'b0;
    else  if(ready_o)  predata<=datadiv+datatmp1-dataindelay; 

//handshake  

//ready_o gen
assign ready_o=ready_i&ready_i0;
always@(posedge clk or negedge rstn)
    if(!rstn) ready_i0<='b0; 
    else   ready_i0<=ready_i;   
//vld_o gen
always@(posedge clk or negedge rstn)
    if(!rstn) vld_o1<='b0; 
    else   vld_o1<=vld_i;
always@(posedge clk or negedge rstn)
    if(!rstn) vld_o2<='b0; 
    else    vld_o2<=vld_o1;
     
always@(posedge clk or negedge rstn)
    if(!rstn) vld_o<='b0; 
    else    vld_o<=((vld_i0^vld_i1)|vld_o2)&ready_i;
    
always@(posedge clk or negedge rstn)
    if(!rstn) vld_i0<='b0; 
    else    if(vld_i) vld_i0<=1;
    
always@(posedge clk or negedge rstn)
    if(!rstn) vld_i1<='b0; 
    else    if(vld_o1) vld_i1<=1;
    
//last gen
always@(*)
    if(!rstn) last_o1='b0; 
    else if(last_i)   last_o1=1;  
always@(posedge clk or negedge rstn)
    if(!rstn) last_o3<='b0; 
    else    last_o3<=(!last_o2)&last_o1;  
always@(posedge clk or negedge rstn)
    if(!rstn) last_o2<='b0; 
    else    last_o2<=last_o1;  

always@(posedge clk or negedge rstn)
    if(!rstn) last_o<='b0; 
    else    last_o<=last_o3; 
//keep gen   
assign keep_o='b11;
endmodule

