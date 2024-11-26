`timescale 1ns / 1ps

module nbitAdder #(
    parameter bits = 8
) (
    input logic [bits-1:0] a,
    input logic [bits-1:0] b,
    input logic cin,
    output logic [bits-1:0] y,
    output logic cOut
);


  assign {cOut, y} = a + b + cin ;



endmodule
