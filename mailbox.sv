// Code your testbench here
// or browse Examples
module mailbox;
  
  class packet;
    
    rand bit[3:0] data;
    rand bit[3:0] addr;
    
    function void display(input string var1);
      $display("-------------------");
      $display("\t %s",var1);
      $display("data = %0d || addr = %0d",data,addr);
      $display("-------------------");
    endfunction
  endclass
  
  class generator;
    
    packet gen_pkt_h;
    
    mailbox #(packet) gen2drv;
    
    function new(mailbox #(packet) gen2drv);
      this.gen2drv = gen2drv;
    endfunction
    
    task start();
      fork
        repeat(10)begin
          gen_pkt_h=new();
          assert(gen_pkt_h.randomize());
          gen2drv.put(gen_pkt_h);
        end
      join
    endtask
    
  endclass
  
  
  class driver;
    
    packet drv_pkt_h;
    
    mailbox #(packet) drv4gen;
    
    function new(mailbox #(packet) drv4gen);
      this.drv4gen=drv4gen;
    endfunction
    
    
    task start();
      fork
        repeat(10) begin
          drv4gen.get(drv_pkt_h);
          drv_pkt_h.display("DATA IN DRIVER");
        end
      join
    endtask
    
  endclass
  
  class env;
    mailbox #(packet) gen_drv=new();
    
    generator gen_h;
    driver drv_h;
    
    task build;
      gen_h=new(gen_drv);
      drv_h=new(gen_drv);
    endtask
    
    task start();
      gen_h.start();
      drv_h.start();
    endtask
 
  endclass
    
    initial begin
      env env_h=new();
      env_h.build();
      env_h.start();
    end
  
endmodule


/*
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Apr 15 12:58 2025
-------------------
	 Generator to driver
data = 8 || addr = 9
-------------------
-------------------
	 Generator to driver
data = 15 || addr = 8
-------------------
-------------------
	 Generator to driver
data = 8 || addr = 14
-------------------
-------------------
	 Generator to driver
data = 1 || addr = 10
-------------------
-------------------
	 Generator to driver
data = 12 || addr = 11
-------------------
-------------------
	 Generator to driver
data = 2 || addr = 4
-------------------
-------------------
	 Generator to driver
data = 7 || addr = 9
-------------------
-------------------
	 Generator to driver
data = 9 || addr = 15
-------------------
-------------------
	 Generator to driver
data = 2 || addr = 6
-------------------
-------------------
	 Generator to driver
data = 1 || addr = 15
-------------------

------------------

-------------------
	 DATA IN DRIVER
data = 8 || addr = 9
-------------------
-------------------
	 DATA IN DRIVER
data = 15 || addr = 8
-------------------
-------------------
	 DATA IN DRIVER
data = 8 || addr = 14
-------------------
-------------------
	 DATA IN DRIVER
data = 1 || addr = 10
-------------------
-------------------
	 DATA IN DRIVER
data = 12 || addr = 11
-------------------
-------------------
	 DATA IN DRIVER
data = 2 || addr = 4
-------------------
-------------------
	 DATA IN DRIVER
data = 7 || addr = 9
-------------------
-------------------
	 DATA IN DRIVER
data = 9 || addr = 15
-------------------
-------------------
	 DATA IN DRIVER
data = 2 || addr = 6
-------------------
-------------------
	 DATA IN DRIVER
data = 1 || addr = 15
-------------------
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
*/
    
    
    
    
    
