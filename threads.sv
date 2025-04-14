//fork join
//fork join_any
// fork join_none

//fork join : Parent thread will execute after all child thread will execute 
//fork join_any: Parent thread will execute after any one child thread will execute
// fork join_none : Parent thread will execute parallel to child thread

//////////////////////////// 1. Fork Join ////////////////////////


// Code your testbench here
// or browse Examples
module test_threads;

        //Execute code using fork join and observe the output
        //Execute code using fork join_any and observe the output
        //Execute code using fork join_none and observe the output

        //Observe the difference in output by commenting and uncommenting "disable thread"

        initial
                begin
                        $display("Thread_1 with delay : @%0t ", $time);
                        #20 $display("Thread_2 with delay : @%0t", $time);
                        fork: A // Thread A will be started at time t = 20
                                #40 $display("Thread A1 with delay : @%0t ", $time); //longest Thread
                                #10 $display("Thread A2 with delay : @%0t", $time);
                                begin : B //Thread B with a delay of 15
                                        #5 $display("Thread B1 with delay : @%0t", $time);
                                        #10 $display("Thread B2 with delay : @%0t", $time);
                                end : B
                                #5 $display("Thread_3 with delay : @%0t ", $time); //shortest Thread
                        join
                        // join_any
                        // join_none
                        // disable A;
                        $display("Completed fork thread A : @%0t", $time);
                        #30 $display("Thread_4 with delay : @%0t ", $time);
                end

endmodule


/*
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Apr 14 06:50 2025
Thread_1 with delay : @0 
Thread_2 with delay : @20
Thread B1 with delay : @25
Thread_3 with delay : @25 
Thread A2 with delay : @30
Thread B2 with delay : @35
Thread A1 with delay : @60 
Completed fork thread A : @60
Thread_4 with delay : @90 
           V C S   S i m u l a t i o n   R e p o r t 
Time: 90 ns
*/


/////////////////////////////2. Fork join-any ///////////////////////////////////////////////

module test_threads;

        //Execute code using fork join and observe the output
        //Execute code using fork join_any and observe the output
        //Execute code using fork join_none and observe the output

        //Observe the difference in output by commenting and uncommenting "disable thread"

        initial
                begin
                        $display("Thread_1 with delay : @%0t ", $time);
                        #20 $display("Thread_2 with delay : @%0t", $time);
                        fork: A // Thread A will be started at time t = 20
                                #40 $display("Thread A1 with delay : @%0t ", $time); //longest Thread
                                #10 $display("Thread A2 with delay : @%0t", $time);
                                begin : B //Thread B with a delay of 15
                                        #5 $display("Thread B1 with delay : @%0t", $time);
                                        #10 $display("Thread B2 with delay : @%0t", $time);
                                end : B
                                #5 $display("Thread_3 with delay : @%0t ", $time); //shortest Thread
                        join_any
                        // join_any
                        // join_none
                        // disable A;
                        $display("Completed fork thread A : @%0t", $time);
                        #30 $display("Thread_4 with delay : @%0t ", $time);
                end

endmodule


/*
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Apr 14 07:04 2025
Thread_1 with delay : @0 
Thread_2 with delay : @20
Thread B1 with delay : @25
Thread_3 with delay : @25 
Completed fork thread A : @25
Thread A2 with delay : @30
Thread B2 with delay : @35
Thread_4 with delay : @55 
Thread A1 with delay : @60 
           V C S   S i m u l a t i o n   R e p o r t 
Time: 60 ns
*/

/////////////////////////// 3. Fork Join_none //////////////////////////////////

module test_threads;

        //Execute code using fork join and observe the output
        //Execute code using fork join_any and observe the output
        //Execute code using fork join_none and observe the output

        //Observe the difference in output by commenting and uncommenting "disable thread"

        initial
                begin
                        $display("Thread_1 with delay : @%0t ", $time);
                        #20 $display("Thread_2 with delay : @%0t", $time);
                        fork: A // Thread A will be started at time t = 20
                                #40 $display("Thread A1 with delay : @%0t ", $time); //longest Thread
                                #10 $display("Thread A2 with delay : @%0t", $time);
                                begin : B //Thread B with a delay of 15
                                        #5 $display("Thread B1 with delay : @%0t", $time);
                                        #10 $display("Thread B2 with delay : @%0t", $time);
                                end : B
                                #5 $display("Thread_3 with delay : @%0t ", $time); //shortest Thread
                        join_none
                        // join_any
                        // join_none
                        // disable A;
                        $display("Completed fork thread A : @%0t", $time);
                        #30 $display("Thread_4 with delay : @%0t ", $time);
                end

endmodule


/*
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Apr 14 07:06 2025
Thread_1 with delay : @0 
Thread_2 with delay : @20
Completed fork thread A : @20
Thread B1 with delay : @25
Thread_3 with delay : @25 
Thread A2 with delay : @30
Thread B2 with delay : @35
Thread_4 with delay : @50 
Thread A1 with delay : @60 
           V C S   S i m u l a t i o n   R e p o r t 
Time: 60 ns
*/


