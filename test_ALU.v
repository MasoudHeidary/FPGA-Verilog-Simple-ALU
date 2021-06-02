`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MasoudHeidaryDeveloper@gmail.com
// License: MIT
// 
// Create Date:    18:34:39 05/30/2021 
// Design Name: 
// Module Name:    test_ALU 
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
module test_ALU(
    );

	reg [7:0] _x;
	reg [7:0] _y;
	reg [3:0] _control;
	wire [8:0] _z;

	// clock
		reg clk;
		initial begin
			clk <= 0;
		end
		always #5 clk <= !clk;
	// end clock

	// module
	ALU ttt(
		.x(_x),
		.y(_y),
		.control(_control),
		.z(_z),
		.clk(clk)
	);

	//display
	integer i;
	integer j;
	initial begin
		for (i=0; i<16; i=i+1)
		begin
			_control <= i;
			#10;
			$display("control: %b ----------", _control);
			for(j=0; j<2; j=j+1)
			begin
				_x <= $random;
				_y <= $random;
				#10;
				$display("x:   %b %b \ny:   %b %b \nz:%b %b %b \n###", 
				_x[7:4],
				_x[3:0],
				_y[7:4],
				_y[3:0],
				_z[8],
				_z[7:4],
				_z[3:0]
				);
			end
		end
end
endmodule