module dmem(
  input clk,
  input rst,
  input write_enable,
  input [31:0] addr,
  input [31:0] write_data,
  output [31:0] read_data,
  input rx,
  output tx);

  reg [31:0] RAM[63:0];

  assign read_data = (addr == 32'hF000_0000) ? {30'd0, received_reg, is_transmitting} :
                     (addr == 32'hF000_0001) ? rx_byte : RAM[addr];
  
  reg [7:0] tx_byte = 0;
  reg transmit = 0;
  wire is_transmitting, received;
  wire [7:0] rx_byte;
  reg received_reg = 0;

  uart #(.CLOCK_DIVIDE( 1302 )) uart0(
    .clk(clk),
    .tx(tx),
    .rx(rx),
    .transmit(transmit),
    .tx_byte(tx_byte),
    .rx_byte(rx_byte),
    .rst(rst),
    .is_transmitting(is_transmitting),
    .received(received)
  );

  always @(posedge clk) begin
    if(rst)
      received_reg = 0;
    if (write_enable) begin
      case(addr)
        32'hF000_0000: transmit = write_data[0];
        32'hF000_0001: tx_byte = write_data[7:0];
        32'hF000_0010: received_reg = write_data[0];
        default:       RAM[addr] = write_data;
      endcase
    end
    if(received)
      received_reg = received;
  end
endmodule
