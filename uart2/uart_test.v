`timescale 1ns / 1ps
module uart_test
  (input         clk,
   input         reset,
   //output [7:0]  char,
   input srx_pad_i,
   output stx_pad_o,
   output reg [7:0] led
   );

  parameter UART_CLOCK_DIVIDE = 1302;
  parameter DELAY = 5000;

   reg [7:0] 	 data [0:6];
   reg [3:0]     idx = 0;

   //reg [7:0] tx_byte;
   reg transmit = 0;
   wire [7:0] rx_byte;
   wire is_transmitting, received;

   uart #(.CLOCK_DIVIDE( UART_CLOCK_DIVIDE )) uart0(
    .clk(clk),
    .rst(reset), 
    .rx(srx_pad_i), 
    .tx(stx_pad_o), 
    //.transmit(1), 
    //.tx_byte(8'd72),
    .transmit(transmit), 
    .tx_byte(8'd72),
    .is_transmitting(is_transmitting),
    .received(received), 
    .rx_byte(rx_byte)
    /*.is_receiving, 
    .recv_error*/
    );

/*   uart #(.CLOCK_DIVIDE( 10 )) uart1(
    .clk(clk),
    .rst(reset),
    .rx(tx)
   );*/

   //assign char = data[idx];
   //assign char = 8'd72;

  reg [31:0] countdown = 0;
/*
  initial begin
    tx_byte = 8'd72;
    transmit = 1;
  end
*/
/*  always @(posedge clk) begin
    if(reset) begin
      tx_byte = 8'd72;
      transmit = 1;
    end
  end
*/

   reg wait_for_transmission = 0;

   always @(posedge clk) begin
     if (reset) begin
       idx = 6;
       led = 0;
       countdown = DELAY;
       data[0] = 8'd72;
       data[1] = 8'd69;
       data[2] = 8'd76;
       data[3] = 8'd76;
       data[4] = 8'd79;
       data[5] = 8'd13;
       data[6] = 8'd10;
     end
     if(wait_for_transmission) begin
       wait_for_transmission = !is_transmitting;
     end else begin
       if(!countdown) begin
         idx = (idx == 6) ? 0 : idx+1;
         countdown = DELAY;
         transmit = 1;
         wait_for_transmission = 1;
       end else begin
         countdown = countdown-1;
         transmit = 0;
       end
     end
     if(received)
       led = rx_byte;
   end

/*
   always @(char) begin
     //$display("char = %d\n", char);
   end
*/
endmodule
