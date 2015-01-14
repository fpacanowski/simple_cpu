`include "defines.v"

module test;
  /* Make a reset that pulses once. */
  reg [3:0] aluop = `ALUOP_ADD;
  reg [7:0] a;
  reg [7:0] b;
  initial begin
     #1; aluop = `ALUOP_ADD;
     a = 1; b = 1; #1 if(out !== 2) $error("fail");
     a = 5; b = 7; #1 if(out !== 12) $error("fail");
     a = 3; b = 9; #1 if(out !== 12) $error("fail");

     aluop = `ALUOP_SUB;
     a = 1; b = 1; #1 if(out !== 0) $error("fail");
     a = 7; b = 5; #1 if(out !== 2) $error("fail");
     #100; $finish;
  end

  wire [7:0] out;
  alu alu0 (aluop, a, b, out);

//  initial
//     $monitor("At time %t, out = %h (%0d)", $time, out, out);
endmodule // test
