module MealyPattern(
	input clock,
	input i,
	output [1:0] o
);

reg state;
reg [1:0] q = 2'b0;

localparam
	state_0  = 1'b0 ,
	state_1  = 1'b1 ,
	state_00 = 2'b00,
	state_01 = 2'b01,
	state_10 = 2'b10,
	state_11 = 2'b11;

always @(posedge clock)
begin
	case (state)
		state_0	: begin 
			if (i == 1'b0) begin
				q[0] <= 1'b0;
				q[1] <= 1'b0;
		   		state <= state_00;
			end
			
			if (i == 1'b1) begin
				q[0] <= 1'b0;
				q[1] <= 1'b0;
				state <= state_01;
			end
		end

		state_1	: begin
			if (i == 1'b0) begin
				state <= state_10;
				q[0] <= 1'b0;
				q[1] <= 1'b0;
			end
			
			if (i == 1'b1) begin
			   	state <= state_11;
				q[0] <= 1'b0;
				q[1] <= 1'b0;
			end
		end

		state_00: begin 
			if (i == 1'b0) begin
				state <= state_00;
				q[0] <= 1'b0;
				q[1] <= 1'b0;
			end
			
			if (i == 1'b1) begin
				state <= state_01;
				q[0] <= 1'b0;
				q[1] <= 1'b1;
			end
		end

		state_01: begin 
			if (i == 1'b0) begin
				state <= state_10;
				q[0] <= 1'b0;
				q[1] <= 1'b0;
			end
			
			if (i == 1'b1) begin
				state <= state_11;
				q[0] <= 1'b0;
				q[1] <= 1'b0;
			end
		end
	
		state_10: begin 
			if (i == 1'b0) begin
				state <= state_00;
				q[0] <= 1'b0;
				q[1] <= 1'b0;
			end
			
			if (i == 1'b1) begin
				state <= state_01;
				q[0] <= 1'b0;
				q[1] <= 1'b0;
			end
		end
		
		state_11: begin 
			if (i == 1'b0) begin
				state <= state_10;
				q[0] <= 1'b0;
				q[1] <= 1'b0;
			end
			
			if (i == 1'b1) begin
				state <= state_10;
				q[0] <= 1'b1;
				q[1] <= 1'b0;
			end
		end

		default	: begin
			if (i == 1'b0) begin
				state <= state_0;
				q[0] <= 1'b0;
				q[1] <= 1'b0;
			end
			
			if (i == 1'b1) begin
				state <= state_1;
				q[0] <= 1'b0;
				q[1] <= 1'b0;
			end
		end

	endcase
end
		
assign o = q;

endmodule

module MealyPatternTestbench();

	reg clock; 
	reg i;
	wire[1:0] out ;

	MealyPattern UUT(.clock(clock), .i(i), .o(out));

	initial
		begin
			$dumpfile("simres.vcd");
			$dumpvars;

			i <= 1'b1;
			#4;

			i <= 1'b1;
			#4;
			
			i <= 1'b1;
			#4;
			
			i <= 1'b0;
			#4;
			
			i <= 1'b0;
			#4;
			
			i <= 1'b1;
			#4;
			
			i <= 1'b1;
			#4;
			
			i <= 1'b0;
			#4;
			
			i <= 1'b0;
			#4;
			
			i <= 1'b1;
			#4;

			$finish;
		end

	always
	  	begin
			clock <= 1'b0; #2; clock <= 1'b1; #2;
	  	end


	// TODO Überprüfe Ausgaben

endmodule

