module shiftReg #(
    parameter n = 5
) (
    input logic clk,
    input logic rst_n,
    input logic Control_bit,
    input logic Serial_in,
    output logic [n-1:0] q
);

  always @(posedge clk, negedge rst_n) begin
    if (~rst_n) q <= 0;
    else begin
      if (Control_bit) q <= q >> 1 | Serial_in;
      else q <= q;
    end
  end
endmodule
