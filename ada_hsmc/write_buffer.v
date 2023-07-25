/*

*/

module WRITE_BUFFER #(
	parameter MAX_SAMPLES = 16, 						// tamanho máximo do buffer
	parameter ADDR_BITS = $clog2(MAX_SAMPLES), 	// número de bits necessário para endereçar todo o buffer
	parameter DWIDTH = 14	 							// Largura de bits de dados de entrada
)(
  CLOCK,         		// clock
  RESET,         		// reset
  DATA_IN,  			// dados de entrada
  ENABLE,      		// habilita a leitura/escrita do buffer
  DATA_OUT,				// dados de saída
  BUFFER					// buffer
);

input	CLOCK;      
input RESET;         
input [DWIDTH-1:0]	DATA_IN;  
input	ENABLE;     
output	[DWIDTH-1:0]	DATA_OUT; 

reg [ADDR_BITS-1:0] wr_addr = 0;  											// ponteiro de escrita
reg [ADDR_BITS-1:0] rd_addr = 0;  											// ponteiro de leitura
inout [MAX_SAMPLES-1:0] BUFFER [DWIDTH-1:0] = '{default:'h0}; 		// buffer circular
  
always @(posedge CLOCK) 
begin
	if (RESET) 
	begin
		wr_addr <= 0;
		rd_addr <= 0;
		BUFFER <= '{default:'h0};
	end 
	
	else if (ENABLE) 
	begin
		BUFFER[wr_addr] <= DATA_IN;
		wr_addr <= (wr_addr + 1) % MAX_SAMPLES;
	end
end

always @(posedge CLOCK) 
begin
	if (RESET) 
	begin
		rd_addr <= 0;
	end 
	
	else if (ENABLE) 
	begin
		rd_addr <= (rd_addr + 1) % MAX_SAMPLES;
	end
end

assign DATA_OUT = BUFFER[rd_addr];
  
endmodule