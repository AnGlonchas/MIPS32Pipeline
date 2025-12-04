`timescale 1ns/1ns

module instructionMemory(
    	input [31:0]address,      //viene de pc
    	output [31:0] instruction //va hacia unidad de control y registros
    );
    
	
	wire[31:0] realAddress;
    reg[31:0] memory[0:255];


    initial begin
        $readmemb("a.vbin", memory); //Falta el archivo
    end

    assign realAddress = address >> 2;
    assign instruction = memory[realAddress];

endmodule