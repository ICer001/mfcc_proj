`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2021 07:48:57 PM
// Design Name: 
// Module Name: ml
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


module ml#(parameter M=1,
parameter C=4)
(idata,odata,ivalid,clk,rst,ovalid,iready,oready,ilast,olast,tkeep

    );
input clk;
input rst; 
    
input ivalid;
input[15:0]idata;
input ilast;
output  oready;

output [1:0]tkeep;

output reg[15:0]odata;
input iready;
output reg ovalid;
output reg olast;


reg[15:0]m;
reg[15:0]m1;
reg[15:0]m2;

reg[31:0]y;
wire[15:0]y1;
wire[15:0]out;
reg[15:0]L;
wire read;
reg[3:0]address;
reg[3:0]i;
reg[24:0]q;
reg[3:0]datar;



  rom rom1(
    .addr(address),
    .clk(clk),
    .data(out),
    .read(read));
assign read=1;
assign tkeep=2'b11;

wire ovalid1;
assign oready=iready&&ivalid;
always@(posedge clk or negedge rst)
 if(!rst)
    datar<=4'd0;
else
    datar<={datar[M*(C-1)-1:0],ivalid};
assign ovalid1=datar[M*C-1:M*C-M];

always@(posedge clk or negedge rst)
 if(!rst)
    ovalid<=0;
  else
    ovalid<=ovalid1;



 always@(posedge clk or negedge rst)
    if(!rst)
        q<=25'b0;
    else
        q<=q+1;
 always@(posedge clk or negedge rst)
    if(!rst)
        olast<=0;
    else if((q>'hffffff)&(q<'h100000f))
        
        olast<=1;
        else
            olast<=0;
        

always@(posedge clk or negedge rst)
if(!rst)
    m<=16'd0;
else if(iready)
    m<=idata;
always@(posedge clk or negedge rst)
if(!rst)
    m1<=16'd0;
else if(iready)

    m1<=m;
always@(posedge clk or negedge rst)
if(!rst)
    m2<=16'd0;
else  if(iready)
    m2<=m1;


always@(posedge clk or negedge rst)
if(!rst)
    i<=4'd0;
else  if(iready)

begin
if(ivalid==1)
begin 
if(i<11)
    i<=i+1;
 else i<=4'd0;
end   
     else i<=4'd0;
end

always@(posedge clk or negedge rst)
if(!rst)
    address<=4'd0;
else  if(iready)

    address<=i;
always@(posedge clk or negedge rst)
if(!rst)
    L<=16'd0;
else  if(iready)

    L<=out;


always@(posedge clk or negedge rst)
if(!rst)
    y<=32'd0;   
else if(iready)

  y<={{16{m2[15]}},m2} * {{16{L[15]}},L};
  
  
assign y1={y[31],y[29:15]};
  
always@(posedge clk or negedge rst)
if(!rst)
    odata<=16'd0;
else  if(iready)

    odata<=y1;

endmodule
