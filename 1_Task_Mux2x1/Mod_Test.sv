`include "mux2x1.sv"

module Mod_Test(
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

  assign LEDG[0] = KEY[1];
  
  mux2x1 U0(
    .i0(SW[7:0]),
    .i1(SW[15:8]),
    .sel(SW[17]),
    .out(LEDR[7:0])
  );

endmodule