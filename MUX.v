module mux8x2(select, in1, in2, out);
	input select;
	input [7:0] in1,in2;
	output [7:0] out;
	reg out;
	always begin
		#5 out = select==1? in1: in2;
	end
endmodule