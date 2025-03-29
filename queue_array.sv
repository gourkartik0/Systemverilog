module queue_array;
  
  string queue_arr[$];
  string queue_arr2[$];
  
  initial begin

    $display("size of array %0d",queue_arr.size());
    
    queue_arr={"LION","TIGER"};
    
    $display("size of array %0d",queue_arr.size());
    $display("Value inside the array %p",queue_arr);
    
    queue_arr.insert(0,"CAT");
    queue_arr.insert(2,"RAT");
    
    $display("size of array %0d",queue_arr.size());
    $display("Value inside the array %p",queue_arr);
    
    queue_arr2 ={"DUCK","KINGFISHER","OSTRICH"};
    
    
    $display("size of 2nd array %0d",queue_arr2.size());
    $display("Value inside the 2nd array %p",queue_arr2);
    //inserting a queue inside another queue using insert() is not allowed in SystemVerilog.
    //You need to append elements individually from queue_arr2 into queue_arr. This can be done using a loop.
    foreach(queue_arr2[i])queue_arr.push_front(queue_arr2[i]);
    
    $display("size of array %0d",queue_arr.size());
    $display("Value inside the array after inserting a queue %p",queue_arr);
    
    queue_arr.push_back("ZEBRA");
    $display("\npush_back Value inside the array %p",queue_arr);
    
    queue_arr.push_front("CROW");
    $display("\npush_front Value inside the array %p",queue_arr);
    
    $display("size of array %0d",queue_arr.size());
    queue_arr.delete(2);
    $display("\nValue inside the array after delete index 2nd %p",queue_arr);
    $display("size of array %0d",queue_arr.size());
    
    queue_arr.shuffle();
    $display("\nValue inside the array after shuffle %p",queue_arr);
    
    queue_arr.pop_back();
    $display("\nValue inside the array after pop_back %p",queue_arr);
    $display("size of array %0d",queue_arr.size());
 
    
    queue_arr.delete();
    $display("\nValue inside the array after delete %p",queue_arr);
    $display("size of array %0d",queue_arr.size());
    
  end
endmodule








//////////////////////////////////////////////// V C S   S i m u l a t i o n   R e p o r t /////////////////////////////////////////////
/*

size of array 0
size of array 2
Value inside the array '{"LION", "TIGER"} 
size of array 4
Value inside the array '{"CAT", "LION", "RAT", "TIGER"} 
size of 2nd array 3
Value inside the 2nd array '{"DUCK", "KINGFISHER", "OSTRICH"} 
size of array 7
Value inside the array after inserting a queue '{"OSTRICH", "KINGFISHER", "DUCK", "CAT", "LION", "RAT", "TIGER"} 

push_back Value inside the array '{"OSTRICH", "KINGFISHER", "DUCK", "CAT", "LION", "RAT", "TIGER", "ZEBRA"} 

push_front Value inside the array '{"CROW", "OSTRICH", "KINGFISHER", "DUCK", "CAT", "LION", "RAT", "TIGER", "ZEBRA"} 
size of array 9

Value inside the array after delete index 2nd '{"CROW", "OSTRICH", "DUCK", "CAT", "LION", "RAT", "TIGER", "ZEBRA"} 
size of array 8

Value inside the array after shuffle '{"TIGER", "LION", "ZEBRA", "CAT", "DUCK", "RAT", "CROW", "OSTRICH"} 

Value inside the array after pop_back '{"TIGER", "LION", "ZEBRA", "CAT", "DUCK", "RAT", "CROW"} 
size of array 7

Value inside the array after delete '{}
size of array 0
*/









