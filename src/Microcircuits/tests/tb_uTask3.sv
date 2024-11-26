module tb_uTask3;


  logic [7:0] a, b, sum;
  logic cin, cout;

  uTask3 DUT (
      .a(a),
      .b(b),
      .cin(cin),
      .sum(sum),
      .cout(cout)
  );


  initial begin
    cin = 0;
    for (int i = 0; i < 2 ** 7; i++) begin
      {b[7:3], a[7:3], a[2], b[2], a[1], b[1], a[0], b[0]} = i;
      #10;
    end

    $finish;

  end

endmodule
