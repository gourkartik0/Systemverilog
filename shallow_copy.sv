// Code your testbench here
// or browse Examples
class nested;
  bit[31:0] data;
  bit err;
  
  function new(bit[31:0] data,bit err);
	this.data=data;
    this.err=err;
  endfunction
endclass

class trans;
  bit [31:0] t_data;
  int t_err;
  nested nest;
  
  function new();
    t_data=100;
    t_err=2;
    nest=new(32'h1234_ffff,1);
  endfunction
  function void display();
    $display("Parent data:  data: %0d  err: %0d",t_data,t_err);
    $display(" Nested data:  data: %0h  err: %0d",nest.data,nest.err);
  endfunction
  
endclass

module tb;
  trans t1,t2;
  initial begin
    t1=new;
    
    t1.display();
    t2=new t1;
    
    t2.display();
   
    t1.t_data=200;
    t1.t_err=3;
    t1.nest.data=32'hffff_ffff;
    t1.nest.err=0;
    
    t1.display();
    t2.display();
    
    end
endmodule


/*             V C S   S i m u l a t i o n   R e p o r t 


Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Apr 14 2025
Parent data:  data: 100  err: 2
 Nested data:  data: 1234ffff  err: 1
Parent data:  data: 100  err: 2
 Nested data:  data: 1234ffff  err: 1
Parent data:  data: 200  err: 3
 Nested data:  data: ffffffff  err: 0
Parent data:  data: 100  err: 2
 Nested data:  data: ffffffff  err: 0

*/
