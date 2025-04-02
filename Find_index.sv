// Code your testbench here
// or browse Examples
module iterator_index_ex;
  int arr[8] = '{5,6,9,2,4,4,6,7};
  int q[$], qsize;
  
  initial begin
    //q = arr.find(x) with (x == x.index);
    //or
    //q = arr.find with (item == item.index);
    foreach(arr[i])begin
      if(arr[i]!=i) q.push_back(arr[i]);
    end
    qsize = q.size();
    $display("Count = %0d having same index and element", qsize);
    $display("same index and elements are %p", q);
  end
endmodule
