module regfile
  (input         clk,
   input         reset,
   input         write_enable,
   input  [5:0]  read_addr1,
   input  [5:0]  read_addr2,
   input  [5:0]  write_addr,
   input  [31:0] write_data,
   output [31:0] read_data1,
   output [31:0] read_data2,
   output [31:0] debug_data);

   reg [31:0] 	 regs [31:0];
   wire [31:0]   immediate_value;
   wire          immediate;

   wire [31:0]   r0, r1, r2;

   assign r0 = regs[0];
   assign r1 = regs[1];
   assign r2 = regs[30];

   assign read_data1 = regs[read_addr1];
   assign read_data2 = regs[read_addr2];
   assign debug_data = regs[1];

   integer 	 i;
   always @(posedge clk) begin
      if (reset) begin
	 for (i = 0; i < 8; i = i + 1) begin
	    regs[i] = 0;
	 end
         regs[31] = 32'hF000_0000;
      end else begin
	 if (write_enable) regs[write_addr] = write_data;
      end
   end
endmodule
