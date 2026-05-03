package pkg;
  
  class Transaction;
    
    
       rand logic [15:0] address;
    rand logic [7:0]  data_in;
         logic [8:0]  data_out;
         logic [8:0]  expected_data;
    
    static int error = 0;
    
    function new();
      this.randomize();
      
    endfunction
    
    
    static function print_error();
      $display("TIME = %t, ERROR = %d",$time,error);
    endfunction
    
        function void checkValid();
        if (data_out !== expected_data) begin
            error++;
          $display("Mismatch at %0t \n EXPECTED=%0h GOT=%0h", $time, expected_data, data_out);
        end
    endfunction
    
    
    function Transaction copy();
        Transaction tr = new();
        tr.address = this.address;
        tr.data_in = this.data_in;
        tr.data_out = this.data_out;
        tr.expected_data = this.expected_data;
        return tr;
    endfunction
        function void print_data_out();
    $display("TIME=%0t ADDR=%0h IN=%0h OUT=%0h EXP=%0h",
              $time, address, data_in, data_out, expected_data);
endfunction
  endclass
  
 

endpackage
