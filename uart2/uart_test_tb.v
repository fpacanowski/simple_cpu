`timescale 1ns / 1ps
module test;
  reg         reset = 0;
  reg         clk = 0;
  
  always
    #1 clk = !clk;

  initial begin
    reset = 1;
    #100;
    reset = 0;
    #500000;
    $finish;
  end

  wire tx, rx;

  uart_test #(.DELAY(2000), .UART_CLOCK_DIVIDE(10)) uart_test0(
    .clk(clk),
    .reset(reset),
    .srx_pad_i(rx),
    .stx_pad_o(tx)
  );

  initial begin
    $dumpfile("out.vcd");
    $dumpvars(0, test);
    $monitor("At time %t, tx = %b", $time, tx);
  end
endmodule
