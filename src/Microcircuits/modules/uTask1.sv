module uTask1 (
    input  q_last,
    input  count_last,
    output overflow
);

  assign overflow = q_last & ~count_last;



endmodule
