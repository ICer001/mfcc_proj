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


module rom#(parameter depth=16,parameter width=16,parameter addres=4,
parameter file="D:\\mfcc001\\ML\\LLL.txt")
(data,addr,read,clk);
//,iready,oready,ivalid);
output [width-1:0]   data;
input  [addres-1:0]  addr;
input 		  read;
input         clk;
//input         iready;
//input         ivalid;
//output        oready;


reg    [width-1:0]  memory [depth-1:0];
wire  [width-1:0] data;
reg [addres-1:0] addr1;
//wire iready;
//wire oready;
//wire ivalid;

always@(posedge clk) 
begin
addr1=addr;
end

assign data = read ? memory[addr1] :16'hzz;//read信号高电平有效时赋值addr，无效赋值16'hzz

initial
begin
//$readmemb(file,memory);
	$readmemb(file,memory);  //这个memory就是上面定义的reg memory。
end

 
endmodule

  
    
    



  
    
    

