// Code your testbench here
// or browse Examples
module assert_example;
  bit clk,a,b;
  
  always #5 clk=~clk;
  
  sequence seq;
    @(posedge clk) a ##1 b;
  endsequence
    
  
  property prop;
    seq;
  endproperty
  
  assert property(prop);
    
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
      
      a=0;
      b=0;
      
      a=1; b=0; //1
      
      #10 a=1; b=1;  //2
      #10 a=0; b=0;  //3
      #10 a=1; b=0;  //4
      #10 a=1; b=0;  //5
      #10 a=1; b=1;  //6
      #10 a=0; b=1;  //7
      #10 a=1; b=0;  //8
      #10 a=0; b=0;  //9
      #10 a=0; b=0;  //10
      #10 a=0; b=1;  //11
      #10 a=0; b=0;  //12
      #10 a=1; b=0;  //13
      #10 a=0; b=0;  //14
      #10 a=0; b=1;  //15
      #20; $finish;
      
    end 
    endmodule



    /*
    Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Apr 11 03:17 2025
"testbench.sv", 17: assert_example.unnamed$$_0: started at 25ns failed at 25ns
	Offending 'a'
"testbench.sv", 17: assert_example.unnamed$$_0: started at 15ns failed at 25ns
	Offending 'b'
"testbench.sv", 17: assert_example.unnamed$$_0: started at 35ns failed at 45ns
	Offending 'b'
"testbench.sv", 17: assert_example.unnamed$$_0: started at 65ns failed at 65ns
	Offending 'a'
"testbench.sv", 17: assert_example.unnamed$$_0: started at 85ns failed at 85ns
	Offending 'a'
"testbench.sv", 17: assert_example.unnamed$$_0: started at 75ns failed at 85ns
	Offending 'b'
"testbench.sv", 17: assert_example.unnamed$$_0: started at 95ns failed at 95ns
	Offending 'a'
"testbench.sv", 17: assert_example.unnamed$$_0: started at 105ns failed at 105ns
	Offending 'a'
"testbench.sv", 17: assert_example.unnamed$$_0: started at 115ns failed at 115ns
	Offending 'a'
"testbench.sv", 17: assert_example.unnamed$$_0: started at 135ns failed at 135ns
	Offending 'a'
"testbench.sv", 17: assert_example.unnamed$$_0: started at 125ns failed at 135ns
	Offending 'b'
"testbench.sv", 17: assert_example.unnamed$$_0: started at 145ns failed at 145ns
	Offending 'a'
"testbench.sv", 17: assert_example.unnamed$$_0: started at 155ns failed at 155ns
	Offending 'a'
$finish called from file "testbench.sv", line 42.
$finish at simulation time                  160
           V C S   S i m u l a t i o n   R e p o r t 
Time: 160 ns
    */
