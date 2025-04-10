module func_coverage;
  
  bit [7:0] addr,data;
  
  covergroup c_group;
    cp1:coverpoint addr{bins a1={[1:70]};
                        bins a2={[71:150]};
                        bins a3={[151:200]};
                        bins a4={[201:255]};
    					}
    cp2:coverpoint data{bins d1={[1:60]};
                        bins d2={[61:124]};
                        bins d3={[125:195]};
                        bins d4={[196:255]};
                       }
    cp1_X_cp2: cross cp1,cp2{bins ad1=binsof(cp1.a1) && binsof(cp2.d2);
                             bins ad2=binsof(cp2.d2) && binsof(cp2.d4);
                             bins ad3=binsof(cp2.d3) && binsof(cp1.a2);
                             bins ad4=binsof(cp1.a4) && binsof(cp2.d3);
                             bins ad5=binsof(cp1.a2) && binsof(cp1.a3);
                             bins ad6=binsof(cp2.d1) && binsof(cp2.d2);
                             bins ad7=binsof(cp2.d4) && binsof(cp1.a2);
                             bins ad8=binsof(cp1.a3) && binsof(cp1.a1);
    						}
    
  endgroup
  
  c_group cg=new();
  
  initial begin
    $set_coverage_db_name("my_cg");
    
    forever begin
      cg.sample();
      #5;
    end
  end
  
  initial begin
    $monitor("@time= %0t || address = %0d || data =%0d ", $time,addr,data);
    repeat(100) begin
      addr=$random;
      data=$random;
      #5;
    end
    
    $display("Coverage = %f %%",$get_coverage());
    $finish;
  end
endmodule



//////////////           V C S   S i m u l a t i o n   R e p o r t    ///////////////////////////////////////

/*
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Apr 10 03:21 2025
@time= 0 || address = 36 || data =129 
@time= 5 || address = 9 || data =99 
@time= 10 || address = 13 || data =141 
@time= 15 || address = 101 || data =18 
@time= 20 || address = 1 || data =13 
@time= 25 || address = 118 || data =61 
@time= 30 || address = 237 || data =140 
@time= 35 || address = 249 || data =198 
@time= 40 || address = 197 || data =170 
@time= 45 || address = 229 || data =119 
@time= 50 || address = 18 || data =143 
@time= 55 || address = 242 || data =206 
@time= 60 || address = 232 || data =197 
@time= 65 || address = 92 || data =189 
@time= 70 || address = 45 || data =101 
@time= 75 || address = 99 || data =10 
@time= 80 || address = 128 || data =32 
@time= 85 || address = 170 || data =157 
@time= 90 || address = 150 || data =19 
@time= 95 || address = 13 || data =83 
@time= 100 || address = 107 || data =213 
@time= 105 || address = 2 || data =174 
@time= 110 || address = 29 || data =207 
@time= 115 || address = 35 || data =10 
@time= 120 || address = 202 || data =60 
@time= 125 || address = 242 || data =138 
@time= 130 || address = 65 || data =216 
@time= 135 || address = 120 || data =137 
@time= 140 || address = 235 || data =182 
@time= 145 || address = 198 || data =174 
@time= 150 || address = 188 || data =42 
@time= 155 || address = 11 || data =113 
@time= 160 || address = 133 || data =79 
@time= 165 || address = 59 || data =58 
@time= 170 || address = 126 || data =21 
@time= 175 || address = 241 || data =217 
@time= 180 || address = 98 || data =76 
@time= 185 || address = 159 || data =143 
@time= 190 || address = 248 || data =183 
@time= 195 || address = 159 || data =92 
@time= 200 || address = 91 || data =137 
@time= 205 || address = 73 || data =208 
@time= 210 || address = 215 || data =81 
@time= 215 || address = 150 || data =12 
@time= 220 || address = 194 || data =200 
@time= 225 || address = 119 || data =61 
@time= 230 || address = 18 || data =126 
@time= 235 || address = 109 || data =57 
@time= 240 || address = 31 || data =211 
@time= 245 || address = 133 || data =120 
@time= 250 || address = 91 || data =73 
@time= 255 || address = 63 || data =42 
@time= 260 || address = 88 || data =134 
@time= 265 || address = 142 || data =156 
@time= 270 || address = 250 || data =38 
@time= 275 || address = 115 || data =163 
@time= 280 || address = 47 || data =179 
@time= 285 || address = 95 || data =68 
@time= 290 || address = 247 || data =203 
@time= 295 || address = 230 || data =90 
@time= 300 || address = 41 || data =237 
@time= 305 || address = 218 || data =101 
@time= 310 || address = 181 || data =223 
@time= 315 || address = 121 || data =68 
@time= 320 || address = 208 || data =42 
@time= 325 || address = 171 || data =14 
@time= 330 || address = 220 || data =154 
@time= 335 || address = 253 || data =195 
@time= 340 || address = 86 || data =78 
@time= 345 || address = 103 || data =10 
@time= 350 || address = 182 || data =56 
@time= 355 || address = 121 || data =184 
@time= 360 || address = 148 || data =147 
@time= 365 || address = 4 || data =89 
@time= 370 || address = 219 || data =77 
@time= 375 || address = 217 || data =109 
@time= 380 || address = 118 || data =202 
@time= 385 || address = 182 || data =149 
@time= 390 || address = 70 || data =4 
@time= 395 || address = 247 || data =105 
@time= 400 || address = 180 || data =136 
@time= 405 || address = 40 || data =45 
@time= 410 || address = 199 || data =46 
@time= 415 || address = 8 || data =28 
@time= 420 || address = 253 || data =41 
@time= 425 || address = 28 || data =134 
@time= 430 || address = 218 || data =61 
@time= 435 || address = 102 || data =112 
@time= 440 || address = 115 || data =186 
@time= 445 || address = 94 || data =250 
@time= 450 || address = 213 || data =26 
@time= 455 || address = 185 || data =55 
@time= 460 || address = 150 || data =192 
@time= 465 || address = 38 || data =182 
@time= 470 || address = 125 || data =220 
@time= 475 || address = 134 || data =120 
@time= 480 || address = 126 || data =219 
@time= 485 || address = 207 || data =121 
@time= 490 || address = 250 || data =97 
@time= 495 || address = 23 || data =161 
Coverage = 93.333336 %
$finish called from file "testbench.sv", line 48.
$finish at simulation time                  500
           V C S   S i m u l a t i o n   R e p o r t 
Time: 500 ns
CPU Time:      0.440 seconds;       Data structure size:   0.0Mb
*/
