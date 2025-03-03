// Code your testbench here
// or browse Examples
typedef enum {RED,YELLOW,GREEN} colour;

class driver;
  
  colour col;
  
  task send_pkt;
    std::randomize(col) with {col==GREEN;};
   // $display(" THE COLOUR %s",col.name());
    modify_col;
    
  endtask
  
  virtual task modify_col;
  endtask
endclass

class driver_mod extends driver;
  
  task modify_col;
    $display("Modifying colour");
    std::randomize(col)with{ col inside {YELLOW,RED};};
  endtask 
endclass

class env;
  
  bit mod;
  driver drv;
  driver_mod drv_mod;
  
  function new();
    drv=new();
    drv_mod=new();
  endfunction
  
  task execute;
    if(mod)drv=drv_mod;
   
        drv.send_pkt();
    $display("Sending packet %s",drv.col.name());
     
  endtask
endclass

module tb;
  
  env env_h;
  //repeat(3) begin
  initial begin
    env_h=new();
    
    env_h.mod =0;
    $display("Display without Modifying");
    env_h.execute();
    #10;
    env_h.mod =1;
    $display("\nDisplay with Modifying");
    env_h.execute();
  end
 //end
endmodule
