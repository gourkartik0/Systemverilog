// Code your testbench here
// or browse Examples
class pass_by_ref;
  
  int a=2;
  int b=2;
  
  function automatic inc_ref(ref int r);
    $display("pass by reference input value is %0d",r);
    r++;
    $display("value after increment: %0d",r);
  endfunction
  
  function automatic inc_value(input int r);
    $display("pass by value input value is %0d",r);
    r++;
    $display("value after increment: %0d",r);
  endfunction
  
endclass

module tb;
  pass_by_ref h1;
  
  initial begin
    h1=new();
    repeat(3)begin
      h1.inc_ref(h1.a);
      h1.inc_value(h1.b);
      
      $display("Original Value after call by refrence %0d ",h1.a);
      $display("Original Value after call by value  %0d \n",h1.b);
    
  end
  end
endmodule







/////////////////////  V C S   S i m u l a t i o n   R e p o r t ///////////////////////


/*
pass by reference input value is 2
value after increment: 3
pass by value input value is 2
value after increment: 3
Original Value after call by refrence 3 
Original Value after call by value  2 

pass by reference input value is 3
value after increment: 4
pass by value input value is 2
value after increment: 3
Original Value after call by refrence 4 
Original Value after call by value  2 

pass by reference input value is 4
value after increment: 5
pass by value input value is 2
value after increment: 3
Original Value after call by refrence 5 
Original Value after call by value  2 
*/


