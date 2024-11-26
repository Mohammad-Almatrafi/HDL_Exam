module tb_uTask2;

  logic [7:0] registerOutput;
  logic odd;

  uTask2 #(
      .n(8)
  ) DUT (
      .registerOutput(registerOutput),
      .odd(odd)
  );

  initial begin
    for (int i = 0; i < 2 ** 8; i++) begin
      registerOutput = i;
      #10;
    end
    $finish;
  end

endmodule
