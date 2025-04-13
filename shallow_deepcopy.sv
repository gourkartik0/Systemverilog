// Code your testbench here
// or browse Examples
//implication operator

class packet;
  rand int value;
  rand bit[7:0]data[];
  
  function new();
    data=new[3];
  endfunction
  
  function packet clone();
    packet p;
    
    p.value=this.value;
    p.data=new[data.size()];
    
    foreach(data[i])
      p.data[i]=this.data[i];
    return p;
  endfunction
endclass

module tb;
  packet d1;
  
  initial begin
    d1=new();
    d1.id=5;
    d1.data='{21,3,12};
    
    packet d2 = d1;
    
    $display("packet d1 -> id=%0d, data=%p",d1.id,d1.data);
    $display("packet d2 -> id=%0d, data=%p",d2.id,d2.data);
    

    packet d3;
    d3=d1.clone();
    
    $display("packet d1 -> id=%0d, data=%p",d1.id,d1.data);
    $display("shallow copy packet d2 -> id=%0d, data=%p",d2.id,d2.data);
    $display("deepcopy packet d3 -> id=%0d, data=%p",d3.id,d3.data);
    
    $display("\n Modification \n")
    
    d1.data[0]=10;
    d1.data[2]=44;
    
    $display("d1.data[0]=10; d1.data[2]=44;");
    
    $display("packet d1 -> id=%0d, data=%p",d1.id,d1.data);
    $display("shallow copy packet d2 -> id=%0d, data=%p",d2.id,d2.data);
    $display("deepcopy packet d3 -> id=%0d, data=%p",d3.id,d3.data);
    
  end
endmodule
endmodule
