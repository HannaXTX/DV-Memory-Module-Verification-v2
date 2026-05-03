module my_mem(arb arb_bus);

  logic [8:0] mem_array [0:65535];
  
  always @(posedge arb_bus.clk) begin
    arb_bus.checker();
	if(arb_bus.write)
		mem_array[arb_bus.address] ={^arb_bus.data_in,arb_bus.data_in};
	else if (arb_bus.read)
		arb_bus.data_out = mem_array[arb_bus.address];
	end

endmodule
