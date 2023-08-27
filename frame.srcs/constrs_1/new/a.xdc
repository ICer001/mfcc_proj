
create_clock -period 10.000 -name clk100 [get_ports clk]

#input max
set_input_delay -clock clk100 -max 2.000 [get_ports rstn]
set_input_delay -clock clk100 -max 2.000 [get_ports f_data]
set_input_delay -clock clk100 -max 2.000 [get_ports vld_i]
set_input_delay -clock clk100 -max 2.000 [get_ports last_i]
set_input_delay -clock clk100 -max 2.000 [get_ports ready_i]

#output max
set_output_delay -clock clk100 -max 2.000 [get_ports vld_o]
set_output_delay -clock clk100 -max 2.000 [get_ports last_o]
set_output_delay -clock clk100 -max 2.000 [get_ports ready_o]
set_output_delay -clock clk100 -max 2.000 [get_ports winout]

#input min
set_input_delay -clock clk100 -min 1 [get_ports f_data]
set_input_delay -clock clk100 -min 1.00 [get_ports rstn]
set_input_delay -clock clk100 -min 1.00 [get_ports vld_i]
set_input_delay -clock clk100 -min 1.00 [get_ports last_i]
set_input_delay -clock clk100 -min 1.00 [get_ports ready_i]

#output min
set_output_delay -clock clk100 -min 1.000 [get_ports vld_o]
set_output_delay -clock clk100 -min 1.000 [get_ports last_o]
set_output_delay -clock clk100 -min 1.000 [get_ports ready_o]
set_output_delay -clock clk100 -min 1.000 [get_ports winout]


