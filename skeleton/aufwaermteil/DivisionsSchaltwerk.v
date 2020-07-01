module Division(
	input         clock,
	input         start,
	input  [31:0] a,
	input  [31:0] b,
	output [31:0] q,
	output [31:0] r
);

reg [31:0] current_r   = 32'd0;
reg [31:0] current_b   = 32'd0;
reg [31:0] current_a_q = 32'd0;

integer i;

always @(posedge clock) 
  begin
	// reset
	if (start) 
	  begin
		current_r 	<= 32'd0;
		current_b  	<= b;
		current_a_q <= a;
		
		i = 31;
	  end
	
	// algorithm
	if (i >= 0) 
	  begin
		// R' = 2 * R + A[i]
		current_r <= current_r << 1;
		current_r <= current_r + current_a_q[i];
	
		// if (R' < B)
		if (current_r < current_b)
	  	  	// Q[i] = 0
			current_a_q[i] = 1'b0;
   	 	else
	 	  begin
			// Q[i] = 1
			current_a_q[i] = 1'b1;
			// R = R' - B
			current_r <= current_r - current_b;
	  	  end
	  	i = i - 1;
	end
  end

assign q = current_a_q;
assign r = current_r;

endmodule

