// Code your testbench here
// or browse Examples
module dynamic_array;
  int arr[];
  initial begin
    arr=new[10];
    arr='{15,25,3,12,6,8,1,2,23,7};
    
    $display("Before sorting the array %p",arr);
  //  foreach(arr[i])$display("array[%0d] = %0d",i,arr[i]);
    
    /*foreach(arr[i])begin
      if(arr[i+1]<arr[i])begin
        arr[i]=arr[i+1];
      end
      else arr[i]=arr[i];
    end*/
    for(int i=0;i<10;i=i+1)begin
      for(int j=0;j<10-i;j=j+1)begin
        if(arr[j]>arr[j+1])begin
          arr[j]=arr[j]+arr[j+1];
          arr[j+1]=arr[j]-arr[j+1];
          arr[j]=arr[j]-arr[j+1];
        end
        else arr[j]=arr[j];
      end
    end
    
    $display("After sorting the array",arr);
    //foreach(arr[i])$display("array[%0d] = %0d",i,arr[i]); 
    
    end
endmodule




/////////////////////////////////////////////////////////////////////////////SECOND TYPE////////////////////////////////////////////////////////////////////////////////////////


// Code your testbench here
// or browse Examples
class dynamic_array;
  int arr[];
  
  function void swap(ref int a,ref int b);
    int temp;
    temp=a;
    a=b;
    b=temp;
  endfunction
  
  function void sort();
    
    for(int i=0; i<arr.size(); i=i+1) begin
      
      for(int j=0 ;j<arr.size()-i-1 ;j=j+1 )begin
        
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
        da.arr=new[10];
      //  assert(da.randomize()) else $fatal("Randomization failed!");
        da.arr='{15,25,3,12,6,8,1,2,23,7};
        da.display("Before");
        da.sort();
        da.display("After");
        
        end
    endmodule
        
