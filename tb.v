`timescale 1ns/1ns

module tb();

    reg clk;

    wire[31:0] pcOut_addOp1;
    wire[31:0] pcIn_addRes;

    initial begin
        clk <= 1'b0;
    end

    always #50 clk = ~clk;


    programCounter pc(
        .clk(clk),
        .pcIn(pcIn_addRes),
        .pcOut(pcOut_addOp1)
    );

    adder add(
        .op1(32'd4),
        .op2(pcOut_addOp1),
        .result(pcIn_addRes)
    );

endmodule