`include "Reg.v"
`include "ALU.v"
`include "CU.v"
`include "CMP.v"
`include "IR.v"
`include "PC.v"
`include "MUX.v"

module test;
	reg clk;
	reg reset;
	wire [31:0] readaddr;

	initial begin
		clk = 1;
		reset = 1;
		#1 clk = 0;
		#5 reset=0;
		#1$display("RESET################################################################");
		#1clk =1;

		#100 clk = !clk;
		#100 clk = !clk;

		#100 clk = !clk;
		#100 clk = !clk;

		#100 clk = !clk;
		#100 clk = !clk;

		#100 clk = !clk;
		#100 clk = !clk;

		#100 clk = !clk;
		#100 clk = !clk;

		#100 clk = !clk;
		#100 clk = !clk;

		#100 clk = !clk;
		#100 clk = !clk;
		#100 clk = !clk;
	end

	PC myPC(clk, reset, readaddr);
	
	wire [31:0] instruction;

	Instruction_reg myIR(clk, readaddr, instruction);

	wire [2:0] out1addr, out2addr, inaddr;
	
	CU myCU(instruction, out1addr, out2addr, inaddr);

	wire [7:0] toWrite;
	wire [7:0] out1, out2;
	
	regfile8x8a myRF(clk, inaddr, toWrite, out1addr, out1, out2addr, out2);

	wire [2:0] select=instruction[26:24];
	wire selectImm=instruction[29];
	wire selectComp=instruction[30];
	wire [7:0] out2_comp;
	wire [7:0] data1;
	wire [7:0] data2;
	wire [7:0] in=instruction[7:0];

	mux8x2 selectdata1MUX(selectImm,in,out1,data1);

	twoscompl myComp(out2,out2_comp);

	mux8x2 selectdata2MUX(selectComp,out2_comp,out2,data2);
	alu myALU(data1, data2, toWrite, select);

endmodule