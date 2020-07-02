module ProcessorTestbench();

	reg clk;
	reg reset;

	integer i;
	reg [31:0] expectedRegContent [1:31];

	// Instanziere das zu testende Verilog-Modul
	Processor proc(clk, reset);

	initial
		begin
			// Generiere eine Waveform-Ausgabe mit allen (nicht-Speicher) Variablen
			$dumpfile("simres.vcd");
			$dumpvars(0, ProcessorTestbench);

			/* initialize actual and expected registers to 0xcafebabe */
			for(i=1; i<32; i=i+1) begin
				proc.mips.dp.gpr.registers[i] = 32'hcafebabe;
				expectedRegContent[i] = 32'hcafebabe;
			end

			// Lese auszuführendes Programm ein
			/*INSTRUCTION CONVERTER: https://www.eg.bucknell.edu/~csci320/mips_web/ */
			
			// $readmemh("TestProgramme/Fibonacci.dat", proc.imem.INSTRROM, 0, 5); //Benötigt: Aufgabe 1.3
			// $readmemh("TestProgramme/Fibonacci.expected", expectedRegContent);
			
			// $readmemh("TestProgramme/Funktionsaufruf.dat", proc.imem.INSTRROM, 0, 4); //Benötigt: Aufgabe 1.7
			// $readmemh("TestProgramme/Funktionsaufruf.expected", expectedRegContent);
			
			// $readmemh("TestProgramme/Konstanten.dat", proc.imem.INSTRROM, 0, 2); //Benötigt: Aufgabe 1.4
			// $readmemh("TestProgramme/Konstanten.expected", expectedRegContent);
			
			// $readmemh("TestProgramme/Multiplikation.dat", proc.imem.INSTRROM, 0, 4); //Benötigt: Aufgabe 1.6
			// $readmemh("TestProgramme/Multiplikation.expected", expectedRegContent);

			// $readmemh("TestProgramme/sltu.dat", proc.imem.INSTRROM, 0, 2);
			// $readmemh("TestProgramme/sltu.expected", expectedRegContent);
			
			// $readmemh("TestProgramme/subu.dat", proc.imem.INSTRROM, 0, 2);
			// $readmemh("TestProgramme/subu.expected", expectedRegContent);

			// $readmemh("TestProgramme/addu.dat", proc.imem.INSTRROM, 0, 2);
			// $readmemh("TestProgramme/addu.expected", expectedRegContent);

			// $readmemh("TestProgramme/or.dat", proc.imem.INSTRROM, 0, 7);
			// $readmemh("TestProgramme/or.expected", expectedRegContent);

			// $readmemh("TestProgramme/and.dat", proc.imem.INSTRROM, 0, 2);
			// $readmemh("TestProgramme/and.expected", expectedRegContent);

			$readmemh("TestProgramme/humor.dat", proc.imem.INSTRROM, 0, 9);
			$readmemh("TestProgramme/humor.expected", expectedRegContent);

			// Generiere reset-Eingabe
			reset <= 1;
			#5; reset <= 0;
			// Anzahl simulierter Zyklen
			// #117; // Fibonacci
			// #20; // Funktionsaufruf
			// #16; // Konstanten
			// #24; // Multiplikation | andere ALU Tests

			#50; // or test

			for(i=1; i<32; i=i+1) begin
				$display("Register %d = %h", i, proc.mips.dp.gpr.registers[i]);
			end
			for(i=1; i<32; i=i+1) begin
				if(^proc.mips.dp.gpr.registers[i] === 1'bx || proc.mips.dp.gpr.registers[i] != expectedRegContent[i]) begin
					$write("FAILED");
					$display(": register %d = %h, expected %h",i, proc.mips.dp.gpr.registers[i], expectedRegContent[i]);
					$finish;
				end
			end
			$display("PASSED");
			$finish;
		end

	// Generiere ein periodisches Clock-Signal
	always
		begin
			clk <= 1; #2; clk <= 0; #2;
		end

endmodule
