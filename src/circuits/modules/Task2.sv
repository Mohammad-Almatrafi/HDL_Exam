module task2 (
    input clk,
    input rst_n,
    input load,
    input [3:0] A,
    input [3:0] B,
    input start,
    output [3:0] sum,
    output done
);

  logic [3:0] A_r, B_r;
  logic [1:0] muxOut;
  logic [1:0] count;
  logic y;
  logic cin;
  logic cout;

  // logic [3:0];


  Counter_nBit #(
      .bits(2)
  ) counter (
      .clk(clk),
      .rst_n((~start) & rst_n),
      .en(equality),
      .load('b0),
      .d('b0),
      .q(count)
  );
  assign equality = ~(count == 2'b11);
  assign done = ~equality;
  D_Register #(
      .bits(4)
  ) register_a (
      .clk(clk),
      .rst_n(rst_n),
      .en(load),
      .d(A),
      .q(A_r)
  );

  D_Register #(
      .bits(4)
  ) register_b (
      .clk(clk),
      .rst_n(rst_n),
      .en(load),
      .d(B),
      .q(B_r)
  );

  assign muxOut = {A_r[count], B_r[count]};
  assign {cout, y} = muxOut[0] + muxOut[1] + cin;

  D_Register #(
      .bits(1)
  ) register_c (
      .clk(clk),
      .rst_n((~start) & rst_n),
      .en(1'b1),
      .d(cout),
      .q(cin)
  );

  logic shien;
  D_Register #(
      .bits(1)
  ) register_e (
      .clk(clk),
      .rst_n(rst_n),
      .en(1'b1),
      .d(equality),
      .q(shien)
  );

  shiftCon #(
      .n(4)
  ) rrrreg (
      .clk(clk),
      .rst_n(rst_n),
      .Control_bit(shien),
      .Serial_in(y),
      .q(sum)
  );




endmodule
