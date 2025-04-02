// Code your testbench here
// or browse Examples
module test_array();

        // Declare a dynamic array data_da of int data type
  int data_da[];
        // Declare queues data_q & addr_q of int data type
  int data_q[$],addr_q[$];

        // Declare associative array data_mem of int data type and indexed with bit[7:0]
  int data_mem[bit[7:0]];
        // Declare int variable result,and and an 8 bit variable idx
  int result;
  bit [7:0] idx;
                
        initial
                begin

                        // Allocate 10 memory locations for dynamic array & initialize
                        // all the locations with some random values less than 20 & display the array
                        
                  data_da=new[10];
                  foreach(data_da[i]) data_da[i]={$random} % 20;
                  $display("value inside dynamic array data_da : %p",data_da);

                        // Call the array reduction method sum which returns the sum
                        // of all elements of array and collect the return value to the variable result
                  result=data_da.sum();
                  $display("Sum of all variable inside dynamic variable is %0d",result);

                        // Display the sum of elements, result
                   // Similarly explore other array reduction methods
                        // product,or,and & xor
                  result=data_da.product();
                  $display("product of all variable inside dynamic variable is %0d",result);
                  
                  result=data_da.or();
                  $display("Or of all variable inside dynamic variable is %0d",result);
                  
                  result=data_da.xor();
                  $display("Xor of all variable inside dynamic variable is %0d",result);
                        
                        // Call the array reduction method sum with "with" clause which returns
                        // total number of elements satisfying the condition within the "with" clause
                  result=data_da.product() with (int'(item<9));
                  $display("product of all variable inside dynamic variable item less than 9 is %0d",result);
                  
                  result=data_da.or() with (int'(item<9));
                  $display("Or of all variable inside dynamic variable item less than 9 is %0d",result);
                  
                  result=data_da.xor() with (int'(item<9));
                  $display("Xor of all variable inside dynamic variable item less than 9 is %0d",result);				

                        // Display the value of the result


                        // Similarly explore other array reduction methods with "with"clause



                        // Sorting Methods

                        // call all the sorting methods like reverse, sort, rsort &
                        // shuffle & display the array after execution of each method to
                        // understand the behaviour of the array methods
                  
                  
                  data_da.reverse();
                  $display("data inside data_da after reverse %p",data_da);
                  
                  data_da.sort();
                  $display("data inside data_da after sort %p",data_da);
                  
                  data_da.rsort();
                  $display("data inside data_da after reverse sort %p",data_da);
                  
                  
                  data_da.shuffle();
                  $display("data inside data_da after shuffle %p",data_da);
                  
                  
                        
                  
                  // Call Array locator methods like min, max, unique,find_* with,
                        // find_*_index with using dynamic array & display
                        // the contents of data_q after execution of each method to
                        // understand the behaviour of the array methods
                 data_q=data_da.min();
                  $display("Smallest data inside data_da %p",data_q );
                  
                  data_q= data_da.max();
                  $display("Maximum data inside data_da %p",data_q );
                  
                  data_q= data_da.unique();
                  $display("unique data inside data_da %p",data_q );
                  
                   data_q= data_da.unique_index();
                  $display("unique index data inside data_da %p",data_q );
                  
                  data_q= data_da.find_first() with (item > 9);
                  $display("first data inside item > 9 data_da %p",data_q );
                  
                  
                  data_q= data_da.find_first_index() with (item > 9);
                  $display("first_index data inside item > 9 data_da %p",data_q );
                  
                  
                  data_q= data_da.find_last() with (item > 9);
                  $display("last data inside item > 9 data_da %p",data_q );
                  
                  
                  data_q= data_da.find_last_index() with (item > 9);
                  $display("last_index data inside item > 9 data_da %p",data_q );
                  
                  data_q= data_da.find with (item > 9);
                  $display("item greater than inside item > 9 data_da %p",data_q );
                  
                  

                        //Generate some 10 random address less than 100 within a repeat loop
                        //push the address in to the addr_q
                  $display("\n 10 random address push the address in to the addr_q \n");
                  repeat(10)begin
                    result={$random}%100;
                    data_q.push_back(result);
                  end

                        //Display the addr_q
                  $display("Data inside data_q %p \n ", data_q);


                        // With in for loop update the associate array with random data less than 200
                        // based on the address stored in addr_q
                        // Hint: To get the address use pop method
                        
                  
                  for(int i=0; i<10 ; i++)begin
                    data_mem[data_q.pop_front()]={$random}%200;
                  end
                    
                        // Display the contents of associate array using foreach loop
                  foreach(data_mem[i])
                                     $display("Data inside associative array data_mem[%0d] = %0d ", i,data_mem[i]);                  

                        // Display the first index of the array by using associative array method first
                        
                  data_mem.first(idx);
                  $display("First index of associative array %d",idx);
                  $display("Value at First index of associative array %d",data_mem[idx]);
                  

                        // Display the first element of the array

                        // Display the last index of the array by using associative array method last
                        
                  
                        // Display the last element of the array
                  data_mem.last(idx);
                  $display("Last index of associative array %d",idx);
                  $display("Value at Last index of associative array %d",data_mem[idx]);
                  
                end

endmodule






/*
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Apr  1 21:32 2025


value inside dynamic array data_da : '{8, 17, 17, 7, 17, 17, 5, 2, 1, 9} 
Sum of all variable inside dynamic variable is 100
product of all variable inside dynamic variable is 420945840
Or of all variable inside dynamic variable is 31
Xor of all variable inside dynamic variable is 0
product of all variable inside dynamic variable item less than 9 is 0
Or of all variable inside dynamic variable item less than 9 is 1
Xor of all variable inside dynamic variable item less than 9 is 1
data inside data_da after reverse '{9, 1, 2, 5, 17, 17, 7, 17, 17, 8} 
data inside data_da after sort '{1, 2, 5, 7, 8, 9, 17, 17, 17, 17} 
data inside data_da after reverse sort '{17, 17, 17, 17, 9, 8, 7, 5, 2, 1} 
data inside data_da after shuffle '{2, 7, 5, 1, 8, 17, 17, 9, 17, 17} 
Smallest data inside data_da '{1} 
Maximum data inside data_da '{17} 
unique data inside data_da '{2, 7, 5, 1, 8, 17, 9} 
unique index data inside data_da '{0, 1, 2, 3, 4, 5, 7} 
first data inside item > 9 data_da '{17} 
first_index data inside item > 9 data_da '{5} 
last data inside item > 9 data_da '{17} 
last_index data inside item > 9 data_da '{9} 
item greater than inside item > 9 data_da '{17, 17, 17, 17} 

 10 random address push the address in to the addr_q 

Data inside data_q '{17, 17, 17, 17, 18, 97, 29, 12, 89, 26, 97, 22, 85, 55}  
 
Data inside associative array data_mem[12] = 93 
Data inside associative array data_mem[17] = 150 
Data inside associative array data_mem[18] = 168 
Data inside associative array data_mem[26] = 189 
Data inside associative array data_mem[29] = 84 
Data inside associative array data_mem[89] = 29 
Data inside associative array data_mem[97] = 53 
First index of associative array  12
Value at First index of associative array          93
Last index of associative array  97
Value at Last index of associative array          53
           V C S   S i m u l a t i o n   R e p o r t 
*/
