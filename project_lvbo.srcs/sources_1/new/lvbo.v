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


module filter(
clk,rst,idata,ivalid,iready,odata,oready,ovalid,olast,ilast,keep);
input [15:0] idata;
input clk;
input rst;
input ivalid;
input iready;
output [15:0]odata;
output oready;
output ovalid;
output olast;
input ilast;
output keep;

wire ilast;
wire [15:0] idata;
reg[15:0] odata;
wire ivalid;
wire iready;
reg ovalid;
reg oready; 
reg iready_1;
reg iready_2;
wire [1:0] keep;

reg[15:0] out_1_1;

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

assign keep=2'b11;

always@(posedge clk or negedge rst)
 if(!rst)
 iready_1<=0;
 else iready_1<=iready;
always@(posedge clk or negedge rst)
 if(!rst)
 iready_2<=0;
 else iready_2<=iready_1;



always@(posedge clk or negedge rst)
if(!rst)
oready<=0;                     
else oready<=iready&&iready_1&&ivalid&&iready_2;                                                                                     

wire read;
assign read=1;
reg[7:0] i;
reg [15:0] x;
wire clk;
wire rst;
reg[15:0] sum; 


reg[15:0] sum_1;
reg[33:0] sumq_1;
reg[31:0] Y_1;
reg[7:0] addr_1;
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

