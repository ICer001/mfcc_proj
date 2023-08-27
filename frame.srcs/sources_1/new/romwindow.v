`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/13 19:22:05
// Design Name: 
// Module Name: romwindow
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/06 19:57:03
// Design Name: 
// Module Name: r1
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



module romwindow#(parameter depth=512,parameter width=16,parameter addres=9 ,file0="D:/mfcc001/frame/win.txt")
(data,addr,read,clk);
output [width-1:0]  data;
input  [addres-1:0]  addr;
input     read;
input         clk;
reg    [width-1:0]  memory [depth:1];
wire   [width-1:0]  data;
reg [addres-1:0] addr_1;

always@(posedge clk) 
begin
addr_1<=addr;
end
 
assign data = read ? memory[addr_1] : 'hzz;//read信号高电平有效时赋值addr，无效赋值8'hzz

initial
begin
 $readmemb(file0,memory);  //这个memory就是上面定义的reg memory。
end

endmodule

