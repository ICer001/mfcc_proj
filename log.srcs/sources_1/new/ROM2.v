`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/16 09:52:51
// Design Name: 
// Module Name: ROM2
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

module ROM2#(parameter depth=256,parameter width=16,parameter addres=8,parameter file="D:/mfcc001/log/log2.txt" )
(data,addr,read,clk);
output [width-1:0]  data;
input  [addres-1:0]  addr;
input     read;
input         clk;
reg    [width-1:0]  memory [depth-1:0];
wire   [width-1:0]  data;
reg [addres-1:0] addr_1;

always@(posedge clk) 
begin
addr_1=addr;
end
 
assign data = read ? memory[addr_1] : 8'hzz;//read信号高电平有效时赋值addr，无效赋值8'hzz

initial
begin
$readmemb(file,memory);
// $readmemb("C:\\Users\\Administrator\\Desktop\\log5.txt",memory);  //这个memory就是上面定义的reg memory。
end

endmodule
