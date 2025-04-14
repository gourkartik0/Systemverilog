// Code your testbench here
// or browse Examples
module test_semaphore;
  
  class driver;
    
    task send(input string var1);
      sem.get(1); 
      $display("%s get the key",var1);
      
      sem.put(1); 
      $display("%s dropped the key",var1);
      
    endtask
  endclass
    
  driver dr[2];
  
  semaphore sem;
  
  initial begin
    dr[0]=new();
    dr[1]=new();
    
    sem=new(2);
    repeat(5) begin
     fork
       dr[0].send("-------DRIVER_1---------\n");
       dr[1].send("-------DRIVER_2---------\n");
     join
    end
  end
    
endmodule



/*
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Apr 14 14:38 2025
-------DRIVER_1---------
 dropped the key
-------DRIVER_1---------
 get the key
-------DRIVER_2---------
 dropped the key
-------DRIVER_2---------
 get the key
-------DRIVER_1---------
 dropped the key
-------DRIVER_1---------
 get the key
-------DRIVER_2---------
 dropped the key
-------DRIVER_2---------
 get the key
-------DRIVER_1---------
 dropped the key
-------DRIVER_1---------
 get the key
-------DRIVER_2---------
 dropped the key
-------DRIVER_2---------
 get the key
-------DRIVER_1---------
 dropped the key
-------DRIVER_1---------
 get the key
-------DRIVER_2---------
 dropped the key
-------DRIVER_2---------
 get the key
-------DRIVER_1---------
 dropped the key
-------DRIVER_1---------
 get the key
-------DRIVER_2---------
 dropped the key
-------DRIVER_2---------
 get the key
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns 

*/
