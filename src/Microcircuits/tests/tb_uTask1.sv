module tb_uTask1;


  logic q_last, count_last, overflow;


  uTask1 DUT (
      .q_last(q_last),
      .count_last(count_last),
      .overflow(overflow)
  );


  initial begin
    for (int i = 0; i < 4; i++) begin
      {q_last, count_last} = i;
      #5;
    end
    $finish;
  end


endmodule
