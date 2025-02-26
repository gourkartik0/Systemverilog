module clock_generation.sv;
  reg clk_9MHz=1'b0;
  reg clk_100MHz =1'b0;
  reg clk_50MHz =1'b0;
  reg clk_25MHz =1'b0;
  
  always #5 clk_100MHz=~clk_100MHz;
  always begin
    #5;
    clk_50MHz=1'b1;
    #10;
    clk_50MHz=1'b0;
    #5;
  end
  always begin
    #5;
    clk_25MHz=1'b1;
    #20;
    clk_25MHz=1'b0;
    #15;
  end
  
  
  always begin
    #5;
    clk_9MHz=1'b1;
    #55.555;
    clk_9MHz=1'b0;
    #50.555;
  end
  
  initial begin
  #500;
    $finish;
  end
  
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  end
  
endmodule
