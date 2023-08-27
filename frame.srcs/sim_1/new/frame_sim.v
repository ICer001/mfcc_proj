`timescale 100ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/25 15:09:17
// Design Name: 
// Module Name: pretest
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

module frametest();
reg [15:0]dataorigin[1999:0];//store input data
integer flname;//output data to PC
integer writeindex;//write to txt
integer innumber;//input data number
reg [15:0]data;//input data
reg clk_100M;//cal clk initial
reg rstn;//system reset

reg en0;
reg en1;
reg en2;
reg ready_o1;
reg [15:0]framedata1;

wire enx;
wire en;
wire [15:0]framedata;
wire [15:0]data1;
wire #5 last;

wire vld;
wire #5 ready_i;
wire #5 ready_o;
initial
begin
    writeindex=0;
    ready_o1=0;
    en0=0;
    clk_100M=1;//set cal clk initial
    data=0;
    #200
    rstn=1;//observe rst off initial behavior
    #200 
    rstn=0;//rst on
    flname=$fopen("e:\datafra2.txt","w"); //open data file
    $readmemh("e:\data12.txt",dataorigin);//read data from file
    #5060 
    rstn=1;//rst off
    #5000
    ready_o1=1;
    #10100
    //simulate en change ctrl
    en0=#1 1;
    
    #12020
        en0=0;//a frame end
    #8470
        en0=1;//a fft end a new frame start
//    $fclose(flname);//close output file
//    $fclose(flname);//close output file
//    $fclose(flname);//close output file
//    $fclose(flname);//close output file
//    $fclose(flname);//close output file
//    $fclose(flname);//close output file
//    $fclose(flname);//close output file
//    $fclose(flname);//close output file
    repeat(300)
        begin
        #12000
        en0=0;//a frame end
        #60000
        ready_o1=0;
        #34800
        en0=1;
        #8000
        ready_o1=1;
        #40000
        en0=0;
        #30000
        en0=1;//a fft end a new frame start
        #10100
        ready_o1=0;
        #10600
        ready_o1=1;
        end
end

//after reading pass data to mfcc
always @(posedge clk_100M or negedge rstn)
if(!rstn)
    data<='d0;
else if(en&ready_i)        
            data<=#10 dataorigin[innumber];
        

//read number record
always @(posedge clk_100M or negedge rstn)
if(!rstn)
    innumber<='d0;
else if(ready_i)
    begin
        if(en)
        begin
            if(innumber<'d2000)
                innumber<=innumber+1;
//            else 
//                innumber<='d0;
                end
        end

//last gen
wire last1;
assign last1= ( innumber==2000)?1:0;
reg last0;
always @(posedge clk_100M or negedge rstn)
if(!rstn)
    last0<='d0;
else
    last0<=last1;
assign last=last0^last1;

//wire in preemph en
assign en=1;

//wire in preemph en
assign data1=data;

//
assign ready_o= ready_o1;

//save to reg
always@(posedge clk_100M)
    if(vld)
        framedata1<=framedata;
always@(posedge clk_100M)
        en1<=#5 1;

//output to txt
always@(posedge clk_100M)
            if(vld)
            begin
                $fwrite(flname,"%d\ ",$signed(framedata1));
            end

//clk period
always #50
    clk_100M=~clk_100M;   
    
//write index ctrl
always@(posedge clk_100M)

        if(writeindex<'d30000)
            writeindex<=writeindex+1;//record output data index
        else
            begin
                $fclose(flname);//close output file
                $stop; 
            end
 assign enx=(innumber<'d2000)? (en1&en):0;
 wire ready00;   
assign ready00=1;
//connect module            
frame frame1(
.clk(clk_100M),
.rstn(rstn),

.f_data(data1),
.vld_i(enx),
.last_i(last),
.ready_o(ready_i),

.winout(framedata),
.vld_o(vld),
.ready_i(ready00),
.last_o()
    );
    
endmodule




