module tb_Task2;



  logic clk = 0, rst_n, load, done, start;
  logic [3:0] A, B;
  logic [3:0] sum;
  always #5 clk = ~clk;
  task2 DUT (
      .clk(clk),
      .rst_n(rst_n),
      .load(load),
      .A(A),
      .B(B),
      .start(start),
      .sum(sum),
      .done(done)
  );

  initial begin
    rst_n = 1;
    #1;
    rst_n = 0;
    #1;
    rst_n = 1;
    #1;
    load  = 0;
    start = 0;

    @(negedge clk);
    A = 4;
    B = 5;
    load = 1;
    @(negedge clk);
    start = 1;
    @(negedge clk);
    start = 0;
    load = 0;
    repeat (15) @(negedge clk);
    
    @(negedge clk);
    A = 3;
    B = 7;
    load = 1;
    @(negedge clk);
    start = 1;
    @(negedge clk);
    start = 0;
    load = 0;
    repeat (15) @(negedge clk);

    @(negedge clk);
    A = 1;
    B = 3;
    load = 1;
    @(negedge clk);
    start = 1;
    @(negedge clk);
    start = 0;
    load = 0;
    repeat (15) @(negedge clk);
    $finish;


  end


endmodule
