module mTask1 (
    input clk,
    input rst_n,
    input clkOut
);

  logic [13:0] counterOut;
  logic equality499, equality9999, dEn, counter_rst, nclkOut;
  assign nclkOut = ~clkOut;
  D_Register #(
      .n(1)
  ) slowedclock (
      .clk(clk),
      .rst_n(rst_n),
      .en(dEn),
      .d(nclkOut),
      .q(clkOut)
  );


  Counter_nBit #(
      .bits(14)
  ) counter (
      .clk(clk),
      .rst_n(counter_rst),
      .en(1'b1),
      .load(1'b0),
      .d('b0),
      .q(counterOut)
  );


  assign equality499 = counterOut == 14'd499;
  assign equality9999 = counterOut == 14'd9999;
  assign dEn = equality499 | equality9999;
  assign counter_rst = ~equality9999 & rst_n;

endmodule
