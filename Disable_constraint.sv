class random_seq;
  rand bit [7:0] data;
  rand bit [7:0] value;
  
  constraint c1{data>10; data<80;}
  constraint c2{value inside {[20:70]};}
  
endclass

module seq_exp;
  random_seq item;
  
  initial begin
    item=new();
    
    item.randomize();
    
    $display("data=%0d, value=%0d",item.data, item.value);
    
    $display("Disabling the complete randomization class");
    item.rand_mode(0);//Disabling the complete randomization class
    $display("data=%0d, value=%0d",item.data, item.value);
    
    $display("Enabling the randomization class");
    item.randomize();//Enabling the randomization class
    $display("data=%0d, value=%0d",item.data, item.value);
    
    
    $display("Disabling the data rand variable randomization class");
    item.data.rand_mode(0);//Disabling the data rand variable randomization class
    $display("data=%0d, value=%0d",item.data, item.value);

    $display("Enabling the randomization class");
    item.randomize();//Enabling the randomization class
    $display("data=%0d, value=%0d",item.data, item.value);
    
    
    $display("Disabling the c2 constraint in randomization class random_seq");
    item.c2.constraint_mode(0); //Disabling the c2 constraint in randomization class random_seq
    $display("data=%0d, value=%0d",item.data, item.value);

    
  end
endmodule
