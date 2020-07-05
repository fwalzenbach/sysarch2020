module MealyPattern(
	input        clock,
	input        i,
	output [1:0] o
);
/*	Version: 1.0.0	*/

    reg r1, r2;
	reg [1:0] p;

    initial
        begin
            r1 = 0;
            r2 = 0;
        end

    always @(posedge clock ) begin
        r2 <= r1;
        r1 <= i;

		// 111 
        p[0] =  (i & r1 & r2) ;
        
        // 001
        p[1] = (!r2 & !r1 & i);
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
		
	/*----------------------------------------------------------*/
	/*						Instructions						*/
	/*__________________________________________________________*/
	/*	Uncomment only one of the statements 					*/
	/*	below, then execute:									*/
	/*	1) iverilog -o MealyPatternTestbench .\MealyMaschine.v	*/
	/*	2) vvp .\MealyPatternTestbench 							*/
	/*----------------------------------------------------------*/


	/*-----------------------*/
	/*	   Results (1.0.0)   */
	/*_______________________*/
	/* 001 				-> 1 */
	/* 111 				-> 1 */
	/* 01111 			-> 1 */
	/* 0001 			-> 1 */
	/* 011011 			-> 1 */
	/* 0111 			-> 1 */
	/* 0010 			-> 1 */
	/* 0011 			-> 1 */
	/* 1110 			-> 1 */
	/* 1101 			-> 1 */
	/* 001111 			-> 1 */
	/* 11100110010 		-> 1 */
	/* 110001100111 	-> 1 */
	/* 1110011001 		-> 1 */
	/* sanitizer		-> 1 */
	/*-----------------------*/


			// DEBUGGER
			/* 
			begin
				// input template
				// #2 
				// i = x;

			 	#2
				$display("start");
				#2 
				i = 0;
				#2 
				i = 0;
				#2 
				i = 1;

				#2
				// change input
				$display("DEBUGER: input: <%b> = [%b, %b]", 3'b110, o[0], o[1]);
				$finish; 
			end */

			// 001 		-> [0,1]
			/* 
			begin
				#2
				i = 0;
				#2
				i = 0;
				#2
				i =	1;

				#2
				if(o[0] == 0 & o[1] == 1) begin
					$display("001 -> success [%b, %b]", o[0], o[1]);
				end	else begin
					$display("001 -> failure [%b, %b]", o[0], o[1]);
				end

				$finish;
			end */
			
			// 111 		-> [1,0]
			/* 	
			begin
				#2
				i = 1;
				#2
				i = 1;
				#2
				i = 1;

				#2
				if(o[0] == 1 & o[1] == 0) begin
					$display("111 -> success [%b, %b]", o[0], o[1]);
				end	else begin
					$display("111 -> failure [%b, %b]", o[0], o[1]);
				end

				$finish;
			end */
			
			// 01111	-> [1,0]
			/* 	
			begin
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
				if(o[0] == 1 & o[1] == 0) begin
					$display("01111 -> success [%b, %b]", o[0], o[1]);
				end	else begin
					$display("01111 -> failure [%b, %b]", o[0], o[1]);
				end

				$finish;
			end */

			// 0001		-> [0,1]
			/* 	
			begin
				#2
				i = 0;
				#2
				i = 0;
				#2
				i = 0;
				#2
				i = 0;
				#2
				i = 1;

				#2
				if(o[0] == 0 & o[1] == 1) begin
					$display("0001 -> success [%b, %b]", o[0], o[1]);
				end	else begin
					$display("0001 -> failure [%b, %b]", o[0], o[1]);
				end

				$finish;
			end */

			// 011011	-> [0,0]
				/* 
			begin
				#2
				i = 0;
				#2
				i = 1;
				#2
				i = 1;
				#2
				i = 0;
				#2
				i = 1;
				#2
				i = 1;

				#2
				if(o[0] == 0 & o[1] == 0) begin
					$display("011011 -> success [%b, %b]", o[0], o[1]);
				end	else begin
					$display("011011 -> failure [%b, %b]", o[0], o[1]);
				end
			
				$finish;
			end */

			// 0111		-> [0,1]
				/* 
			begin
				#2
				i = 0;
				#2
				i = 1;
				#2
				i = 1;
				#2
				i = 1;

				#2
				if(o[0] == 1 & o[1] == 0) begin
					$display("0111 -> success [%b, %b]", o[0], o[1]);
				end	else begin
					$display("0111 -> failure [%b, %b]", o[0], o[1]);
				end

				$finish;
			end */

			// 0010		-> [0,0]				
			/* 
			begin
				#2
				i = 0;
				#2
				i = 0;
				#2
				i = 1;
				#2
				i = 0;

				#2
				if(o[0] == 0 & o[1] == 0) begin
					$display("0010 -> success [%b, %b]", o[0], o[1]);
				end	else begin
					$display("0010 -> failure [%b, %b]", o[0], o[1]);
				end

				$finish;
			end */

			// 0011		-> [0,0]
				/* 
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
				if(o[0] == 0 & o[1] == 0) begin
					$display("0011 -> success [%b, %b]", o[0], o[1]);
				end	else begin
					$display("0011 -> failure [%b, %b]", o[0], o[1]);
				end
				
				$finish;
			end */

			// 1110		-> [0,0]
				/* 
			begin
				#2
				i = 1;
				#2
				i = 1;
				#2
				i = 1;
				#2
				i = 0;
	
				#2
				if(o[0] == 0 & o[1] == 0) begin
					$display("1110 -> success [%b, %b]", o[0], o[1]);
				end	else begin
					$display("1110 -> failure [%b, %b]", o[0], o[1]);
				end
				
				$finish;
			end */

			// 1101		-> [0,0]
				/* 
			begin
				#2
				i = 1;
				#2
				i = 1;
				#2
				i = 0;
				#2
				i = 1;
	
				#2
				if(o[0] == 0 & o[1] == 0) begin
					$display("1101 -> success [%b, %b]", o[0], o[1]);
				end	else begin
					$display("1101 -> failure [%b, %b]", o[0], o[1]);
				end
				
				$finish;
			end */

			// 001111	-> [0,0]
			/* 	
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
				if(o[0] == 1 & o[1] == 0) begin
					$display("001111 -> success [%b, %b]", o[0], o[1]);
				end	else begin
					$display("001111 -> failure [%b, %b]", o[0], o[1]);
				end
				
				$finish;
			end */
			// 11100110010	-> [0,0]
			/* begin
				#2
				i = 1;
				#2
				i = 1;
				#2
				i = 1;
				#2
				i = 0;
				#2
				i = 0;
				#2
				i = 1;
				#2
				i = 1;
				#2
				i = 0;
				#2
				i = 0;
				#2
				i = 1;
				#2 
				i = 0;

				#2
				if(o[0] == 0 & o[1] == 0) begin
					$display("1110011001 -> success [%b, %b]", o[0], o[1]);
				end	else begin
					$display("1110011001 -> failure [%b, %b]", o[0], o[1]);
				end

				$finish;
			end	 */

			// 110001100111	-> [1,0]
			/* begin
				#2
				i = 1;
				#2
				i = 1;
				#2
				i = 0;
				#2
				i = 0;
				#2
				i = 0;
				#2
				i = 1;
				#2
				i = 1;
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
				if(o[0] == 1 & o[1] == 0) begin
					$display("1110011001 -> success [%b, %b]", o[0], o[1]);
				end	else begin
					$display("1110011001 -> failure [%b, %b]", o[0], o[1]);
				end

				$finish;
			end	 */
			
	// given Benchmark 1110011001
		begin
			#2
			i = 1;
			#2
			i = 1;
			#2
			i = 1;
			#2
			i = 0;
			#2
			i = 0;
			#2
			i = 1;
			#2
			i = 1;
			#2
			i = 0;
			#2
			i = 0;
			#2
			i = 1;
			
			#2
			if(o[0] == 0 & o[1] == 1) begin
				$display("1110011001 -> success [%b, %b]", o[0], o[1]);
			end	else begin
				$display("1110011001 -> failure [%b, %b]", o[0], o[1]);
			end
			
			$finish;
		end

            
        


endmodule