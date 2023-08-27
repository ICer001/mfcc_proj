`timescale 100ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/17 03:20:50
// Design Name: 
// Module Name: ffttest
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
module ffttest();
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
wire last;

wire vld;
wire ready_i;
wire ready_o;
wire last0;
initial
begin
    flname=$fopen("e:\\datafra2.txt","w"); //open data file
    $readmemb("d:\\fftdata.txt",dataorigin);//read data from file
    writeindex=0;
    ready_o1=1;
    rstn=1;
    en0=0;
    clk_100M=1;//set cal clk initial
    data=0;
    #20
    rstn=1;//observe rst off initial behavior
    #20 
    rstn=0;//rst on
    
    #2060 
    rstn=1;//rst off

    #10045
    //simulate en change ctrl
    en0=#1 1;
    #3000
    ready_o1=0;
    #5000
    ready_o1=1;
    #120200
        en0=0;//a frame end
    #84700
        en0=1;//a fft end a new frame start
    $fclose(flname);//close output file
    $fclose(flname);//close output file
    $fclose(flname);//close output file
    $fclose(flname);//close output file
    $fclose(flname);//close output file
    $fclose(flname);//close output file
    $fclose(flname);//close output file
    $fclose(flname);//close output file
    repeat(30)
        begin
        #120000
        en0=0;//a frame end
        #3000
        ready_o1=0;
        #5000
        ready_o1=1;
        #8400
        en0=1;//a fft end a new frame start
        #3000
        ready_o1=0;
        #5000
        ready_o1=1;
        end
end

//after reading pass data to mfcc
always @(posedge clk_100M or negedge rstn)
if(en&ready_i)
    if(innumber<'d1999)        
            data<=#10 dataorigin[innumber];
    else
        data<='d0;
        

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
    else 
        innumber<='d0;
        end
        end

//last gen
assign last=(innumber==1999)?1:0;

//wire in preemph en
assign en=en0;

//wire in preemph en
assign data1=data;

//
assign ready_o= ready_o1;

//save to reg
always@(posedge clk_100M)
    if(en1)
        framedata1<=framedata;
always@(posedge clk_100M)
        en1<=#1 en0;

//output to txt
always@(posedge clk_100M)
            if(en1)
            begin
                $fwrite(flname,"%h\ ",$signed(framedata1));
            end

//clk period
always #50
    clk_100M=~clk_100M;   
    
//write index ctrl
always@(posedge clk_100M)
    if(vld)
        if(writeindex<'d30000)
            writeindex<=writeindex+1;//record output data index
        else
            begin
                $fclose(flname);//close output file
                $stop; 
            end
  assign enx=en1&en;     
          
//connect module            
fftcal fft1(
.clk(clk_100M),
.rstn(rstn),

.fftdatain(data),
.vld_i(enx),
.last_i(last),
.ready_o(ready_i),

.pspec(framedata),
.vld_o(vld),
.ready_i(ready_o),
.last_o(last0)
    );

endmodule

