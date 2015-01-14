`include "defines.v"

module test;
  reg         reset = 0;
  reg         we = 0;
  reg         clk;
  reg  [31:0] i;
  reg  [5:0] addr1 = 0;
  reg  [5:0] addr2 = 1;
  reg  [5:0] wa = 0;
  reg  [31:0] wd = 0;
  wire [31:0] reg1;
  wire [31:0] reg2;
  wire [31:0] out;
  
  always
    #1 clk = !clk;

  initial begin
    #1 reset = 1;
    #1 reset = 0;
    #1 we = 1;
    #1 wa = 1;
    #1 wd = 7;
    #1 we = 0;
    #1 addr1 = 1;
    #10;
    $finish;
  end

  regfile regfile0(clk, reset, we, addr1, addr2, wa, wd, reg1, reg2, out);

  initial
     $monitor("At time %t, out = %b (%0d)", $time, reg1, reg1);
endmodule
