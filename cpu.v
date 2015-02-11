`include "defines.v"
`include "dmem.v"

module cpu
 (input         clk,
  input         reset,
  output [31:0] debug_inst,
  output [31:0] debug_data);

  reg [31:0] pc;
  wire [31:0] reg1, reg2, alu_out, alu_in;
  wire [31:0] current_instruction;
  wire [31:0] immediate_value;
  wire [5:0] src_reg1, src_reg2, dst_reg;
  wire immediate;
  wire [31:0] jump_address;
  wire [3:0] aluop;
  wire [31:0] mem_addr;
  wire [31:0] dmem_in;
  wire [31:0] dmem_out;
  wire [31:0] reg_write_data;

  wire jump, branch, write_mem, write_reg;

  assign debug_inst = current_instruction;
  assign immediate_value = { {16{current_instruction[15]}}, current_instruction[15:0] }; //sign extension

  //regfile regfile0(clk, reset, 1, current_instruction[9:5], current_instruction[4:0], 1 

  //assign dmem_in = alu_out;
  //assign reg_write_data

  //components initialization

  imem imem0(pc, current_instruction);
  alu alu0(aluop, reg1, alu_in, alu_out);
 
  cpu_control cpu_control0(
    .instruction(current_instruction),
    .src_reg1(src_reg1),
    .src_reg2(src_reg2),
    .dst_reg(dst_reg),
    .immediate(immediate),
    .jump(jump),
    .branch(branch),
    .jump_address(jump_address),
    .aluop(aluop),
    .write_reg(write_reg),
    .write_mem(write_mem),
    .read_mem(read_mem)
  );

  dmem dmem0(
    .clk(clk),
    .write_enable(write_mem),
    .addr(mem_addr),
    .write_data(dmem_in),
    .read_data(dmem_out)
  );
  
  regfile regfile0(
    .clk(clk),
    .reset(reset),
    .write_enable(write_reg),
    .read_addr1(src_reg1),
    .read_addr2(src_reg2),
    .write_addr(dst_reg),
    .write_data(reg_write_data),
    .read_data1(reg1),
    .read_data2(reg2),
    .debug_data(debug_data)
  );
  
  
  assign alu_in = immediate ? immediate_value : reg2;
  assign dmem_in = reg2;
  assign mem_addr = alu_out;
  assign reg_write_data = read_mem ? dmem_out : alu_out;

  //program counter logic

  always @(posedge clk) begin
    if (reset) begin
      pc = 0;
    end else begin
      if(branch || jump) begin
        pc = ((branch && alu_out) || jump) ? jump_address : (pc + 1);
      end else begin
        pc = pc+1;
      end
    end
  end
endmodule
