// Code your testbench here
typedef enum {GOOD, BAD_ERR1, BAD_ERR2} pkt_type;

class driver;
  pkt_type pkt;
  
  task pkt_sender;
    std::randomize(pkt) with {pkt == GOOD;};
    modify_pkt;
  endtask
  
  virtual task modify_pkt; // Callback method
  endtask
endclass

// Error introduction via err_driver class where callback method modify_pkt is implemented.
class err_driver extends driver;
  task modify_pkt;
    $display("Injecting error pkt");
    std::randomize(pkt) with {pkt inside {BAD_ERR1, BAD_ERR2};};
  endtask
endclass

class env;
  bit inject_err;
  driver drv;
  err_driver drv_err;
  
  function new();
    drv = new();
    drv_err = new();
  endfunction
  
  task execute;
    if (inject_err) drv = drv_err; // Assigning error driver if inject_err is set
    // Sending a packet
    drv.pkt_sender();
    $display("Sending packet = %s", drv.pkt.name());
  endtask
endclass

// Top-level Testbench Module
module tb;
  env test_env;

  initial begin
    test_env = new();
    
    // Run test without error injection
    test_env.inject_err = 0;
    $display("Running test without error injection:");
    test_env.execute();

    // Run test with error injection
    test_env.inject_err = 1;
    $display("\nRunning test with error injection:");
    test_env.execute();

    $finish;
  end
endmodule
