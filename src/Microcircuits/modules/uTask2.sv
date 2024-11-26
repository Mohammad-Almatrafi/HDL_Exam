module uTask2 #(
    parameter n = 8
) (
    input [n-1:0] registerOutput,
    output odd
);


  assign odd = ^registerOutput;



endmodule
