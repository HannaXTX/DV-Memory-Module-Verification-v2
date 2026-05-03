module top;

    logic clk;

    always #50 clk = ~clk;

    arb intf(clk);

    my_mem dut (intf);
    test   tb  (intf);

    initial begin
      
    $fsdbDumpfile("waves.fsdb");
    $fsdbDumpvars(0);
      
      
        clk = 0;
    end

endmodule

