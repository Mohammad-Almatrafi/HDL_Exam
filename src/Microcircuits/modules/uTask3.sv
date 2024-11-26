module uTask3 (
    a,
    b,
    cin,
    sum,
    cout
);
  input logic [7:0] a, b;
  output logic [7:0] sum;
  input logic cin;
  output logic cout;
  logic internalWire;

  nbitAdder #(
      .bits(4)
  ) adder1 (
      .a(a[3:0]),
      .b(b[3:0]),
      .cin(cin),
      .y(sum[3:0]),
      .cOut(internalWire)
  );
  nbitAdder #(
      .bits(4)
  ) adder2 (
      .a(a[7:4]),
      .b(b[7:4]),
      .cin(internalWire),
      .y(sum[7:4]),
      .cOut(cout)
  );


endmodule
