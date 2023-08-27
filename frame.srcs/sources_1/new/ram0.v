`timescale 1ns / 1ps

module ram_dp_sr_sw1 #(
parameter data_0_WIDTH = 16,
parameter ADDR_WIDTH = 9,
parameter RAM_DEPTH = 1 << ADDR_WIDTH
)(
input clk       , // Clock Input
input [ADDR_WIDTH - 1 : 0] address_0 , // address_0 Input
inout [data_0_WIDTH-1 : 0] data_0    , // data_0 bi-directional
input cs_0      , // Chip Select
input we_0      , // Write Enable/Read Enable
input oe_0      , // Output Enable
input [ADDR_WIDTH - 1 : 0] address_1 , // address_1 Input
inout [data_0_WIDTH-1 : 0] data_1    , // data_1 bi-directional
input cs_1      , // Chip Select
input we_1      , // Write Enable/Read Enable
input oe_1        // Output Enable
); 
 
 
 
//--------------Internal variables---------------- 
reg [data_0_WIDTH-1:0] data_0_out ; 
reg [data_0_WIDTH-1:0] data_1_out ;
reg [data_0_WIDTH-1:0] mem [0:RAM_DEPTH-1];
 
 
//initialization
 
// synopsys_translate_off
integer i;
initial begin
    for(i=0; i < RAM_DEPTH; i = i + 1) begin
        mem[i] = 16'h00;
    end
end
// synopsys_translate_on

 
//--------------Code Starts Here------------------ 
// Memory Write Block 
always @ (posedge clk)
begin : MEM_WRITE
  if ( cs_0 && we_0 ) begin
     mem[address_0] <= data_0;
  end 
end
 
 
//Second Port of RAM
assign data_1 = (oe_1 && we_1) ? data_1_out : 16'bz; 

always @ (posedge clk)
begin : MEM_READ_1
if(cs_1)begin
  if (we_1 && oe_1) begin
    data_1_out <= mem[address_1]; 
  end else begin
    data_1_out <= 0;
  end
  end
end
 
endmodule // End of Module ram_dp_sr_sw