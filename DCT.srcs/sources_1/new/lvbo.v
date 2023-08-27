`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/16 15:15:49
// Design Name: 
// Module Name: lvbo
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


module filter#(
parameter M=1,
parameter C=8) 
(
clk,rst,idata,ivalid,iready,odata,ready_o1,ovalid,olast,ilast,keep,empty);
input [15:0] idata;
input clk;
input rst;
input ivalid;
input iready;
input empty;
output [15:0]odata;
output ready_o1;
output ovalid;
output olast;
input ilast;
output keep;

wire iready;
wire empty;
wire ilast;
wire [15:0] idata;
reg[15:0] odata;
wire ivalid;
reg ovalid;
wire oready; 
reg oready1;
reg iready_1;
reg oflg;
wire [1:0] keep;

wire [15:0] sum1;
wire [15:0] sum2;
wire [15:0] sum3;
wire [15:0] sum4;
wire [15:0] sum5;
wire [15:0] sum6;
wire [15:0] sum7;
wire [15:0] sum8;
wire [15:0] sum9;
wire [15:0] sum10;
wire [15:0] sum11;
wire [15:0] sum12;
reg wait_data;
reg ivalid1;
assign keep=2'b11;

always@(posedge clk or negedge rst)
 if(!rst)
    wait_data<=0;
 else if(!empty)
    wait_data<=1;
    else if(!ivalid)
    wait_data<=0;
always@(posedge clk or negedge rst)
 if(!rst)
 iready_1<=0;
 else iready_1<=iready;
always@(posedge clk or negedge rst)
 if(!rst)
 ivalid1<=0;
 else ivalid1<=ivalid;
always@(posedge clk or negedge rst)
if(!rst)
oready1<=0;                     
else oready1<=(iready&iready_1)&(ivalid&ivalid1);    
assign oready=oready1&wait_data;
wire read;
assign read=1;
reg[4:0] i;
reg [15:0] x;
reg [15:0] x1;
wire clk;
wire rst;
reg[15:0] sum; 


reg[15:0] sum_1;
reg[33:0] sumq_1;
reg[31:0] Y_1;
reg[3:0] addr_1;
wire[15:0] out_1;

reg[15:0] sum_2;
reg[33:0] sumq_2;
reg[31:0] Y_2;
wire[15:0] out_2;
reg[7:0] addr_2;

reg[15:0] sum_3;
reg[33:0] sumq_3;
reg[31:0] Y_3;
wire[15:0] out_3;
reg[7:0] addr_3;

reg[15:0] sum_4;
reg[33:0] sumq_4;
reg[31:0] Y_4;
wire[15:0] out_4;
reg[7:0] addr_4;

reg[15:0] sum_5;
reg[33:0] sumq_5;
reg[31:0] Y_5;
wire[15:0] out_5;
reg[7:0] addr_5;

reg[15:0] sum_6;
reg[33:0] sumq_6; 
reg[31:0] Y_6;
wire[15:0] out_6;
reg[7:0] addr_6;

reg[15:0] sum_7;
reg[33:0] sumq_7;
reg[31:0] Y_7;
wire[15:0] out_7;
reg[7:0] addr_7;

reg[15:0] sum_8;
reg[33:0] sumq_8;
reg[31:0] Y_8;
wire[15:0] out_8;
reg[7:0] addr_8;

reg[15:0] sum_9;
reg[33:0] sumq_9;
reg[31:0] Y_9;
wire[15:0] out_9;
reg[7:0] addr_9;

reg[15:0] sum_10;
reg[33:0] sumq_10;
reg[31:0] Y_10;
wire[15:0] out_10;
reg[7:0] addr_10;

reg[15:0] sum_11;
reg[33:0] sumq_11;
reg[31:0] Y_11;
wire[15:0] out_11;
reg[7:0] addr_11;

reg[15:0] sum_12;
reg[33:0] sumq_12;
reg[31:0] Y_12;
wire[15:0] out_12;
reg[7:0] addr_12;

wire[15:0] out_1_1;
wire[15:0] out_2_1;
wire[15:0] out_3_1;
wire[15:0] out_4_1;
wire[15:0] out_5_1;
wire[15:0] out_6_1;
wire[15:0] out_7_1;
wire[15:0] out_8_1;
wire[15:0] out_9_1;
wire[15:0] out_10_1;
wire[15:0] out_11_1;
wire[15:0] out_12_1;
reg b;

rom1 i1(
.addr(addr_1),
.data(out_1),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom2 i2(
.addr(addr_1),
.data(out_2),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom3 i3(
.addr(addr_1),
.data(out_3),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom4 i4(
.addr(addr_1),
.data(out_4),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom5 i5(
.addr(addr_1),
.data(out_5),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom6 i6(
.addr(addr_1),
.data(out_6),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom7 i7(
.addr(addr_1),
.data(out_7),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom8 i8(
.addr(addr_1),
.data(out_8),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom9 i9(
.addr(addr_1),
.data(out_9),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom10 i10(
.addr(addr_1),
.data(out_10),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom11 i11(
.addr(addr_1),
.data(out_11),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom12 i12(
.addr(addr_1),
.data(out_12),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

assign sum1=sumq_1>>18;
assign sum2=sumq_2>>18;
assign sum3=sumq_3>>18;
assign sum4=sumq_4>>18;
assign sum5=sumq_5>>18;
assign sum6=sumq_6>>18;
assign sum7=sumq_7>>18;
assign sum8=sumq_8>>18;
assign sum9=sumq_9>>18;
assign sum10=sumq_10>>18;
assign sum11=sumq_11>>18;
assign sum12=sumq_12>>18;

    
always@(posedge clk or negedge rst)
    if(!rst)  
    begin
        x<=16'd0;
        end
    else if(oready)
        x<=x1;   
         
always@(posedge clk or negedge rst)
    if(!rst)  
    begin
        x1<=16'd0;
        end
    else if(oready)
        x1<=idata;         
             
always@(posedge clk or negedge rst)
     if(!rst)
        i<=5'd0;
     else if(oflg&iready)
              i<=i+1;  
          else if(!oflg)
            i<=0;
                
      
always@(posedge clk or negedge rst)
    if(!rst)
b<=0;
else if (i>0)
    begin
    if (i<13)
    b<=1;
    else
        b<=0;
    end
else   b<=0;

assign out_1_1=b?out_1:16'b0;
assign out_2_1=b?out_2:16'b0;
assign out_3_1=b?out_3:16'b0;
assign out_4_1=b?out_4:16'b0;
assign out_5_1=b?out_5:16'b0;
assign out_6_1=b?out_6:16'b0;
assign out_7_1=b?out_7:16'b0;
assign out_8_1=b?out_8:16'b0;
assign out_9_1=b?out_9:16'b0;
assign out_10_1=b?out_10:16'b0;
assign out_11_1=b?out_11:16'b0;
assign out_12_1=b?out_12:16'b0;

wire ready_o1;
assign ready_o1=oready&(i<11);


//运算模块1
always@(posedge clk or negedge rst)
    if(!rst)
        addr_1<=4'b0;
        
    else if (oready)
        addr_1<=i;
                    
always@(posedge clk or negedge rst)
        if (!rst)
            Y_1<=32'b0;
        else  if(i>29)Y_1<=32'b0;
        else if (oready) 
            begin  
                if((i<14)&(i>1))      
                    Y_1<={{16{x[15]}},x} * {{16{out_1_1[15]}},out_1_1};
            else Y_1<=32'b0;   
            end        
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_1<=0;
        else if(i>29)
                     sumq_1<=0; 
        else         
            if(((i>1)&(i<15))&(oready))
                   sumq_1<=sumq_1+{{2{Y_1[31]}},Y_1};    
                         
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_1<=0;
        else  if (iready)
        begin
        if(i>15)
            sum_1<=sum1;
    
       end

//运算模块2    
always@(posedge clk or negedge rst)
        if (!rst)
            Y_2<=32'b0;
        else  if(i>29)Y_2<=32'b0;
        else if (oready) 
            begin  
                if((i<14)&(i>1))      
                    Y_2<={{16{x[15]}},x} * {{16{out_2_1[15]}},out_2_1};
            else Y_2<=32'b0;   
            end        
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_2<=0;
        else if(i>29)
                     sumq_2<=0; 
        else         
            if(((i>1)&(i<15))&(oready))
                   sumq_2<=sumq_2+{{2{Y_2[31]}},Y_2};   
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_2<=16'b0;
        else  if (iready)
        begin
        if(i>15)
            sum_2<=sum2;
    
       end
       
//运算模块3                  
always@(posedge clk or negedge rst)
        if (!rst)
            Y_3<=32'b0;
        else  if(i>29)Y_3<=32'b0;
        else if (oready) 
            begin  
                if((i<14)&(i>1))      
                    Y_3<={{16{x[15]}},x} * {{16{out_3_1[15]}},out_3_1};
            else Y_3<=32'b0;   
            end        
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_3<=0;
        else if(i>29)
                     sumq_3<=0; 
        else         
            if(((i>1)&(i<15))&(oready))
                   sumq_3<=sumq_3+{{2{Y_3[31]}},Y_3};   
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_3<=0;
        else  if (iready)
        begin
        if(i>15)
            sum_3<=sum3;
    
       end

//运算模块4
always@(posedge clk or negedge rst)
        if (!rst)
            Y_4<=32'b0;
        else  if(i>29)Y_4<=32'b0;
        else if (oready) 
            begin  
                if((i<14)&(i>1))      
                    Y_4<={{16{x[15]}},x} * {{16{out_4_1[15]}},out_4_1};
            else Y_4<=32'b0;   
            end        
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_4<=0;
        else if(i>29)
                     sumq_4<=0; 
        else         
            if(((i>1)&(i<15))&(oready))
                   sumq_4<=sumq_4+{{2{Y_4[31]}},Y_4};  
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_4<=0;
        else  if (iready)
        begin
        if(i>15)
            sum_4<=sum4;
    
       end
       
 //运算模块5
always@(posedge clk or negedge rst)
        if (!rst)
            Y_5<=32'b0;
        else  if(i>29)Y_5<=32'b0;
        else if (oready) 
            begin  
                if((i<14)&(i>1))      
                    Y_5<={{16{x[15]}},x} * {{16{out_5_1[15]}},out_5_1};
            else Y_5<=32'b0;   
            end        
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_5<=0;
        else if(i>29)
                     sumq_5<=0; 
        else         
            if(((i>1)&(i<15))&(oready))
                   sumq_5<=sumq_5+{{2{Y_5[31]}},Y_5};  
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_5<=0;
        else  if (iready)
        begin
        if(i>15)
            sum_5<=sum5;
    
       end

 //运算模块6
 always@(posedge clk or negedge rst)
        if (!rst)
            Y_6<=32'b0;
        else  if(i>29)Y_6<=32'b0;
        else if (oready) 
            begin  
                if((i<14)&(i>1))      
                    Y_6<={{16{x[15]}},x} * {{16{out_6_1[15]}},out_6_1};
            else Y_6<=32'b0;   
            end        
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_6<=0;
        else if(i>29)
                     sumq_6<=0; 
        else         
            if(((i>1)&(i<15))&(oready))
                   sumq_6<=sumq_6+{{2{Y_6[31]}},Y_6};  
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_6<=0;
        else  if (iready)
        begin
        if(i>15)
            sum_6<=sum6;
    
       end
       
//运算模块7              
always@(posedge clk or negedge rst)
        if (!rst)
            Y_7<=32'b0;
        else  if(i>29)Y_7<=32'b0;
        else if (oready) 
            begin  
                if((i<14)&(i>1))      
                    Y_7<={{16{x[15]}},x} * {{16{out_7_1[15]}},out_7_1};
            else Y_7<=32'b0;   
            end        
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_7<=0;
        else if(i>29)
                     sumq_7<=0; 
        else         
            if(((i>1)&(i<15))&(oready))
                   sumq_7<=sumq_7+{{2{Y_7[31]}},Y_7};  
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_7<=0;
        else  if (iready)
        begin
        if(i>15)
            sum_7<=sum7;
    
       end
       
 //运算模块8              
always@(posedge clk or negedge rst)
        if (!rst)
            Y_8<=32'b0;
        else  if(i>29)Y_8<=32'b0;
        else if (oready) 
            begin  
                if((i<14)&(i>1))      
                    Y_8<={{16{x[15]}},x} * {{16{out_8_1[15]}},out_8_1};
            else Y_8<=32'b0;   
            end        
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_8<=0;
        else if(i>29)
                     sumq_8<=0; 
        else         
            if(((i>1)&(i<15))&(oready))
                   sumq_8<=sumq_8+{{2{Y_8[31]}},Y_8};  
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_8<=0;
        else  if (iready)
        begin
        if(i>15)
            sum_8<=sum8;
    
       end
 //运算模块9              
always@(posedge clk or negedge rst)
        if (!rst)
            Y_9<=32'b0;
        else  if(i>29)Y_9<=32'b0;
        else if (oready) 
            begin  
                if((i<14)&(i>1))      
                    Y_9<={{16{x[15]}},x} * {{16{out_9_1[15]}},out_9_1};
            else Y_9<=32'b0;   
            end        
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_9<=0;
        else if(i>29)
                     sumq_9<=0; 
        else         
            if(((i>1)&(i<15))&(oready))
                   sumq_9<=sumq_9+{{2{Y_9[31]}},Y_9};  
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_9<=0;
        else  if (iready)
        begin
        if(i>15)
            sum_9<=sum9;
    
       end
       
 //运算模块10              
always@(posedge clk or negedge rst)
        if (!rst)
            Y_10<=32'b0;
        else  if(i>29)Y_10<=32'b0;
        else if (oready) 
            begin  
                if((i<14)&(i>1))      
                    Y_10<={{16{x[15]}},x} * {{16{out_10_1[15]}},out_10_1};
            else Y_10<=32'b0;   
            end        
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_10<=0;
        else if(i>29)
                     sumq_10<=0; 
        else         
            if(((i>1)&(i<15))&(oready))
                   sumq_10<=sumq_10+{{2{Y_10[31]}},Y_10};  
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_10<=0;
        else  if (iready)
        begin
        if(i>15)
            sum_10<=sum10;
    
       end
 
 //运算模块11
 always@(posedge clk or negedge rst)
        if (!rst)
            Y_11<=32'b0;
        else  if(i>29)Y_11<=32'b0;
        else if (oready) 
            begin  
                if((i<14)&(i>1))      
                    Y_11<={{16{x[15]}},x} * {{16{out_11_1[15]}},out_11_1};
            else Y_11<=32'b0;   
            end        
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_11<=0;
        else if(i>29)
                     sumq_11<=0; 
        else         
            if(((i>1)&(i<15))&(oready))
                   sumq_11<=sumq_11+{{2{Y_11[31]}},Y_11};  
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_11<=16'b0;
        else  if (iready)
        begin
        if(i>15)
            sum_11<=sum11;
    
       end

 //运算模块12              
always@(posedge clk or negedge rst)
        if (!rst)
            Y_12<=32'b0;
        else  if(i>29)Y_12<=32'b0;
        else if (oready) 
            begin  
                if((i<14)&(i>1))      
                    Y_12<={{16{x[15]}},x} * {{16{out_12_1[15]}},out_12_1};
            else Y_12<=32'b0;   
            end        
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_12<=0;
        else if(i>29)
                     sumq_12<=0; 
        else         
            if(((i>1)&(i<15))&(oready))
                   sumq_12<=sumq_12+{{2{Y_12[31]}},Y_12};  
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_12<=0;
        else if (iready)
        begin
        if(i>15)
            sum_12<=sum12;
    
       end

reg [4:0] sel;  
wire [3:0] sel1;   


always@(posedge clk or negedge rst)
    if(!rst)
       ovalid<=0;
   else
                   if((sel>17)&(sel<30)&wait_data)
                       ovalid<=1;
                   else 
                       ovalid<=0;
   

reg olast;
always@(posedge clk or negedge rst)
if(!rst)
        olast<=0;  
else if((sel>29)&(sel<31))
olast<=0;
else
    olast<=0;

always@(*)
if(!rst)
        oflg=0;  
else  if(sel>30)
         oflg=0;  
    else if(oready)
         oflg=1;  
    else
            oflg=oflg;
always@(posedge clk or negedge rst)
    if(!rst)
        sel<=0;
    else if (iready&oflg)
         sel<=sel+1;
         else if(!oflg)
            sel<=0;
assign sel1=(sel<18)?14:(sel-18);
//轮流输出12个sum
always@(*) 
                       case(sel1)
                        4'b0000:begin
                       
                            sum=sum_1;
                            
                       end
                        4'b0001:begin
                           
                            sum=sum_2;
                           
                       end
                        4'b0010:begin
                            sum=sum_3;
                       end 
                        4'b0011:begin
                            sum=sum_4;
                       end 
                        4'b0100:begin
                            sum=sum_5;
                       end 
                        4'b0101:begin
                            sum=sum_6;
                       end 
                        4'b0110:begin
                            sum=sum_7;
                       end 
                        4'b0111:begin
                            sum=sum_8;
                       end 
                        4'b1000:begin
                            sum=sum_9;
                       end 
                        4'b1001:begin
                            sum=sum_10;
                       end 
                        4'b1010:begin
                            sum=sum_11;
                       end 
                       4'b1011:begin
                            sum=sum_12;
                       end 
                       default:begin
                            sum=sum;
                       end
                       endcase       
         
always@(posedge clk or negedge rst)
    if(!rst)
        odata<=0;
else if (iready&oflg)
    odata<=sum;
                                          
endmodule
