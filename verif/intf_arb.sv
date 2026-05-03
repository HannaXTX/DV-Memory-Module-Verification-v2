interface arb(input logic clk);
  
   logic write;
    logic read;
    logic [7:0]  data_in;
    logic [15:0] address;
    logic [8:0]  data_out;
    
  
  clocking cb @(posedge clk);
    output write, read, data_in, address;
    input  data_out;
  endclocking
  
 task checker();
    if (write && read)
        $display("ERROR: RW ACTIVE AT SAME TIME");
endtask
    
modport DUT (
    input clk,
    input write, read, data_in, address,
    output data_out
);


  
endinterface
