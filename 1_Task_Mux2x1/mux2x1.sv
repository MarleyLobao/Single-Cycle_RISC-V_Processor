module mux2x1(
  input logic [7:0] i0, i1,
  input logic sel,
  output logic [7:0] out
);

  always_comb begin
    out = (sel) ? (i1) : (i0);
  end

endmodule