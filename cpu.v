`include "defines.v"

module cpu
 (input         clk,
  input         reset,
  output [31:0] debug_inst,
  output [31:0] debug_data);

  reg [31:0] 	 regs [0:7];
  reg [31:0] pc;
  wire [31:0] reg1, reg2, alu_out, alu_in;
  wire [31:0] current_instruction;
  wire [31:0] immediate_value;
  wire [5:0] src_reg1, src_reg2, dst_reg;
  wire immediate;

  assign debug_inst = current_instruction;
  assign alu_in = immediate ? immediate_value : reg2;

  imem imem0(pc, current_instruction);
  //regfile regfile0(clk, reset, 1, current_instruction[9:5], current_instruction[4:0], 1 
  regfile regfile0(clk, reset, 1, src_reg1, src_reg2, dst_reg, alu_out, reg1, reg2, debug_data);
  alu alu0(`ALUOP_ADD, reg1, alu_in, alu_out);

  cpu_control cpu_control0(
    current_instruction,
    src_reg1,
    src_reg2,
    dst_reg,
    immediate_value,
    immediate
  );

  always @(posedge clk) begin
      if (reset) begin
         pc = 0;
      end else begin
         pc = pc + 1;
      end
  end
endmodule
