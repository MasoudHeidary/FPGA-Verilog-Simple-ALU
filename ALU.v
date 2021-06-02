`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MasoudHeidaryDeveloper@gmail.com
// License: MIT
// 
// Create Date:    14:39:40 05/30/2021 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

// (x,y)(control) -> (z)
module ALU(
	input [7:0]x,	
	input [7:0]y,
	input [3:0]control,
	output reg [8:0]z,
	input clk
    );

// parameters
	parameter c_sum 	= 	4'b0000;	// +
	parameter c_min		= 	4'b0001;	// -
	parameter c_tim		= 	4'b0010;	// *
	parameter c_div 	= 	4'b0011;	// /
	parameter c_shL		=   4'b0100;	// shift left(x)
	parameter c_shR		=   4'b0101;	// shift right(x)
	parameter c_roL		=   4'b0110;	// shift right(x)
	parameter c_roR		=   4'b0111;	// shift right(x)
	parameter c_and		=   4'b1000;	// and
	parameter c__or		=   4'b1001;	// or
	parameter c_xor		=   4'b1010;	// xor
	parameter c_nor		=   4'b1011;	// nor
	parameter c_nan		=   4'b1100;	// nand
	parameter c_xnr		=   4'b1101;	// xnor
	parameter c_equ		=   4'b1110;	// equal
	parameter c_hig		=   4'b1111;	// x > y
// end parameters 

reg [15:0]temp;

always @(posedge clk) begin
	case (control)
	//math
		c_sum: z <= x + y;
		c_min: z <= x - y;
		c_tim:
			begin
				temp = x * y;
				z[7:0] = temp[7:0];
				z[8] = |(temp[15:8]);
			end
		c_div: z <= x / y;

	// shift and rotate
		c_shL: z[8:1] <= x[7:1];
		c_shR: z[6:0] <= x[7:1];
		c_roL: z <= {x[6:0], x[7]};
		c_roR: z <= {x[0], x[7:1]};
	
	// logic
		c_and: z <= {x & y};
		c__or: z <= {x | y};
		c_xor: z <= {x ^ y};
		c_nor: z <= {~(x | y)};
		c_nan: z <= {~(x & y)};
		c_xnr: z <= {~(x ^ y)};
		c_equ: z <= x==y ? 1 : 0;
		c_hig: z <= x>y ? 1 : 0;

	endcase
end
endmodule