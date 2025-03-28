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
    
