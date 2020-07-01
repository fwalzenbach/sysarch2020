 module Division(
	input         clock,
	input         start,
	input  [31:0] a, // Zahl A
	input  [31:0] b, // Zahl B (divisor)
	output [31:0] q, // Quotient 
	output [31:0] r  // Rest
);

reg[5:0] pos; // position pointer
reg[31:0] r, q, s; // r = rest, q = quotient, s = R' (formular, current rest)

always @(posedge clock ) begin
    if(start) begin
		// set everything to 0, and pos to N-1, N = 32
        pos <= 6'd31;
        q <= 32'd0;
        r <= 32'd0;
        s <= 32'd0;
    end else if(pos < 32) begin // prevent infinite loops
        s = 2'd2 * r + a[pos];

        if(s < b) begin
            q[pos] = 0;
            r = s;
        end else begin
            q[pos] = 1;
            r = s - b;
        end
        
		// move position pointer to the right
        pos = pos - 1;
    end
end

    
endmodule // Division