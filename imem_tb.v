`include "defines.v"

module test;
  reg  [31:0] i;
  reg  [31:0] addr;
  wire [31:0] out;
  
  initial begin
    #1; addr = 0;
    for(i = 0; i < 64; i = i+1) begin
      #1; addr = addr+1;
    end
  end

  imem imem0 (addr, out);

  initial
     $monitor("At time %t, out = %b (%0d)", $time, out, out);
endmodule
