`timescale 1ns / 1ps
`include "defines.v"

module test;
  reg         reset = 0;
  reg         clk = 0;
  wire [31:0] debug_inst;
  wire [31:0] debug_data;
  
  always
    #1 clk = !clk;

  initial begin
    #1 reset = 1;
    #10;
    #1 reset = 0;
    #50000;
    $finish;
  end

  cpu cpu0(clk, reset, debug_inst, debug_data);

  initial begin
    $dumpfile("out.vcd");
    $dumpvars(0, test);
    $monitor("At time %t, out = %b (%0d)", $time, debug_data, debug_data);
  end
endmodule
