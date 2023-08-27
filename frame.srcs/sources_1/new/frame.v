`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/02 20:44:17
// Design Name: 
// Module Name: frame
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

module frame#(parameter FL_H='d250)//FL:500)
(
//system define
input clk,
input rstn,

//axi-in
input [15:0]f_data,
input vld_i,
input last_i,
output reg ready_o,

//axi-out
output reg vld_o,
input ready_i,
output reg last_o,
output reg [15:0]winout,
output wire [1:0]keep
    );
assign keep=2'b11;    

wire [15:0]connect;//ram output wire
wire [15:0]ramAout;
wire [15:0]ramBout;

reg [15:0]f_data0;//reged input;
reg [15:0]f_data1;
reg [7:0]accu;//8 digits accumulator
wire [7:0]accu0;
reg [2:0]state;//5 state machine
reg [1:0]rd_en;//first digit ramA,second digit ramB
reg [1:0]wt_en;//first digit ramA,second digit ramB
reg [15:0]f_out;

//addresses
reg [8:0]addra;
reg [8:0]addwa;
reg [8:0]addrb;
reg [8:0]addwb;
reg [8:0]addrom;
reg [8:0]addrom1;
reg [8:0]addrom2;
wire [8:0]addromw;

//window tmp
reg [31:0]w0;
wire [15:0]windata;//window func;


//stop logic
reg [2:0]timer;
reg stop_flg;
reg stop_flg0;
reg stop_flg00;
reg stop_flg1;


//---------axi4 sigs
wire last_o1;//last for use
reg last_flg;
reg last_flg1;
reg last_o2;

//delay vld_o
reg vld_o1;
reg vld_o2;
reg vld_o3;
reg vld_o4;
reg vld_flg;

//ready_ctrl
//wire ready_ctrl1;
wire ready_ctrl;
reg ready_i0;
reg ready_i1;


//vld_i delay
reg [3:0]datar1;
reg vld_i0;
reg ready_ctrl0;
reg vld_i1;
reg vld_i2;
reg vld_i3;//

//----------start-----------    
//accumulator 250
always@(posedge clk or negedge rstn) 
if(!rstn)
    accu<='b0;
else   
        if(accu==FL_H)
                accu<='b1;
           else if(ready_ctrl&(vld_i|last_flg))
                    accu<=accu+'b1;
assign accu0=accu;             
//state 6 1-5 for input ,2-5 cycle,0 is start 
always@(posedge clk or negedge rstn) 
if(!rstn)
    state<=3'b000;
else

    if(state!=3'b000)
    begin
        if(ready_ctrl&(accu0==FL_H))
        begin
                if(state==3'b101)
                        state<=3'b010;
                    else 
                        state<=state+'b1;
        end  
        end
    else
        state<=state+'b1;
           
//RAM rd
always@(posedge clk or negedge rstn)       
if(!rstn)
    rd_en<=2'b00;
else
if(ready_ctrl)
    case(state)
        3'b001:rd_en<=2'b00;
        3'b010:if(accu0>'d1)rd_en<=2'b10; else rd_en<=2'b11;
        3'b011:rd_en<=2'b10;
        3'b100:if(accu0>'d1)rd_en<=2'b01; else rd_en<=2'b11;
        3'b101:rd_en<=2'b01;
        default:rd_en<=2'b00;
    endcase
 

//RAM wt
always@(posedge clk or negedge rstn)       
if(!rstn)
    wt_en<=2'b00;
else
    case(state)
        3'b001:if(ready_ctrl)wt_en<=2'b10;
        3'b010:if(ready_ctrl)wt_en<=2'b11;
        3'b011:if(ready_ctrl)wt_en<=2'b11;
        3'b100:if(ready_ctrl)wt_en<=2'b00;    
        3'b101:if(ready_ctrl)wt_en<=2'b00;
        default:if(ready_ctrl)wt_en<=2'b00;
    endcase  
    
//RAMA addr 0-499
always@(posedge clk or negedge rstn)       
if(!rstn)
    addra<='b0;
else
    case(state)
        3'b001:if(ready_ctrl)addra<='b0;
        3'b010:if(ready_ctrl) addra<=accu0;
        3'b011:if(ready_ctrl)addra<=accu0+FL_H;
        3'b100:if(ready_ctrl)addra<='b0;
        3'b101:if(ready_ctrl)addra<='b0;
        default:if(ready_ctrl)addra<='b0;
    endcase 

 //RAMB addr 0-499
always@(posedge clk or negedge rstn)       
if(!rstn)
    addrb<='b0;
else
    case(state)
        3'b001:if(ready_ctrl)addrb<='b0;
        3'b010:if(ready_ctrl)addrb<='b0;
        3'b011:if(ready_ctrl)addrb<='b0;
        3'b100:if(ready_ctrl)addrb<=accu0;
        3'b101:if(ready_ctrl)addrb<=accu0+FL_H;
        default:if(ready_ctrl)addrb<='b0;
    endcase  

//RAMA addw 0-499
always@(posedge clk or negedge rstn)       
if(!rstn)
    addwa<='b0;
else
begin
    case(state)
        3'b001:if(ready_ctrl)addwa<=accu0;
        3'b010:if(ready_ctrl)addwa<=accu0+FL_H;
        3'b011:if(ready_ctrl)addwa<=accu0;
        3'b100:if(ready_ctrl)addwa<='b0;
        3'b101:if(ready_ctrl)addwa<='b0;
        default:if(ready_ctrl)addwa<='b0;
    endcase 
end

//RAMB addw 0-499
always@(posedge clk or negedge rstn)       
if(!rstn)
    addwb<='b0;
else
    case(state)
        3'b001:if(ready_ctrl)addwb<='b0;
        3'b010:if(ready_ctrl) addwb<=accu0;
        3'b011:if(ready_ctrl) addwb<=accu0+FL_H;
        3'b100:if(ready_ctrl)addwb<='b0;
        3'b101:if(ready_ctrl)addwb<='b0;
        default:if(ready_ctrl)addwb<='b0;
    endcase        
  
//input make
always@(posedge clk or negedge rstn)       
if(!rstn)
    f_data0<='b0;
else 
if(ready_ctrl&(vld_i|vld_i0))
    f_data0<=f_data;

//output make
always@(posedge clk or negedge rstn)       
if(!rstn)
    f_out<='b0;
else if(ready_ctrl)
    case(state)
        3'b001: f_out<='b0;
        3'b010: if(accu0>'d2)f_out<=ramAout; else f_out<=ramBout;
        3'b011: f_out<=ramAout;
        3'b100: if(accu0>'d2)f_out<=ramBout; else f_out<=ramAout;
        3'b101: f_out<=ramBout;
        default:f_out<='b0;
    endcase      

//connect output&ram
assign connect=f_data0;

   

//------------------breakups----------------
//input frame number
always@(posedge clk or negedge rstn) 
if(!rstn)
    timer<=0;
else if(last_flg1&(!last_flg))
    case(state)
        3'b001: timer<=1;
        3'b010: timer<=1;
        3'b011: timer<=2;
        3'b100: timer<=1;
        3'b101: timer<=0;
        default: timer<=0;
      endcase
      else if((accu0==FL_H-1)&(timer))
                timer<=timer-1;
                
//output stop sig
always@(posedge clk or negedge rstn) 
if(!rstn)
    stop_flg0<='b0;
else
    if((!timer)&last_flg)
        stop_flg0<=1;
    else
        stop_flg0<=0;
        
always@(posedge clk or negedge rstn) 
if(!rstn)
    stop_flg00<='b0;
else 
    stop_flg00<=stop_flg0;   

always@(posedge clk or negedge rstn) 
if(!rstn)
    stop_flg<='b0;
else 
    stop_flg<=stop_flg00; 
    
always@(posedge clk or negedge rstn) 
if(!rstn)
    stop_flg1<='b0;
else 
    stop_flg1<=stop_flg;
    
//----------axi4 wrapper----------    


//last_flg for stop
always@(*) 
if(!rstn)
    last_flg1<='b0;
else if(last_i)
    last_flg1<=1;  
    
always@(posedge clk or negedge rstn) 
if(!rstn)
    last_flg<='b0;
else if(last_i)
    last_flg<=last_flg1;  
    
//last_o gen
assign  last_o1=stop_flg1^stop_flg;  
    
 
always@(posedge clk or negedge rstn) 
if(!rstn)
    last_o2<='b0;
else 
    last_o2<=last_o1; 
    
 always@(posedge clk or negedge rstn) 
if(!rstn)
    last_o<='b0;
else 
    last_o<=last_o2; 

//vld_o gen
always@(posedge clk or negedge rstn) 
if(!rstn)
    vld_o1<='b0;
else 
        vld_o1<=((state>'d1)&(!stop_flg));    

always@(posedge clk or negedge rstn) 
if(!rstn)
    vld_o2<='b0;
else 
    vld_o2<=vld_o1;
    
always@(posedge clk or negedge rstn) 
if(!rstn)
    vld_o3<='b0;
else 
    vld_o3<=vld_o2;
     
always@(posedge clk or negedge rstn) 
if(!rstn)
    vld_o4<='b0;
else 
    vld_o4<=vld_o3&vld_o1; 
        
always@(posedge clk or negedge rstn) 
if(!rstn)
    vld_o<='b0;
else 
    vld_o<=vld_o4&((datar1[3]&datar1[2])|last_flg)&ready_i;  

//vld_i gen

always@(posedge clk or negedge rstn) 
if(!rstn)
    vld_i0<='b0;
else 
    vld_i0<=vld_i;  

always@(posedge clk or negedge rstn) 
if(!rstn)
    datar1<='b0;
else 
    datar1<={datar1[2:0],vld_i0};

    
//ready_o    
always@(posedge clk or negedge rstn) 
if(!rstn)
    ready_i0<='b0;
else 
    ready_i0<=ready_i; 
      
assign ready_ctrl=ready_i&ready_i0;


always@(*)       
    case(state)
        3'b001: ready_o=ready_ctrl&vld_i&(!last_flg);
        3'b010: ready_o=ready_ctrl&vld_i&(!last_flg);
        3'b011: ready_o=ready_ctrl&vld_i&(!last_flg);
        3'b100: ready_o=0;
        3'b101: ready_o=0;
        default: ready_o=0;
      endcase
          
//-------------window------------
always@(posedge clk or negedge rstn) 
if(!rstn)
    w0<='b0;
else if(ready_ctrl)
    w0<={{16{f_out[15]}},f_out}*{{16{windata[15]}},windata};
    
always@(posedge clk or negedge rstn) 
if(!rstn)
    winout<='b0;
else if(ready_ctrl)
    winout<=w0>>14;    

          
//win addrss
always@(posedge clk or negedge rstn) 
if(!rstn)
    addrom<='b0;
else
    case(state)
        3'b001: if(ready_ctrl)addrom<='b0;
        3'b010: if(ready_ctrl)addrom<=accu0; 
        3'b011: if(ready_ctrl)addrom<=accu0+FL_H;
        3'b100: if(ready_ctrl)addrom<=accu0;
        3'b101: if(ready_ctrl)addrom<=accu0+FL_H;
        default: if(ready_ctrl)addrom<='b0;
    endcase 
    
always@(posedge clk or negedge rstn) 
if(!rstn)
    addrom1<='b0;
else if(ready_ctrl)
    addrom1<=addrom;   
always@(posedge clk or negedge rstn) 
if(!rstn)
    addrom2<='b0;
else if(ready_ctrl)
    addrom2<=addrom1; 
assign addromw=(ready_ctrl)?addrom1:addrom2;      


//-----rom&ram
romwindow win1
(.data(windata),.addr(addromw),.read(1'b1),.clk(clk));



ram_dp_sr_sw1 ramA(
.clk(clk)       , // Clock Input
.address_0(addwa) , // address_0 Input
.data_0(connect)    , // data_0 bi-directional
.cs_0(1'b1)      , // Chip Select
.we_0(wt_en[1])      , // Write Enable/Read Enable
.oe_0(1'b0)      , // Output Enable
.address_1(addra), // address_1 Input
.data_1(ramAout)    , // data_1 bi-directional
.cs_1(ready_ctrl)      , // Chip Select
.we_1(rd_en[1])      , // Write Enable/Read Enable
.oe_1(1'b1)        // Output Enable
); 


ram_dp_sr_sw1 ramB(
.clk(clk)       , // Clock Input
.address_0(addwb) , // address_0 Input
.data_0( connect)    , // data_0 bi-directional
.cs_0(1'b1)      , // Chip Select
.we_0(wt_en[0])      , // Write Enable/Read Enable
.oe_0(1'b0)      , // Output Enable
.address_1(addrb), // address_1 Input
.data_1(ramBout)    , // data_1 bi-directional
.cs_1(ready_ctrl)      , // Chip Select
.we_1(rd_en[0])      , // Write Enable/Read Enable
.oe_1(1'b1)        // Output Enable
); 

endmodule
