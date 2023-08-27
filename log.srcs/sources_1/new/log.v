`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/15 21:39:54
// Design Name: 
// Module Name: log
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


module log(clk,rst,X,out,valid

    );
    input [15:0]X;
    input clk;
    input rst;
    output reg[15:0]out;
    input valid;
   
    
    
    

    reg[15:0]x;
    wire read;
    wire [7:0]x0;
    wire [7:0]x1;
    wire[15:0]out1;
    wire[15:0]out2;
    reg [23:0]x3;
    wire[15:0]x4;
    reg[16:0]x5;
    reg[15:0]x7;
    reg [32:0]X6;
    
        
    
   
    assign read=1;
    assign x4=x3>>16; 
   
    
    
    ROM1 rom1(
    .addr(x0),
    .clk(clk),
    .data(out1),
    .read(read)
    );
     ROM2 rom2(
    .addr(x0),
    .clk(clk),
    .data(out2),
    .read(read)
    );

    always@(posedge clk or negedge rst)
    if(!rst)
        x<=16'd0;
    else begin
     if(valid==1)
        x<=X;
          end
 assign x0=x[15:8];
 assign x1=x[7:0];
 
   always@(posedge clk or negedge rst)
    if(!rst)
        x3<=24'd0;
    else
        x3<=x1*out2;
   always@(posedge clk or negedge rst)
    if(!rst)
        x5<=17'd0;
    else
        x5<=out1+x4;
    always@(posedge clk or negedge rst)
       begin
        X6<=x5*16'b0010011010001000; 
        end
    always@(posedge clk or negedge rst)
    if(!rst)
        x7<=16'd0;
        else
            x7<=X6>>16;
     always@(posedge clk or negedge rst)
    if(!rst)
       out<=16'd0;
    else 
       out<=x7;
  
      
        
        
     
            
    
endmodule
