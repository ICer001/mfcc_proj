`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/04 22:15:2  7
// Design Name: 
// Module Name: rom
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


module rom12#(parameter depth=128,parameter width=16,parameter addres=7,parameter file="d:/mfcc001/project_lvbo/filter12.txt")
(data,addr,read,clk,ivalid,oready);
output [width-1:0]   data;
input  [addres-1:0]  addr;
input 		  read;
input         clk;
input ivalid;
input oready;

wire ivalid;
wire oready;
reg    [width-1:0]  memory [depth-1:0];
wire  [width-1:0] data;
reg [addres-1:0] addr1;

always@(posedge clk)
if(ivalid&&oready) 
begin
addr1<=addr;
end

assign data = read ? memory[addr1] :16'hzz;//read信号高电平有效时赋值addr，无效赋值16'hzz

initial
begin
$readmemb(file,memory);
//	$readmemb("E:/Xilinx/filter1.TXT",memory);  //这个memory就是上面定义的reg memory。
end

 
endmodule

  
    
    



  
    
    

