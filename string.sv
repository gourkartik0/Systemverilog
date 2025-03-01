// Code your testbench here
// or browse Examples
module stri;
  string str="Maven_Silicon";
  
  
  initial begin
    
    
  str=str.tolower();
    disp(str);
    #5;
    str.putc(5,"-");
    disp(str);
    #5;
    str={str,".com"};
    disp(str);
    #5;
    disp($sformatf("//https.%s",str));
    
  
  end
  
  task disp(input string str);
    $display("at time t=%0t inside string %s",$time,str);
  endtask
  
endmodule
