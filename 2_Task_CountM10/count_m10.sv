module count_m10(
  input logic clk, rst,
  output logic [3:0] count
);

  always_ff @(posedge clk, negedge rst) begin
    count = count + 1'b1;
    
    if((count == 4'd10) || (!rst)) count = '0;
  end

endmodule
