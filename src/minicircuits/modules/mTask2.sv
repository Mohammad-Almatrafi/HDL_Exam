module mTask2 (
    input clk,
    input rst_n,
    input load,
    input [5:0] pattern,
    input Serial_in,
    output pattern_match
);

  shiftReg #(
      .n(5)
  ) sh (
      .clk(clk),
      .rst_n(rst_n),
      .Control_bit(1'b1),
      .Serial_in(Serial_in),
      .q(compareShift)
  );


  D_Register #(
      .n(5)
  ) slowedclock (
      .clk(clk),
      .rst_n(rst_n),
      .en(load),
      .d(pattern),
      .q(compareit)
  );

  assign pattern_match = compareit == compareShift;


endmodule
