module COUNTER(
	CLOCK_IN,
	RESET,
	DATA,
	ENABLE,
	TRIGGER
);

/*

Counter from 0 to 511

*/
			
input 				CLOCK_IN;
input 				RESET;
input					ENABLE;
output	[8:0]		DATA;
output				TRIGGER;

assign DATA = cDATA;
assign TRIGGER = (cDATA==9'b111111111) ? 1'b1 : 1'b0;

reg 		[8:0] 	cDATA;		
reg 		[25:0] 	cCLOCK;		


initial begin
	cCLOCK<=0;
	cDATA<={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
end


always @ (posedge CLOCK_IN)
begin

	if(cCLOCK==3249999) //32499999 
		begin
			cCLOCK <= 0;
	
			if (RESET)
			begin
				cDATA <= 9'b000000000;
			end
			
			else if (ENABLE && (cDATA == 9'b111111111))
			begin
				cDATA <= 9'b000000000;
			end
			
			else if (ENABLE)
			begin
				cDATA <= cDATA + 1'b1;
			end
	
		end
	else
		cCLOCK<=cCLOCK+1'b1;
		
	
	
end

/*
always @ (posedge CLOCK_IN)
begin
	if (RESET)
	begin
		cDATA <= 9'b000000000;
	end
	
	else if (ENABLE && (cDATA == 9'b111111111))
	begin
		cDATA <= 9'b000000000;
	end
	
	if (ENABLE)
	begin
		cDATA <= cDATA + 1'b1;
	end

end
*/
			
			
			
endmodule