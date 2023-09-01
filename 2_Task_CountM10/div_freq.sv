module div_freq(
	input logic CLK50M, rst,
	output logic CLK1
);

  logic [24:0] count;

  always_ff @(posedge CLK50M) begin
    count = count + 1'b1;

    if(count == 25) begin // fpga_test would be 25_000_000
	    CLK1 = ~CLK1;
	    count = '0;
    end
    
    if (!rst) begin
      CLK1 = '0;
      count = '0;
    end
  end

endmodule