rom1 i1(
.addr(addr_1),
.data(out_1),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom2 i2(
.addr(addr_2),
.data(out_2),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom3 i3(
.addr(addr_3),
.data(out_3),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom4 i4(
.addr(addr_4),
.data(out_4),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom5 i5(
.addr(addr_5),
.data(out_5),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom6 i6(
.addr(addr_6),
.data(out_6),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom7 i7(
.addr(addr_7),
.data(out_7),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom8 i8(
.addr(addr_8),
.data(out_8),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom9 i9(
.addr(addr_9),
.data(out_9),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom10 i10(
.addr(addr_10),
.data(out_10),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom11 i11(
.addr(addr_11),
.data(out_11),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

rom12 i12(
.addr(addr_12),
.data(out_12),
.read(read),
.clk(clk),
.ivalid(ivalid),
.oready(oready)
);

assign sum1=sumq_1>>14;
assign sum2=sumq_2>>14;
assign sum3=sumq_3>>14;
assign sum4=sumq_4>>14;
assign sum5=sumq_5>>14;
assign sum6=sumq_6>>14;
assign sum7=sumq_7>>14;
assign sum8=sumq_8>>14;
assign sum9=sumq_9>>14;
assign sum10=sumq_10>>14;
assign sum11=sumq_11>>14;
assign sum12=sumq_12>>14;

wire ivalid_i0;



data_delay diaoyong(
.clk(clk),
.data_in(ivalid),
.data_out(ivalid_i0)
);

    
    
always@(posedge clk or negedge rst)
    if(!rst)  
    begin
        x<=16'd0;
        end
    else if(ivalid&&oready)
        x<=idata;                   
       
             
always@(posedge clk or negedge rst)
     if(!rst)
        i<=0;
     else if(oready&ivalid)
            i<=i+1;
          else if((!i)|(i==13))
            i<=i+1;
            
      
 
 //运算模块1 
 always@(posedge clk or negedge rst)
    if(!rst)
    out_1_1<=0;
    else if(oready&&ivalid)
    out_1_1<=out_1;
    
 always@(posedge clk or negedge rst)
    if(!rst)
        addr_1<=3'b0;
        
    else if (oready&&ivalid)
        addr_1<=i;
                    
always@(posedge clk or negedge rst)
        if (!rst)
            Y_1<=32'b0;
        else if (oready&&ivalid)
        if (i>2)
                   begin
                if(i<11)       
                    Y_1<=out_1_1*x;
                else Y_1<=32'b0;
                end
        else Y_1<=32'b0;               
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_1<=34'b0;
        else if (oready&&ivalid)
        if(i>1)
            begin
                if(i<255)
                 sumq_1<=sumq_1+Y_1;
                else
                 sumq_1<=34'b0;
            end
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_1<=16'b0;
        else if (oready==1)
        begin
        if(i==254)
            sum_1<=sum1;
      else
            sum_1<=16'b0;
       end

//运算模块2  
always@(posedge clk or negedge rst)
    if(!rst)
        addr_2<=4'b0;
        
    else if (oready&&ivalid)
        addr_2<=i-5;
            
always@(posedge clk or negedge rst)
        if (!rst)
            Y_2<=32'b0;
       else if (oready&&ivalid)
       if(i>6)
            begin
            if(i<16)
            Y_2<=out_2*x;
            else Y_2<=32'b0;
            end
       else Y_2<=32'b0;   
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_2<=34'b0;
        else if (oready&&ivalid)
        if(i>1)
            begin
                if(i<255)
                 sumq_2=sumq_2+Y_2;
                else
                 sumq_2<=34'b0;
            end
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_2<=16'b0;
        else if (oready==1)
         begin
        if(i==254)
            sum_2<=sum2;
      else
            sum_2<=16'b0;
       end 
       
//运算模块3 
always@(posedge clk or negedge rst)
    if(!rst)
        addr_3<=4'b0;
        
    else if (oready&&ivalid)
        addr_3<=i-10;
        
                         
always@(posedge clk or negedge rst)
        if (!rst)
            Y_3<=32'b0;
       else if (oready&&ivalid)
       if(i>11)
            begin
            if(i<24)
            Y_3<=out_3*x;
            else Y_3<=34'd0;
            end
       else Y_3<=32'd0; 
          
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_3<=16'b0;
        else if (oready&&ivalid)
         if(i>1)
            begin
                if(i<255)
                 sumq_3<=sumq_3+Y_3;
                else
                 sumq_3<=16'b0;
            end
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_3<=16'b0;
        else if (oready==1)
        begin
        if(i==254)
            sum_3<=sum3;
      else
            sum_3<=16'b0;
       end

//运算模块4
always@(posedge clk or negedge rst)
    if(!rst)
        addr_4<=4'b0;
        
    else if (oready&&ivalid)
        addr_4<=i-15;
                
                      
always@(posedge clk or negedge rst)
        if (!rst)
            Y_4<=32'b0;
       else if (oready&&ivalid)
       if(i>16)
            begin
            if(i<33)
            Y_4<=out_4*x;
            else Y_4<=32'b0;
            end
       else Y_4<=32'b0;  
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_4<=34'b0;
        else if (oready&&ivalid)
        if(i>17)
            begin
                if(i<255)
                 sumq_4=sumq_4+Y_4;
                else
                 sumq_4<=34'b0;
            end
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_4<=16'b0;
        else if (oready==1)
        begin
        if(i==254)
            sum_4<=sum4;
      else
            sum_4<=16'b0;
       end
       
 //运算模块5
 always@(posedge clk or negedge rst)
    if(!rst)
        addr_5<=5'b0;
        
    else if (oready&&ivalid)
        addr_5<=i-23;
                
                      
always@(posedge clk or negedge rst)
        if (!rst)
            Y_5<=32'b0;
       else if (oready&&ivalid)
       if(i>24)
            begin
            if(i<43)
            Y_5<=out_5*x;
            else Y_5<=34'b0;
            end
       else Y_5<=32'b0;

always@(posedge clk or negedge rst)
        if(!rst)
            sumq_5<=16'b0;
        else if (oready&&ivalid)
        if(i>25)
            begin
                if(i<255)
                 sumq_5<=sumq_5+Y_5;
                else
                 sumq_5<=16'b0;
            end
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_5<=16'b0;
        else if (oready==1)
        begin
        if(i==254)
            sum_5<=sum5;
      else
            sum_5<=16'b0;
       end       

 //运算模块6
 always@(posedge clk or negedge rst)
    if(!rst)
        addr_6<=5'b0;
        
    else if (oready&&ivalid)
        addr_6<=i-31;
                                        
always@(posedge clk or negedge rst)
        if (!rst)
            Y_6<=32'b0;
       else if (oready&&ivalid)
        if(i>33)
            begin
            if(i<57)
            Y_6<=out_6*x;
            else Y_6<=32'd0;
            end
       else Y_6<=32'b0;

always@(posedge clk or negedge rst)
        if(!rst)
            sumq_6<=34'b0;
        else if (oready&&ivalid)
        if(i>1)
            begin
                if(i<255)
                 sumq_6<=sumq_6+Y_6;
                else
                 sumq_6<=34'b0;
            end
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_6<=16'b0;
        else if (oready==1)
        begin
        if(i==254)
            sum_6<=sum6;
      else
            sum_6<=16'b0;
       end
       
//运算模块7              
 always@(posedge clk or negedge rst)
    if(!rst)
        addr_7<=5'b0;
        
    else if (oready&&ivalid)
        addr_7<=i-42;
                
                      
always@(posedge clk or negedge rst)
        if (!rst)
            Y_7<=32'b0;
       else if (oready&&ivalid)
        if(i>43)
            begin
            if(i<73)
            Y_7<=out_7*x;
            else Y_7<=32'b0;
            end
       else Y_7<=32'b0;   
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_7<=34'b0;
        else if (oready&&ivalid)
        if(i>1)
            begin
                if(i<255)
                 sumq_7<=sumq_7+Y_7;
                else
                 sumq_7<=34'b0;
            end
        
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_7<=16'b0;
        else if (oready==1)
         begin
        if(i==254)
            sum_7<=sum7;
      else
            sum_7<=16'b0;
       end
       
 //运算模块8              
 always@(posedge clk or negedge rst)
    if(!rst)
        addr_8<=6'b0;
        
    else if (oready&&ivalid)
        addr_8<=i-56;
                
                      
always@(posedge clk or negedge rst)
        if (!rst)
            Y_8<=32'b0;
       else if (oready&&ivalid)
       if(i>57)
            begin
            if(i<94)
            Y_8<=out_8*x;
            else Y_8<=32'b0;
            end
       else Y_8<=32'b0;   
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_8<=34'b0;
        else if (oready&&ivalid)
        if(i>1)
            begin
                if(i<255)
                 sumq_8<=sumq_8+Y_8;
                else
                 sumq_8<=34'b0;
            end
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_8<=16'b0;
        else if (oready==1)begin
        if(i==254)
            sum_8<=sum8;
      else
            sum_8<=16'b0;
       end
       
 //运算模块9              
always@(posedge clk or negedge rst)
    if(!rst)
        addr_9<=6'b0;
        
    else  if (oready&&ivalid)
        addr_9<=i-72;
                
                      
always@(posedge clk or negedge rst)
        if (!rst)
            Y_9<=32'b0;
       else  if (oready&&ivalid)
        if(i>73)
            begin
            if(i<119)
            Y_9<=out_9*x;
            else Y_9<=32'b0;
            end
       else Y_9<=32'b0;     
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_9<=34'b0;
        else  if (oready&&ivalid)
        if(i>1)
            begin
                if(i<255)
                 sumq_9<=sumq_9+Y_9;
                else
                 sumq_9<=34'b0;
            end
            
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_9<=16'b0;
        else  if (oready==1)
        begin
        if(i==254)
            sum_9<=sum9;
      else
            sum_9<=16'b0;
       end
       
 //运算模块10              
always@(posedge clk or negedge rst)
    if(!rst)
        addr_10<=6'b0;
        
    else  if (oready&&ivalid)
        addr_10<=i-93;
                
                      
always@(posedge clk or negedge rst)
        if (!rst)
            Y_10<=32'b0;
       else  if (oready&&ivalid)
       if(i>94)
            begin
            if(i<150)
            Y_10<=out_10*x;
            else Y_10<=32'b0;
            end
       else Y_10<=32'b0;   
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_10<=34'b0;
        else  if (oready&&ivalid)
         if(i>1)
            begin
                if(i<255)
                 sumq_10<=sumq_10+Y_10;
                else
                 sumq_10<=34'b0;
            end
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_10<=16'b0;
        else  if (oready==1)
        begin
        if(i==254)
            sum_10<=sum10;
      else
            sum_10<=16'b0;
       end
 
 //运算模块11
 always@(posedge clk or negedge rst)
    if(!rst)
        addr_11<=7'b0;
        
    else  if (oready&&ivalid)
        addr_11<=i-118;
                
                      
always@(posedge clk or negedge rst)
        if (!rst)
            Y_11<=32'b0;
       else  if (oready&&ivalid)
        if(i>119)
            begin
            if(i<187)
            Y_11<=out_11*x;
            else Y_11<=32'b0;
            end
       else Y_11<=32'b0;   
               

always@(posedge clk or negedge rst)
        if(!rst)
            sumq_11<=34'b0;
        else  if (oready&&ivalid)
        if(i>1)
            begin
                if(i<255)
                 sumq_11<=sumq_11+Y_11;
                else
                 sumq_11<=34'b0;
            end
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_11<=16'b0;
        else  if (oready==1)
        begin
        if(i==254)
            sum_11<=sum11;
      else
            sum_11<=16'b0;
       end       

 //运算模块12              
always@(posedge clk or negedge rst)
    if(!rst)
        addr_12<=7'b0;
        
    else  if (oready&&ivalid)
        addr_12<=i-149;
                
                      
always@(posedge clk or negedge rst)
        if (!rst)
            Y_12<=32'b0;
       else  if (oready&&ivalid)
       if(i>150)
            begin
            if(i<234)
            Y_12<=out_12*x;
            
            else Y_12<=32'b0;
            end
       else Y_12<=32'b0;     
                       
always@(posedge clk or negedge rst)
        if(!rst)
            sumq_12<=34'b0;
        else  if (oready&&ivalid)
        if(i>1)
            begin
                if(i<255)
                 sumq_12<=sumq_12+Y_12;
                else
                 sumq_12<=34'b0;
            end
                    
always@(posedge clk or negedge rst)
        if(!rst)     
            sum_12<=16'b0;
        else  if (oready==1)
        begin
        if(i==254)
            sum_12<=sum12;
      else
            sum_12<=16'b0;
       end


reg ivalid_q1;
reg ivalid_q2;

always@(posedge clk or negedge rst)
if(!rst)
ivalid_q1<=0;
else if(ivalid_i0==1)
ivalid_q1<=1;

always@(posedge clk or negedge rst)
if(!rst)
ivalid_q2<=0;
else if(ivalid_q1==1)
ivalid_q2<=1;


reg c;
always@(posedge clk or negedge rst)
    if(!rst)
        c<=0;
    else if(oready==1)
        begin
        if (i==255)
            c<=1;
        end
    
    
always@(posedge clk or negedge rst)
    if(!rst)
       ovalid<=0;
   else  if (c>0)
       begin
            if((i<13)&(i>1))
                     begin
                            ovalid<=1;
                       end
            else 
                if((oready&ivalid)&(i==1))
                        ovalid<=1;
                  else
                    ovalid<=0;
          end
  else ovalid<=0;
   



    reg olast;

always@(posedge clk or negedge rst)
if(!rst)
    begin
        olast<=0;
    end    
else
    begin
        if(c)
          begin
            if(i==12)
                begin
                    olast<=1;//mark
                end
            else olast<=0;
           end
         else olast<=0;
    end




reg[15:0] sum_1q;
reg[15:0] sum_2q;
reg[15:0] sum_3q;
reg[15:0] sum_4q;
reg[15:0] sum_5q;
reg[15:0] sum_6q;
reg[15:0] sum_7q;
reg[15:0] sum_8q;
reg[15:0] sum_9q;
reg[15:0] sum_10q;
reg[15:0] sum_11q;
reg[15:0] sum_12q;

always@(posedge clk or negedge rst)
if(!rst)
sum_1q<=0;
else 
begin
    if(oready==1)
    begin
    if(i==255)
        sum_1q<=sum_1;
        end       
  
        end     

always@(posedge clk or negedge rst)
if(!rst)
sum_2q<=0;
else begin
    if(oready==1)
    begin
    if(i==255)
        sum_2q<=sum_2;
        end      
               end
        
always@(posedge clk or negedge rst)
if(!rst)
sum_3q<=0;
else 
begin
    if(oready==1)
    begin
    if(i==255)
        sum_3q<=sum_3;
        end       
  
        end  
                
always@(posedge clk or negedge rst)
if(!rst)
sum_4q<=0;
else 
begin
    if(oready==1)
    begin
    if(i==255)
        sum_4q<=sum_4;
        end       
  
        end 

always@(posedge clk or negedge rst)
if(!rst)
sum_5q<=0;
else 
begin
    if(oready==1)
    begin
    if(i==255)
        sum_5q<=sum_5;
        end       
  
        end 

always@(posedge clk or negedge rst)
if(!rst)
sum_6q<=0;
else 
begin
    if(oready==1)
    begin
    if(i==255)
        sum_6q<=sum_6;
        end       
  
        end 
                                                                           
always@(posedge clk or negedge rst)
if(!rst)
sum_7q<=0;
else 
begin
    if(oready==1)
    begin
    if(i==255)
        sum_7q<=sum_7;
        end       
        end  
        
always@(posedge clk or negedge rst)
if(!rst)
sum_8q<=0;
else 
begin
    if(oready==1)
    begin
    if(i==255)
        sum_8q<=sum_8;
        end        
        end  
        
always@(posedge clk or negedge rst)
if(!rst)
sum_9q<=0;
else 
begin
    if(oready==1)
    begin
    if(i==255)
        sum_9q<=sum_9;
        end       
  
        end                                  

always@(posedge clk or negedge rst)
if(!rst)
sum_10q<=0;
else 
begin
    if(oready==1)
    begin
    if(i==255)
        sum_10q<=sum_10;
        end       
  
        end 

always@(posedge clk or negedge rst)
if(!rst)
sum_11q<=0;
else 
begin
    if(oready==1)
    begin
    if(i==255)
        sum_11q<=sum_11;
        end       
  
        end  

always@(posedge clk or negedge rst)
if(!rst)
sum_12q<=0;
else 
begin
    if(oready==1)
    begin
    if(i==255)
        sum_12q<=sum_12;
        end       
  
        end                
 // 
 reg [3:0] sel;     
always@(posedge clk or negedge rst)
    if(!rst)
        sel<=0;
    else if (oready&&ivalid)
         sel<=sel+1;
        
        else sel<=sel;

//轮流输出12个sum
always@(*)
begin 
if (oready==1)
                       case(sel)
                        4'b0000:begin
                       
                            sum=sum_1q;
                            
                       end
                        4'b0001:begin
                           
                            sum=sum_2q;
                           
                       end
                        4'b0010:begin
                            sum=sum_3q;
                       end 
                        4'b0011:begin
                            sum=sum_4q;
                       end 
                        4'b0100:begin
                            sum=sum_5q;
                       end 
                        4'b0101:begin
                            sum=sum_6q;
                       end 
                        4'b0110:begin
                            sum=sum_7q;
                       end 
                        4'b0111:begin
                            sum=sum_8q;
                       end 
                        4'b1000:begin
                            sum=sum_9q;
                       end 
                        4'b1001:begin
                            sum=sum_10q;
                       end 
                        4'b1010:begin
                            sum=sum_11q;
                       end 
                       4'b1011:begin
                            sum=sum_12q;
                       end 
                       default:begin
                            sum=sum;
                       end
                       endcase
                       
    end


        
         
always@(posedge clk or negedge rst)
    if(!rst)
        odata<=0;
else odata<=sum;
     
  
  
                                          
endmodule
