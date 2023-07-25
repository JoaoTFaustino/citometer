/*

O módulo downsampler recebe um sinal de clock, um sinal de reset assíncrono, um sinal de dados de entrada e produz um sinal de dados de saída. 
O fator de downsampling é ajustável e é definido pela entrada DOWNSAMPLE_FACTOR.

O downsampler é implementado com uma fila de atraso circular e um acumulador. 
A fila de atraso circular é usada para armazenar os valores de entrada e o acumulador é usado para calcular a média dos valores de entrada. 
O contador é usado para determinar quando o downsampler deve produzir um novo valor de saída.

A lógica de downsampling é implementada no bloco always @(posedge CLOCK). 
Quando um novo valor de entrada é recebido, ele é armazenado na fila de atraso circular e o acumulador é atualizado. 
Quando o contador atinge o fator de downsampling, a média é calculada e armazenada na saída out_data.

Este módulo é um downsampler, responsável por reduzir a taxa de amostragem dos dados de entrada. Ele tem um parâmetro DWIDTH que define a largura de bits dos dados de entrada e um parâmetro DOWNSAMPLE_FACTOR que define o fator de downsampling. O módulo tem uma entrada de clock (CLOCK_IN), um sinal de reset (RESET), um sinal de habilitação (ENABLE), um sinal de dados de entrada (DATA_IN) e uma saída de dados (DATA_OUT).
O downsampler utiliza uma fila de atraso circular (delay line) para armazenar as amostras de entrada. Em cada ciclo de clock, uma nova amostra é adicionada à fila e a amostra mais antiga é removida. O downsampler mantém um acumulador (sum) para somar os valores das amostras na fila de atraso.
O downsampler também tem um contador que é incrementado a cada ciclo de clock. Quando o contador atinge o valor do fator de downsampling, o acumulador é dividido pelo fator de downsampling e a média é calculada. O valor da média é então atribuído à saída de dados (DATA_OUT).
O módulo tem um comportamento de reset. Quando o sinal de reset é acionado, a fila de atraso circular é zerada e o contador é resetado. Isso garante que o downsampler comece a operar a partir de um estado conhecido e previsível.

*/

module DOWNSAMPLER #(
    parameter DWIDTH = 14, 					// Largura de bits de dados de entrada
    parameter DOWNSAMPLE_FACTOR = 256, 	// Fator de downsampling
	 //parameter DOWNSAMPLE_WIDTH = $clog2(DOWNSAMPLE_FACTOR),
	 parameter SUM_WIDTH = DWIDTH + $clog2(DOWNSAMPLE_FACTOR)
)(
    CLOCK_IN, 						// clock
    RESET, 							// reset
	 ENABLE,							// enable
    DATA_IN, 						// dados de entrada
    DATA_OUT 						// dados de saída
);


input	CLOCK_IN;
input RESET;
input	ENABLE;
input	[DWIDTH-1:0]	DATA_IN;
output reg [DWIDTH-1:0]	DATA_OUT;

reg [DOWNSAMPLE_FACTOR-1:0] counter = 0; 								 // contador para o fator de downsampling
reg [SUM_WIDTH-1:0] sum = 0; 												 // acumulador para os valores de entrada
reg [DWIDTH-1:0] delay_line [0:DOWNSAMPLE_FACTOR-1]; 				 // fila de atraso circular

integer i; 

always @(posedge CLOCK_IN) begin
    if (RESET) 
    begin
        counter <= 0;
        sum <= 0;
        for (i = 0; i < DOWNSAMPLE_FACTOR; i = i + 1) 
        begin
            delay_line[i] <= 0;
        end
    end 
    
    else if (ENABLE)
	 begin
        delay_line[0] <= DATA_IN;
        sum <= sum + DATA_IN - delay_line[DOWNSAMPLE_FACTOR-1];

        for (i = 1; i < DOWNSAMPLE_FACTOR; i = i + 1) 
        begin
            delay_line[i] <= delay_line[i-1];
        end

        counter <= counter + 1;

        if (counter == DOWNSAMPLE_FACTOR) 
        begin
            DATA_OUT <= sum >> $clog2(DOWNSAMPLE_FACTOR); // Calcular a média
            counter <= 0;
        end
    end

end

endmodule
