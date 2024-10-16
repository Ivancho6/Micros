module MIPSALU (ALUctl, A, B, ALUut, Zero);
	input [3:0] ALUctl;
	input [31:0] A,B;
	output reg [31:0] ALUOut;
	Output Zero;
	assign Zero = (ALUOut==0);  	//Zero is true if ALUOut is 0
	always @(ALUctl, A, B) begin	//Reevaluate if these change
		case (ALUctl)
			0: ALUOut <= A & B;
			1: ALUOut <= A | B;
			2: ALUOut <= A + B;
			6: ALUOut <= A - B;
			7: ALUOut <= A < B ? 1 : 0;
			12: ALUOut <= ~(A | B); //result is nor
			default: ALUOut <= 0;
		endcase
	end
endmodule
