`include "defines.v"
module cpu_control
 (input  [31:0] instruction,
  output reg [5:0] src_reg1,
  output reg [5:0] src_reg2,
  output reg [5:0] dst_reg,
  output [31:0] immediate_value,
  output reg immediate,
  output reg do_jump,
  output reg [31:0] jump_address,
  output reg [3:0] aluop,
  output reg alu_jump,
  output reg write_enable);

  wire [5:0] opcode;
  wire [5:0] rs, rt, rd;

  assign opcode = instruction[31:26];
  assign rs = instruction[25:21];
  assign rt = instruction[20:16];
  assign rd = instruction[15:11];
  assign immediate_value = instruction[15:0];

  always @(*) begin
    if(opcode == 6'b000000) begin //R-type
      src_reg1 <= rs;
      src_reg2 <= rt;
      dst_reg  <= rd;
      immediate <= 0;
      do_jump <= 0; 
      aluop <= `ALUOP_ADD;
      alu_jump <= 0;
      write_enable <= 1;
    end else if(opcode == 6'b000010) begin //J 
      do_jump <= 1;
      alu_jump <= 0;
      jump_address <= {6'd0, instruction[25:0]};
      write_enable <= 0;
    end else if(opcode == 6'b000101) begin //BNE
      do_jump <= 1;
      alu_jump <= 1;
      aluop <= `ALUOP_COMP;
      jump_address <= {16'd0, immediate_value};
      immediate <= 0;
      src_reg1 <= rs;
      src_reg2 <= rt;
      write_enable <= 0;
    end else begin //I-type
      src_reg1 <= rs;
      src_reg2 <= 32'bz;
      dst_reg  <= rt;
      immediate <= 1;
      do_jump <= 0;
      aluop <= `ALUOP_ADD;
      alu_jump <= 0;
      write_enable <= 1;
    end
  end

endmodule
