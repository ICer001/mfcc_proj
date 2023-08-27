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

module logjiaohu_sim();
reg [15:0]dataorigin[11:0];//store input data
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
initial
begin
    writeindex=0;
    ready_o1=1;
    en0=0;
    clk_100M=1;//set cal clk initial
    data=0;
    #200
    rstn=1;//observe rst off initial behavior
    #200 
    rstn=0;//rst on
    flname=$fopen("d:\datafra2.txt","w"); //open data file
    $readmemb("d:\\LL.txt",dataorigin);//read data from file
    #5060 
    rstn=1;//rst off

    #1045
    //simulate en change ctrl
    en0=#1 1;
    #300
    ready_o1=0;
    #500
    ready_o1=1;
    #12020
        en0=0;//a frame end
    #8470
        en0=1;//a fft end a new frame start
    $fclose(flname);//close output file
    $fclose(flname);//close output file
    $fclose(flname);//close output file
    $fclose(flname);//close output file
    $fclose(flname);//close output file
    $fclose(flname);//close output file
    $fclose(flname);//close output file
    $fclose(flname);//close output file
    repeat(3000)
        begin
        #12000
        en0=0;//a frame end
        #300
        ready_o1=0;
        #500
        ready_o1=1;
        #8400
        en0=1;//a fft end a new frame start
        #300
        ready_o1=0;
        #500
        ready_o1=1;
        end
end

//after reading pass data to mfcc
always @(posedge clk_100M or negedge rstn )
if(!rstn)
    data<='d0;
else if(en&&ready_i)  
            if(innumber<'d12)      
                data<=#10 dataorigin[innumber];
        

//read number record
always @(posedge clk_100M or negedge rstn)
if(!rstn)
    innumber<='d0;
else 
if(ready_i)
begin
if(en)
begin
    if(innumber<'d1100)
        innumber<=innumber+1;
    else 
        innumber<='d0;
        end
        end

//last gen
assign last=(innumber==12)?1:0;

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
  assign enx=((innumber<'d13)&(innumber>'d0))? en1&en:0;  
   

//connect module            
logjiaohu pre1(
.clk(clk_100M),
.rst(rstn),

//-----------axi-in
.idata(data),
.ivalid(enx),
.ilast(),
.oready(ready_i),

//-----------axi-iout
.odata(framedata),
.ovalid(vld),
.iready(ready_o),
.olast()
    );

endmodule


