module test;
  reg         reset = 0;
  reg         clk = 0;
  wire        tx;
  wire [7:0] debug_data;
  
  always
    #1 clk = !clk;

  initial begin
    #1 reset = 1;
    #10;
    #1 reset = 0;
    tx_byte = 8'd72;
    transmit = 1;
    #5;
    transmit = 0;
    #100;
    tx_byte = 8'd72;
    transmit = 1;
    #5;
    transmit = 0;
    #100;
    tx_byte = 8'd10;
    transmit = 1;
    #5;
    transmit = 0;
    #100;
    #50000;
    $finish;
  end

  cpu cpu0(
    .clk(clk),
    .reset_button(!reset),
    .debug_data(debug_data),
    .tx(tx),
    .rx(rx)
  );

  reg transmit;
  reg [7:0] tx_byte;
  uart #(.CLOCK_DIVIDE( 1 )) uart0(
    .clk(clk),
    .rst(reset),
    .tx(rx),
    .transmit(transmit),
    .tx_byte(tx_byte),
    .rx(1'bz)
  );

  initial begin
    $dumpfile("out.vcd");
    $dumpvars(0, test);
    $monitor("At time %t, out = %b (%0d)", $time, debug_data, debug_data);
  end
endmodule
