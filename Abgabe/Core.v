module MIPScore(
	input clk,
	input reset,
	// Kommunikation Instruktionsspeicher
	output [31:0] pc,
	input  [31:0] instr,
	// Kommunikation Datenspeicher
	output        memwrite,
	output [31:0] aluout, writedata,
	input  [31:0] readdata
);
	wire        memtoreg, alusrcbimm, regwrite, dojump, link, jumpreg, dobranch, zero, usevalue;
	wire [4:0]  destreg;
	wire [2:0]  alucontrol;
	wire [31:0] value;

	Decoder decoder(instr, zero, memtoreg, memwrite,
					dobranch, alusrcbimm, destreg,
					regwrite, dojump, link, jumpreg, alucontrol, usevalue, value);

	Datapath dp(clk, reset, memtoreg, dobranch,
				alusrcbimm, destreg, regwrite, dojump, link, jumpreg,
				alucontrol, usevalue, value,
				zero, pc, instr,
				aluout, writedata, readdata);
endmodule
