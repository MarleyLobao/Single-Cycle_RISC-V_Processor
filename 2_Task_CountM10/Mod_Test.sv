`include "div_freq.sv"
`include "hex7seg.sv"
`include "count_m10.sv"

module Mod_Test (
  //Clocks
  input CLOCK_27, CLOCK_50,
  //Keys and Buttons
  input [3:0] KEY,
  input [17:0] SW,
  //7-segment displays and LEDs
  output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
  output [8:0] LEDG,
  output [17:0] LEDR,
  //Serial
  output UART_TXD,
  input UART_RXD,
  //Outputs that would be for the LCD
  output [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,
  output [7:0] w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5,
  //GPIO
  inout [35:0] GPIO_0, GPIO_1
);

  assign GPIO_1 = 36'hzzzzzzzzz;
  assign GPIO_0 = 36'hzzzzzzzzz;

  logic clk1hz;
  logic [3:0] counter;

  div_freq U0(
    .CLK50M(CLOCK_50),
    .rst(KEY[1]),
    .CLK1(clk1hz)
  );

  count_m10 U1(
    .clk(clk1hz),
    .rst(KEY[1]),
    .count(counter)
  );
  
  hex7seg U2(
    .in(counter),
    .out(HEX4[0:6])
  );

  assign LEDG[0] = clk1hz;
  
endmodule
