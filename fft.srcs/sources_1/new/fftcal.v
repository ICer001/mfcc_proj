`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/17 18:55:51
// Design Name: 
// Module Name: FFTcal
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
module fftcal(
//input pin define;
input wire rstn,
input wire clk,

//axi_in
input wire[15:0]fftdatain,//signed int8(uint16)
input wire vld_i,//input valid signal
input wire last_i,//input valid signal
output wire ready_o,

//axi-out
output reg[15:0]pspec,//power spectrum
input wire ready_i,//input valid signal
output reg vld_o,
output reg last_o,
output wire keep
    );
//----------------reg wires define---------------    
//other connect wires
wire[8:0]smplnumber;//output pspec
wire configfft;//1=fft,0=ifft,scale=512
wire s_axis_config_tready_0;//config ready

reg[31:0]datacplx;//complex input data
wire[31:0]datacplx1;//complex input data
wire[63:0]fftdat;//complex output data,0-9  bit is real,16-25bit is img,21-24&46-48wastes

wire event_data_in_channel_halt_0;//input not all
wire event_data_out_channel_halt_0;//output interrupt
wire event_status_channel_halt_0;//status error
wire event_tlast_missing_0;//no tlast
wire event_frame_started;
wire event_tlast_unexpected_0;//tlast early

wire[15:0]fftimg;//fft imagine part
wire[15:0]fftreal;//fft real part
wire [32:0]pspec0;//calculate pspec wires
reg [31:0]pspeci;
reg [31:0]pspecr;


wire m0;//out last one
wire m_axis_data_tvalid_0;//output valid fft
reg mlast_1;//out last one delay
reg mvalid_1;//output valid delay


//ready_o
wire readyo0;
reg ready_o1;
//ready_i
reg ready_i1;
wire ready_i2;

wire startflag;
reg event_frame_started1;
reg vld_i1;
reg vld_iflg1;
reg vld_iflg2;
reg mvalid_flg1;
reg mvalid_flg2;


//----------dataprepare----------
//accumulater
reg [8:0]i;

always @(posedge clk or negedge rstn)
    if(!rstn)
        i<=0; 
    else if((vld_i|vld_i1)&((startflag)&(readyo0&ready_o1)))
        i<=i+1 ;  

//--------config fft----------
assign configfft=1'b1;//1=fft,0=ifft,9bit scale 16'b0000001_11_11_11_00_1

//realsig to cplx data,0-9 bit is real,17-25bit is img,others pads 0
always @(posedge clk or negedge rstn)
    if(!rstn)
        datacplx<=0; 
    else 
            if(i<502)
            begin
                if(ready_o)
                    datacplx<={16'b0,fftdatain}; 
            end 
                else
                    datacplx<=0;
        
assign fftimg=fftdat[57:42];//get fft img
assign fftreal=fftdat[25:10];//get fft real
assign datacplx1=datacplx;//connect to fft        

//-----------calculate power spectrum-------
//img^2
always @(posedge clk or negedge rstn)
if(!rstn)
        pspeci[31:0]<=0; 
else if((smplnumber<'d256)&ready_i2)
        pspeci[31:0]<={{16{fftimg[15]}},fftimg}*{{16{fftimg[15]}},fftimg};
        
//real^2
always @(posedge clk or negedge rstn)
if(!rstn)
        pspecr[31:0]<=0; 
else if((smplnumber<'d256)&ready_i2)
        pspecr[31:0]<={{16{fftreal[15]}},fftreal}*{{16{fftreal[15]}},fftreal};

        
//pspec result original        
assign pspec0[32:0]=pspecr[31:0]+pspeci[31:0];

//narrow output
always @(posedge clk or negedge rstn)
    if(!rstn)
        pspec<=0; 
    else if(ready_i2)
        pspec<=pspec0[17:2];

//---------axi config-------
//pspec last sig   
        
always @(posedge clk or negedge rstn)
    if(!rstn)
        last_o<=0; 
    else if((smplnumber=='d256)&vld_o)
            last_o<=1;
        else 
            last_o<=0;
        
//pspec vld_o sig
always @(posedge clk or negedge rstn)
    if(!rstn)
        mvalid_1<=0; 
    else 
        mvalid_1<=m_axis_data_tvalid_0;   
 
always @(posedge clk or negedge rstn)
    if(!rstn)
        mvalid_flg1<=0; 
    else if(m_axis_data_tvalid_0)
        mvalid_flg1<=1; 
        
always @(posedge clk or negedge rstn)
    if(!rstn)
        mvalid_flg2<=0; 
    else if(mvalid_flg1)
        mvalid_flg2<=1; 

always @(posedge clk or negedge rstn)
    if(!rstn)
        vld_o<=0; 
    else if((((mvalid_flg1^mvalid_flg2)|mvalid_1)&((smplnumber<'d257)&(smplnumber>'d0)))&ready_i)
         vld_o<=mvalid_1;    
        else
            vld_o<=0;   
               
 //ready_o generate
 always @(posedge clk or negedge rstn)
    if(!rstn)
        ready_o1<=0; 
    else 
         ready_o1<=readyo0;    
assign ready_o=(((i<502)&(i>1))&startflag)&(readyo0&ready_o1);

//ready_i arrange    
 always @(posedge clk or negedge rstn)
    if(!rstn)
        ready_i1<=0; 
    else 
         ready_i1<=ready_i;                          
assign ready_i2=(ready_i1&ready_i);

//fft start generate
always @(posedge clk or negedge rstn)
    if(!rstn)
        event_frame_started1<=0; 
    else if(event_frame_started)
            event_frame_started1<=1;            
assign startflag=event_frame_started1|event_frame_started;

//vld_i delay
always @(posedge clk or negedge rstn)
    if(!rstn)
        vld_i1<=0; 
    else 
            vld_i1<=vld_i;  
always@(posedge clk or negedge rstn)
    if(!rstn) vld_iflg1<='b0; 
    else    if(vld_i) vld_iflg1<=1;
    
always@(posedge clk or negedge rstn)
    if(!rstn) vld_iflg2<='b0; 
    else    if(vld_iflg1) vld_iflg2<=1;
assign keep=1;
//use fft IP
xfft_0 ft1
       (.aclk(clk),
        .aresetn(rstn),
        
        .event_data_in_channel_halt(event_data_in_channel_halt_0),
        .event_data_out_channel_halt(event_data_out_channel_halt_0),
        .event_frame_started(event_frame_started),
        .event_status_channel_halt(event_status_channel_halt_0),
        .event_tlast_missing(event_tlast_missing_0),
        .event_tlast_unexpected(event_tlast_unexpected_0),
        
        .m_axis_data_tdata(fftdat),
        .m_axis_data_tlast(m0),
        .m_axis_data_tready(ready_i2),
        
        .m_axis_data_tuser(smplnumber),
        .m_axis_data_tvalid(m_axis_data_tvalid_0),
        
        .s_axis_config_tdata(configfft),
        .s_axis_config_tready(s_axis_config_tready_0),
        .s_axis_config_tvalid(1'b1),
        
        .s_axis_data_tdata(datacplx1),
        .s_axis_data_tlast(last_i),
        .s_axis_data_tready(readyo0),
        .s_axis_data_tvalid(((vld_iflg1^vld_iflg2)|vld_i1)&readyo0));     
             
 endmodule
 


