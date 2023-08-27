`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/16 22:33:43
// Design Name: 
// Module Name: logjiaohu
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


module  logjiaohu#(
parameter    M=1,
parameter    N=10
 
)
(clk,rst,ivalid,ovalid,iready,oready,idata,odata,olast,ilast,keep
);
    
    input clk;
    input rst;
    
    
  
    input [15:0]idata;
    output reg oready;
    input   ivalid;
    input ilast;
    
    output reg[15:0]odata;
    output   ovalid;
    input iready;
    output  reg olast;
    output wire[1:0]keep;
    assign keep=2'b11;
 
   reg[M*N-1:0] data_r;//yi wei zhong jian liang

   wire[1:0]tkeep;
  reg[3:0]i;


  


    reg  [7:0]X1;  
    reg[15:0]out;
    reg[15:0]x;
    wire read;
    reg[7:0]x0;
   reg [7:0]x1;
    wire[15:0]out1;
    wire[15:0]out2;
    reg [23:0]x3;
    wire[15:0]x4;
    reg[16:0]x5;
    reg[15:0]x7;
    reg [31:0]X6;
   
   
 assign tkeep=2'b11;  
 
 
 
 
reg ivalid1;
 wire ivalid2;
 
always@(posedge clk)
begin
    data_r<={data_r[M*(N-1)-1:0],ivalid};
end
 assign ovalid=data_r[M*N-1:M*N-M];
   always@(posedge clk or negedge rst)
    if(!rst)
        ivalid1<=0;
    else
        ivalid1<=ovalid;
 assign ivalid2=ivalid||ivalid1;
 
 
 
// reg  vld_iflg1 ;
//  reg vld_iflg2 ;
  
// always@(posedge clk or negedge rst)
// if(!rst)
//   vld_iflg1<=0;
// else 
//if(ivalid1==1) 
//  vld_iflg1<=1;

//  always@(posedge clk or negedge rst)
//    if(!rst)
//        vld_iflg2<=0;
//    else if(vld_iflg1==1)
//           vld_iflg2<=1;
           
//  reg ovalid1;
//  reg ovalid2;
//always@(posedge clk or negedge rst)
//    if(!rst)
//        ovalid1<=0;
//   else
//    ovalid1=((vld_iflg1^vld_iflg2)||ivalid1)&&iready;
//always@(posedge clk or negedge rst)
//    if(!rst)
//        ovalid<=0;
//    else
//        ovalid<=ovalid1;


 reg iready1;
 reg oready1;
  always@(posedge clk or negedge rst)
    if(!rst)
        iready1<=0;
    else
        iready1<=iready;
always@(posedge clk or negedge rst)
    if(!rst)
        oready<=0;
    else
     oready<=iready&iready1;
 
 always@(posedge clk or negedge rst)
    if(!rst)
        oready1<=0;
    else
     oready1<=oready;
 
 reg oready2;
 always@(posedge clk or negedge rst)
    if(!rst)
        oready2<=0;
    else
     oready2<=oready1;
 
 
  always@(posedge clk or negedge rst)
    if(!rst)
        i<=4'd0;
    else if(ovalid==1)
        if(i<11)
        i<=i+1;
        else    i<=4'd0;
         else    i<=4'd0;
 
  always@(posedge clk or negedge rst)
    if(!rst)
        olast<=0;
    else if(i==10)
        olast<=1;
          else olast<=0;
 
 
 
 
 
 
 
 
 
 
 
   
 
   
   

          
    
                       
 
   
  
 
   

    
    
    
    
    
       
   
 assign read=1;
 reg[7:0]x00;
 reg[7:0]x000;

    ROM1 rom1(
    .addr(x000),
    .clk(clk),
    .data(out1),
    .read(read)
    );
     ROM2 rom2(
    .addr(x00),
    .clk(clk),
    .data(out2),
    .read(read)
    );          
      
 always@(posedge clk or negedge rst)
    if(!rst)  
        x<=16'd0;
    else if(oready==1)
    if(ivalid2==1)
        x<=idata;         

                   
  always@(posedge clk or negedge rst)
    if(!rst)  
        x0<=8'd0;
    else if(oready==1)  
        x0<=x[15:8];
  always@(posedge clk or negedge rst)
    if(!rst)  
        x00<=8'd0;
    else if(oready==1)  
        x00<=x0;
 
          always@(posedge clk or negedge rst)
    if(!rst)  
        x000<=8'd0;
    else if(oready==1)  
        x000<=x00;

  always@(posedge clk or negedge rst)
    if(!rst)  
        x1<=8'd0;
    else if(oready==1)  
        x1<=x[7:0];
reg[7:0]x11;
always@(posedge clk or negedge rst)
    if(!rst)  
        x11<=8'd0;
    else if(oready==1)  
        x11<=x1;
  always@(posedge clk or negedge rst)
    if(!rst)  
        X1<=8'd0;
    else if(oready==1)  
        X1<=x11;
    
   assign x4=x3>>8; 
   always@(posedge clk or negedge rst)
    if(!rst)
        x3<=24'd0;
    else  if(oready==1)  
        x3<=X1*out2;
        
   always@(posedge clk or negedge rst)
    if(!rst)
        x5<=17'd0;
    else  if(oready2==1)  
        x5<=out1+x4;
        
    always@(posedge clk or negedge rst)
    if(!rst)
        X6<=32'd0;
    else if(oready==1)  
       begin
        X6<=x5*'b10; 
        end
        
    always@(posedge clk or negedge rst)
    if(!rst)
        x7<=16'd0;
        else if(oready==1)  
            x7<=X6>>1;
            
   always@(posedge clk or negedge rst)
    if(!rst)
       out<=16'd0;
    else if(oready==1)  
       out<=x7;
          
      
   always@(posedge clk or negedge rst)
    if(!rst)    
        odata<=16'd0;
    else if(oready==1)  
        odata<=out;
   

    
endmodule
