//------------------------------------------------
// imem.v
// David_Harris@hmc.edu 23 October 2005
// Instruction memory used by MIPS pipelined
// processor
//------------------------------------------------

module imem(input  [31:0] addr,
            output [31:0] data);

  reg  [31:0] RAM[255:0];

  initial
    begin
      //$readmemh("memfile.dat",RAM);
      RAM[0]  = 32'b001000_00000_00000_0000000000000001; // addi r0, r0, 1
      RAM[1]  = 32'b001000_00001_00001_0000000000000001; // addi r1, r1, 1

      RAM[2]  = 32'b000000_00000_00001_00010_00000000001; // add r2, r0, r1
      RAM[3]  = 32'b001000_00001_00000_0000000000000000; // addi r0, r1, 0
      RAM[4]  = 32'b001000_00010_00001_0000000000000000; // addi r1, r2, 0
      
      RAM[5]  = 32'b000000_00000_00001_00010_00000000001; // add r2, r0, r1
      RAM[6]  = 32'b001000_00001_00000_0000000000000000; // addi r0, r1, 0
      RAM[7]  = 32'b001000_00010_00001_0000000000000000; // addi r1, r2, 0

      RAM[8]  = 32'b000000_00000_00001_00010_00000000001; // add r2, r0, r1
      RAM[9]  = 32'b001000_00001_00000_0000000000000000; // addi r0, r1, 0
      RAM[10] = 32'b001000_00010_00001_0000000000000000; // addi r1, r2, 0

      RAM[11] = 32'b000000_00000_00001_00010_00000000001; // add r2, r0, r1
      RAM[12] = 32'b001000_00001_00000_0000000000000000; // addi r0, r1, 0
      RAM[13] = 32'b001000_00010_00001_0000000000000000; // addi r1, r2, 0

      RAM[14] = 32'b000000_00000_00001_00010_00000000001; // add r2, r0, r1
      RAM[15] = 32'b001000_00001_00000_0000000000000000; // addi r0, r1, 0
      RAM[16] = 32'b001000_00010_00001_0000000000000000; // addi r1, r2, 0

      RAM[17] = 32'b000000_00000_00001_00010_00000000001; // add r2, r0, r1
      RAM[18] = 32'b001000_00001_00000_0000000000000000; // addi r0, r1, 0
      RAM[19] = 32'b001000_00010_00001_0000000000000000; // addi r1, r2, 0

      RAM[20] = 32'b000000_00000_00001_00010_00000000001; // add r2, r0, r1
      RAM[21] = 32'b001000_00001_00000_0000000000000000; // addi r0, r1, 0
      RAM[22] = 32'b001000_00010_00001_0000000000000000; // addi r1, r2, 0

      RAM[23] = 32'b000000_00000_00001_00010_00000000001; // add r2, r0, r1
      RAM[24] = 32'b001000_00001_00000_0000000000000000; // addi r0, r1, 0
      RAM[25] = 32'b001000_00010_00001_0000000000000000; // addi r1, r2, 0

      RAM[26] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[27] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[28] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[29] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[30] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[31] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[32] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[33] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[34] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[35] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[36] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[37] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[38] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[39] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[40] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[41] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[42] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[43] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[44] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[45] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[46] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[47] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[48] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[49] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[50] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[51] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[52] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[53] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[54] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[55] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[56] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[57] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[58] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[59] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[60] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[61] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[62] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[63] = 32'b00001000000000000000000000000001; // j    1
/*      RAM[0] =  32'b001000_00000_00001_0000000000000001; // addi r1, r0, 1
      RAM[1] =  32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[2] =  32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[3] =  32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[4] =  32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[5] =  32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[6] =  32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[7] =  32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[8] =  32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[9] =  32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[10] = 32'b000000_00001_00001_00001_00000000001; // add r1, r1, r1
      RAM[11] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[12] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[13] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[14] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[15] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[16] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[17] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[18] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[19] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[20] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[21] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[22] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[23] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[24] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[25] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[26] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[27] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[28] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[29] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[30] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[31] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[32] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[33] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[34] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[35] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[36] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[37] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[38] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[39] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[40] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[41] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[42] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[43] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[44] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[45] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[46] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[47] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[48] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[49] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[50] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[51] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[52] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[53] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[54] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[55] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[56] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[57] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[58] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[59] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[60] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[61] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[62] = 32'b00100000001000010000000000000001; // addi r1, r1, 1
      RAM[63] = 32'b00001000000000000000000000000001; // j    1
*/    end
  assign data = RAM[addr]; // word aligned
endmodule