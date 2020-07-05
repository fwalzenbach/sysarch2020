	/*----------------------------------------------------------------------------------*/
	/*						            Instructions			                        */
	/*__________________________________________________________________________________*/
	/*	Uncomment only one of the statements 					                        */
	/*	below, then execute:									                        */
	/*	1) iverilog -o DivisionTestbench .\DivisionsSchaltwerk.v .\DivisionTestbench.v	*/
	/*	2) vvp .\DivisionTestbench 							                            */
	/*----------------------------------------------------------------------------------*/

    /*-----------------------*/
	/*	   Results (1.0.0)   */
	/*_______________________*/
	/* 7  / 3 			-> 1 */
    /* 48 / 7 			-> 1 */
    /* 63 / 17			-> 1 */
    /* 12 / 12			-> 1 */
    /* 27 / 11			-> 1 */
    /* 19 / 5 			-> 1 */
    /* sanitizer        -> 1 */
	/*-----------------------*/


module DivisionTestbench_multi();

	// Generiere Eingabe Stimuli
	reg clk, s;
	wire [31:0] qres;
	wire [31:0] rres;

	initial
	begin
		s <= 1'b0; #1; s <= 1'b1; #4; s <= 1'b0; #160; $finish;
	end

	always
	begin
		clk <= 1'b1; #2; clk <= 1'b0; #2;
	end

	// 7 / 3 = 2 R 1
	    Division divider(
	    	.clock(clk),
	    	.start(s),
	    	.a(32'd7), 
	    	.b(32'd3),
	    	.q(qres),
	    	.r(rres)
	    );

	    initial begin
	    	#133;
	    	if (qres == 32'd2 && rres == 32'd1)
	    		$display("Simulation succeeded");
	    	else
	    		$display("Simulation failed");
	    end

    // 48 / 7 = 6 R 0
        /* Division divider(
	    	.clock(clk),
	    	.start(s),
	    	.a(32'd48), 
	    	.b(32'd7),
	    	.q(qres),
	    	.r(rres)
	    );

	    initial begin
	    	#133;
	    	if (qres == 32'd6 && rres == 32'd0)
	    		$display("Simulation succeeded");
	    	else
	    		$display("Simulation failed");
	    end */

    // 63 / 17 = 3 R 12
       /*  Division divider(
	    	.clock(clk),
	    	.start(s),
	    	.a(32'd63), 
	    	.b(32'd17),
	    	.q(qres),
	    	.r(rres)
	    );

	    initial begin
	    	#133;
	    	if (qres == 32'd3 && rres == 32'd12)
	    		$display("Simulation succeeded");
	    	else
	    		$display("Simulation failed");
	    end  */

    // 12 / 12 = 1 R 0
    /*     Division divider(
	    	.clock(clk),
	    	.start(s),
	    	.a(32'd12), 
	    	.b(32'd12),
	    	.q(qres),
	    	.r(rres)
	    );

	    initial begin
	    	#133;
	    	if (qres == 32'd1 && rres == 32'd0)
	    		$display("Simulation succeeded");
	    	else
	    		$display("Simulation failed");
	    end */  

    // 27 / 11 = 2 R 6
      /*   Division divider(
	    	.clock(clk),
	    	.start(s),
	    	.a(32'd27), 
	    	.b(32'd11),
	    	.q(qres),
	    	.r(rres)
	    );

	    initial begin
	    	#133;
	    	if (qres == 32'd2 && rres == 32'd6)
	    		$display("Simulation succeeded");
	    	else
	    		$display("Simulation failed");
	    end */

    // 19 / 5 = 3 R 4
       /*  Division divider(
	    	.clock(clk),
	    	.start(s),
	    	.a(32'd19), 
	    	.b(32'd5),
	    	.q(qres),
	    	.r(rres)
	    );

	    initial begin
	    	#133;
	    	if (qres == 32'd3 && rres == 32'd4)
	    		$display("Simulation succeeded");
	    	else
	    		$display("Simulation failed");
	    end */

endmodule

