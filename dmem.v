`include "uart.v"

module dmem(
  input clk,
  input write_enable,
  input [31:0] addr,
  input [31:0] write_data,
  output [31:0] read_data);

  reg [31:0] RAM[63:0];

  assign read_data = RAM[addr];
  wire tx;
  reg [7:0] tx_byte = 0;
  reg transmit = 0;

  uart #(.CLOCK_DIVIDE( 1 )) uart0(
    .clk(clk),
    .tx(tx),
    .transmit(transmit),
    .tx_byte(tx_byte)
  );

  always @(posedge clk)
    if (write_enable) begin
      case(addr)
        32'hF000_0000: transmit <= write_data[0];
        32'hF000_0001: tx_byte <= write_data[7:0];
        default:       RAM[addr] <= write_data;
      endcase
    end
endmodule
