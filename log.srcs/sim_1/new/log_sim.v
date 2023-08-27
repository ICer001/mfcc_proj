
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

module pretest();
reg [15:0]dataorigin[1999:0];//store input data
integer flname;//output data to PC
integer writeindex;//write to txt
integer innumber;//input data number
reg [15:0]data;//input data
reg clk_100M;//cal clk initial
reg rstn;//system reset
reg[15:0]X;
reg[3:0]i;
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
    en0=1;
    clk_100M=1;//set cal clk initial
    data=0;
    #200
    rstn=1;//observe rst off initial behavior
    #200 
    rstn=0;//rst on
    flname=$fopen("e:\datafra2.txt","w"); //open data file
//    $readmemh("e:\data12.txt",dataorigin);//read data from file
    #560 
    rstn=1;//rst off
///---------------rst off


//    #10045
//    //simulate en change ctrl
//    en0=#1 1;
//    #3000
//    ready_o1=0;
//    #5000
//    ready_o1=1;
//    #120200
//        en0=0;//a frame end
//    #84700
//        en0=1;//a fft end a new frame start
//    $fclose(flname);//close output file
//    $fclose(flname);//close output file
//    $fclose(flname);//close output file
//    $fclose(flname);//close output file
//    $fclose(flname);//close output file
//    $fclose(flname);//close output file
//    $fclose(flname);//close output file
//    $fclose(flname);//close output file
//    repeat(30)
//        begin
//        #120000
//        en0=0;//a frame end
//        #3000
//        ready_o1=0;
//        #5000
//        ready_o1=1;
//        #8400
//        en0=1;//a fft end a new frame start
//        #3000
//        ready_o1=0;
//        #5000
//        ready_o1=1;
//        end
end
 always @(posedge clk_100M or negedge rstn )
if(!rstn)
        i<=4'd0;
    else if(i<12)
        i=i+1;
    else 
        i<=4'd0;
    
    assign ready_i=1;
always @(posedge clk_100M or negedge rstn )
if(!rstn)
        X<=16'd0;
    else 
        X<=X+16'd5000;





//after reading pass data to mfcc
always @(posedge clk_100M or negedge rstn )
if(!rstn)
    data<='d0;
else if(en&ready_i)        
            data<=#10 X;
        

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
assign last=(innumber==2000)?1:0;

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
//pre0 pre1(
//.clk(clk_100M),
//.rstn(rstn),

//------------axi4 in
//.datain(data),
//.vld_i(enx),
//.last_i(last),
//.ready_o(ready_i),

//------------axi4 out
//.predata(framedata),
//.vld_o(vld),
//.ready_i(ready_o),
//.last_o()
//    );
log log_sim1(
.clk(clk_100M),
.rst(rstn),
.X(data),
.out(framedata),
.valid(enx)
);


endmodule

