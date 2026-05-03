program test(arb intf);

    import pkg::*;

    int N = 25;

    Transaction gen_queue[$];
    Transaction drv_queue[$];
    Transaction mon_queue[$];

    task gen(int n);
      
        repeat (n) begin
          Transaction tr;
            tr = new();
            gen_queue.push_back(tr);
        end
    endtask

    task driver(int n);
       Transaction tr;
        repeat (n) begin
            wait (gen_queue.size() > 0);

           
tr = gen_queue.pop_front();

            @(intf.cb);
            intf.cb.write   <= 1;
            intf.cb.read    <= 0;
            intf.cb.address <= tr.address;
            intf.cb.data_in <= tr.data_in;

            tr.expected_data = {^tr.data_in, tr.data_in};

            @(intf.cb);
            intf.cb.write <= 0;

            drv_queue.push_back(tr);
        end
    endtask

    task monitor(int n);
       Transaction tr;
        repeat (n) begin
            wait (drv_queue.size() > 0);

           
          tr = drv_queue.pop_front();

            intf.cb.read    <= 1;
            intf.cb.write   <= 0;
            intf.cb.address <= tr.address;
			@(intf.cb);
            @(intf.cb);
            tr.data_out = intf.cb.data_out;
            intf.cb.read <= 0;

            mon_queue.push_back(tr);
        end
    endtask

    task checker(int n);
       Transaction tr;
        repeat (n) begin
            wait (mon_queue.size() > 0);

          tr = mon_queue.pop_front();
            tr.checkValid();
            tr.print_data_out();
        end
    endtask

    initial begin
        fork
            gen(N);
            driver(N);
            monitor(N);
            checker(N);
        join

        #100;
        Transaction::print_error();
        $finish;
    end

endprogram
