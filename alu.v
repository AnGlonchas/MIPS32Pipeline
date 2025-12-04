`timescale 1ns/1ns

module ALUZeroFlag(
    input [31:0] a, b,
    input [2:0] sel,
    output reg [31:0] out,
    output reg zeroFlag
);

always @* begin
    case(sel)
        3'b0000: out = a + b;
        3'b0001: out = a - b;
        3'b0010: out = a & b;
        3'b0011: out = a | b;
        3'b0100: out = (a < b) ? 32'd1 : 32'd0; // SLT
        3'b0101: out = a ^ b;        // XOR (NUEVO para XORI)
        
        default: out = 32'b0;
    endcase
    
    zeroFlag = (out == 32'b0) ? 1'b1 : 1'b0;

    end
endmodule