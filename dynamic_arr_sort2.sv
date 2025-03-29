// Code your testbench here
// or browse Examples
class dynamic_array;
  rand int arr[];
  int size=20;
  constraint da_c{arr.size()==size; 
                  foreach(arr[i])arr[i] inside {[1:70]};}
  
 /* function void print(string s);
    $display("%s sorting the array %p",s,arr);
  endfunction */
  
  
  function void swap(ref int a,ref int b);
    int temp;
    temp=a;
    a=b;
    b=temp;
  endfunction
  
  function void sort();
    
    for(int i=0; i<size; i=i+1) begin
      
      for(int j=0 ;j<size-i-1 ;j=j+1 )begin
        
        if(arr[j]>arr[j+1])begin
          swap(arr[j],arr[j+1]);
        end
        
        else begin 
          arr[i]=arr[i];
        end
      end
    end
  endfunction
    
 function void display(string a);
    $display("%s sorting the array %p",a,arr);
  endfunction
  
 // function void display(string msg);
 //   $display("%s: %p", msg, arr);
 // endfunction
  
endclass
    
    
    module tb;
      dynamic_array da;
      initial begin
        da=new();
        assert(da.randomize()) else $fatal("Randomization failed!");
        
        da.display("Before");
        da.sort();
        da.display("After");
        
        end
    endmodule
        
