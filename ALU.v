module alu(DATA1,DATA2,out,Select);

input [7:0]DATA1,DATA2;
input [2:0] Select;
output [7:0]out;
reg out;

always @(DATA1,DATA2,Select)

begin

case(Select)
	3'd0:
		out = DATA1;
	3'd1:
		out = DATA1 + DATA2;
	3'd2:
		out = DATA1 & DATA2;
	3'd3:
		out = DATA1 | DATA2;

endcase
end

endmodule

/*
module test;
	reg [7:0] d1, d2;
	reg [2:0] op;
	wire [7:0] out;
	alu myALU(d1,d2,out,op);

	initial
	begin
		d1 = 8'd5; 
		d2 = 8'd2;
		#5 op = 3'd3;
		#5 $display("%d %d %d", d1, d2, out);
		
		$finish;
	end
endmodule
*/