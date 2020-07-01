module MealyPattern(
	input        clock,
	input        i,
	output [1:0] o,
    output [1:0] pp,
    output [1:0] c
);

    reg r1, r2;
    reg [1:0] p;

    initial
        begin
            r1 = 0;
            r2 = 0;
            p[0] = 0;
            p[1] = 0;
        end

    always @(posedge clock ) begin
        r2 <= r1;
        r1 <= i;

        // 111 
        p[0] =  (i & r1 & r2) | p[0];
        
        // 001
        p[1] = (!r2 & !r1 & i) | p[1];
    end
    
    assign o = p;

endmodule

module MealyPatternTestbench();
	reg clock = 0;
	reg i = 0;
	wire [1:0] o;

    MealyPattern machine(.clock(clock), .i(i), .o(o));

	always 
        #1
		clock = !clock;

	initial
		begin
            #2
			i = 0;
			#2
            i = 0;
            #2
            i = 1;
            #2
            i = 1;
            #2
			i = 1;
			#2
            i = 1;
            #2
            i = 1;
            #2
            i = 0;

            #1
            $display("input: 00111110 -> <0: %b, 1: %b>" , o[0], o[1]);



            $finish;
        end
endmodule

