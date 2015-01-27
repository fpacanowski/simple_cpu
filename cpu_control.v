module cpu_control
 (input  [31:0] instruction,
  output reg [5:0] src_reg1,
  output reg [5:0] src_reg2,
  output reg [5:0] dst_reg,
  output reg [31:0] immediate_value,
  output reg immediate,
  output reg do_jump,
  output reg [31:0] jump_address);

  wire [6:0] opcode;
  wire [5:0] rs, rt, rd;

  assign opcode = instruction[31:26];
  assign rs = instruction[25:21];
  assign rt = instruction[20:16];
  assign rd = instruction[15:11];

  always @(*) begin
    if(opcode == 6'b000000) begin //R-type
      src_reg1 <= rs;
      src_reg2 <= rt;
      dst_reg  <= rd;
      immediate_value <= 32'bz;
      immediate <= 0;
      do_jump <= 0;
    end else if(opcode == 6'b000010) begin
      do_jump <= 1;
      jump_address <= {6'd0, instruction[25:0]};
    end else begin //I-type
      src_reg1 <= rs;
      src_reg2 <= 32'bz;
      dst_reg  <= rt;
      immediate_value <= instruction[15:0];
      immediate <= 1;
      do_jump <= 0;
    end
  end

endmodule
