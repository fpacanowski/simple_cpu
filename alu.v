`include "defines.v"

module alu(aluop, a, b, out);
  input  [3:0] aluop;
  input  [31:0] a, b;
  output reg [31:0] out;
  always @(aluop, a, b, out)
    case(aluop)
      `ALUOP_ADD : out = a + b;
      `ALUOP_SUB : out = a - b;
      default : out = 32'bz;
    endcase
endmodule
