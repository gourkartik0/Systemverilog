// Code your testbench here
// or browse Examples
module task_automatic;
  task automatic double(int a, string s);
    #5;
    a=a*2;
    $display("in time t=%0t,s=%s ,a=%0d ",$time,s,a );
  endtask
  initial begin
  fork
    begin
      double(5,"Thread1");
    end
    
    begin
      #2;
      double(4,"Thread2");
    end
     begin
      #3;
       double(3,"Thread3");
    end
  join
  
  end
endmodule

/*
OUTPUT
in time t=5,s=Thread1 ,a=10 
in time t=7,s=Thread2 ,a=8 
in time t=8,s=Thread3 ,a=6
*/
