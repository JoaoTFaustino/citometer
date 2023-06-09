
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module ada_hsmc(

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// Seg7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	//////////// HPS //////////
	inout 		          		HPS_CONV_USB_N,
	output		    [14:0]		HPS_DDR3_ADDR,
	output		     [2:0]		HPS_DDR3_BA,
	output		          		HPS_DDR3_CAS_N,
	output		          		HPS_DDR3_CKE,
	output		          		HPS_DDR3_CK_N,
	output		          		HPS_DDR3_CK_P,
	output		          		HPS_DDR3_CS_N,
	output		     [3:0]		HPS_DDR3_DM,
	inout 		    [31:0]		HPS_DDR3_DQ,
	inout 		     [3:0]		HPS_DDR3_DQS_N,
	inout 		     [3:0]		HPS_DDR3_DQS_P,
	output		          		HPS_DDR3_ODT,
	output		          		HPS_DDR3_RAS_N,
	output		          		HPS_DDR3_RESET_N,
	input 		          		HPS_DDR3_RZQ,
	output		          		HPS_DDR3_WE_N,
	output		          		HPS_ENET_GTX_CLK,
	inout 		          		HPS_ENET_INT_N,
	output		          		HPS_ENET_MDC,
	inout 		          		HPS_ENET_MDIO,
	input 		          		HPS_ENET_RX_CLK,
	input 		     [3:0]		HPS_ENET_RX_DATA,
	input 		          		HPS_ENET_RX_DV,
	output		     [3:0]		HPS_ENET_TX_DATA,
	output		          		HPS_ENET_TX_EN,
	inout 		     [3:0]		HPS_FLASH_DATA,
	output		          		HPS_FLASH_DCLK,
	output		          		HPS_FLASH_NCSO,
	inout 		          		HPS_GSENSOR_INT,
	inout 		          		HPS_I2C1_SCLK,
	inout 		          		HPS_I2C1_SDAT,
	inout 		          		HPS_I2C2_SCLK,
	inout 		          		HPS_I2C2_SDAT,
	inout 		          		HPS_I2C_CONTROL,
	inout 		          		HPS_KEY,
	inout 		          		HPS_LCM_BK,
	inout 		          		HPS_LCM_D_C,
	inout 		          		HPS_LCM_RST_N,
	output		          		HPS_LCM_SPIM_CLK,
	input 		          		HPS_LCM_SPIM_MISO,
	output		          		HPS_LCM_SPIM_MOSI,
	output		          		HPS_LCM_SPIM_SS,
	inout 		          		HPS_LED,
	inout 		          		HPS_LTC_GPIO,
	output		          		HPS_SD_CLK,
	inout 		          		HPS_SD_CMD,
	inout 		     [3:0]		HPS_SD_DATA,
	output		          		HPS_SPIM_CLK,
	input 		          		HPS_SPIM_MISO,
	output		          		HPS_SPIM_MOSI,
	output		          		HPS_SPIM_SS,
	input 		          		HPS_UART_RX,
	output		          		HPS_UART_TX,
	input 		          		HPS_USB_CLKOUT,
	inout 		     [7:0]		HPS_USB_DATA,
	input 		          		HPS_USB_DIR,
	input 		          		HPS_USB_NXT,
	output		          		HPS_USB_STP,

	//////////// HSMC, HSMC connect to ADA - High Speed ADC/DAC //////////
	output		          		ADA_SCL,
	inout 		          		ADA_SDA,
	output		          		ADC_CLK_A,
	output		          		ADC_CLK_B,
	input 		    [13:0]		ADC_DA,
	input 		    [13:0]		ADC_DB,
	output		          		ADC_OEB_A,
	output		          		ADC_OEB_B,
	input 		          		ADC_OTR_A,
	input 		          		ADC_OTR_B,
	output		          		DAC_CLK_A,
	output		          		DAC_CLK_B,
	output		    [13:0]		DAC_DA,
	output		    [13:0]		DAC_DB,
	output		          		DAC_MODE,
	output		          		DAC_WRT_A,
	output		          		DAC_WRT_B,
	input 		          		OSC_SMA_ADC4,
	input 		          		SMA_DAC4
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

    hps u0 (
        .clk_clk                         			(CLOCK_50),                      //             clk.clk
        .hps_io_hps_io_emac1_inst_TX_CLK 			(HPS_ENET_GTX_CLK), 					//             hps_io.hps_io_emac1_inst_TX_CLK
        .hps_io_hps_io_emac1_inst_TXD0   			(HPS_ENET_TX_DATA[0]),   			//            .hps_io_emac1_inst_TXD0
        .hps_io_hps_io_emac1_inst_TXD1   			(HPS_ENET_TX_DATA[1]),   			//            .hps_io_emac1_inst_TXD1
        .hps_io_hps_io_emac1_inst_TXD2   			(HPS_ENET_TX_DATA[2]),   			//            .hps_io_emac1_inst_TXD2
        .hps_io_hps_io_emac1_inst_TXD3   			(HPS_ENET_TX_DATA[3]),   			//            .hps_io_emac1_inst_TXD3
        .hps_io_hps_io_emac1_inst_RXD0   			(HPS_ENET_RX_DATA[0]),   			//            .hps_io_emac1_inst_RXD0
        .hps_io_hps_io_emac1_inst_MDIO   			(HPS_ENET_MDIO),   					//            .hps_io_emac1_inst_MDIO
        .hps_io_hps_io_emac1_inst_MDC    			(HPS_ENET_MDC),    					//            .hps_io_emac1_inst_MDC
        .hps_io_hps_io_emac1_inst_RX_CTL 			(HPS_ENET_RX_DV), 					//            .hps_io_emac1_inst_RX_CTL
        .hps_io_hps_io_emac1_inst_TX_CTL 			(HPS_ENET_TX_EN), 					//            .hps_io_emac1_inst_TX_CTL
        .hps_io_hps_io_emac1_inst_RX_CLK 			(HPS_ENET_RX_CLK), 					//            .hps_io_emac1_inst_RX_CLK
        .hps_io_hps_io_emac1_inst_RXD1   			(HPS_ENET_RX_DATA[1]),   			//            .hps_io_emac1_inst_RXD1
        .hps_io_hps_io_emac1_inst_RXD2   			(HPS_ENET_RX_DATA[2]),  		 	//            .hps_io_emac1_inst_RXD2
        .hps_io_hps_io_emac1_inst_RXD3   			(HPS_ENET_RX_DATA[3]),   			//            .hps_io_emac1_inst_RXD3
        .hps_io_hps_io_sdio_inst_CMD     			(HPS_SD_CMD),     					//            .hps_io_sdio_inst_CMD
        .hps_io_hps_io_sdio_inst_D0      			(HPS_SD_DATA[0]),      				//            .hps_io_sdio_inst_D0
        .hps_io_hps_io_sdio_inst_D1      			(HPS_SD_DATA[1]),      				//            .hps_io_sdio_inst_D1
        .hps_io_hps_io_sdio_inst_CLK     			(HPS_SD_CLK),     					//            .hps_io_sdio_inst_CLK
        .hps_io_hps_io_sdio_inst_D2      			(HPS_SD_DATA[2]),      				//            .hps_io_sdio_inst_D2
        .hps_io_hps_io_sdio_inst_D3      			(HPS_SD_DATA[3]),      				//            .hps_io_sdio_inst_D3
        .hps_io_hps_io_usb1_inst_D0      			(HPS_USB_DATA[0]),      			//            .hps_io_usb1_inst_D0
        .hps_io_hps_io_usb1_inst_D1      			(HPS_USB_DATA[1]),      			//            .hps_io_usb1_inst_D1
        .hps_io_hps_io_usb1_inst_D2      			(HPS_USB_DATA[2]),      			//            .hps_io_usb1_inst_D2
        .hps_io_hps_io_usb1_inst_D3     			(HPS_USB_DATA[3]),      			//            .hps_io_usb1_inst_D3
        .hps_io_hps_io_usb1_inst_D4     			(HPS_USB_DATA[4]),      			//            .hps_io_usb1_inst_D4
        .hps_io_hps_io_usb1_inst_D5      			(HPS_USB_DATA[5]),      			//            .hps_io_usb1_inst_D5
        .hps_io_hps_io_usb1_inst_D6      			(HPS_USB_DATA[6]),      			//            .hps_io_usb1_inst_D6
        .hps_io_hps_io_usb1_inst_D7      			(HPS_USB_DATA[7]),      			//            .hps_io_usb1_inst_D7
        .hps_io_hps_io_usb1_inst_CLK     			(HPS_USB_CLKOUT),     				//            .hps_io_usb1_inst_CLK
        .hps_io_hps_io_usb1_inst_STP     			(HPS_USB_STP),     					//            .hps_io_usb1_inst_STP
        .hps_io_hps_io_usb1_inst_DIR     			(HPS_USB_DIR),    				 	//            .hps_io_usb1_inst_DIR
        .hps_io_hps_io_usb1_inst_NXT     			(HPS_USB_NXT),     					//            .hps_io_usb1_inst_NXT
        .hps_io_hps_io_uart0_inst_RX     			(HPS_UART_RX),     					//            .hps_io_uart0_inst_RX
        .hps_io_hps_io_uart0_inst_TX     			(HPS_UART_TX),     					//            .hps_io_uart0_inst_TX
		  .hps_io_hps_io_gpio_inst_GPIO35  			(HPS_ENET_INT_N),						// 			  .hps_io_gpio_inst_GPIO35
        .memory_mem_a                    			(HPS_DDR3_ADDR),                 //             memory.mem_a
        .memory_mem_ba                   			(HPS_DDR3_BA),                   //            .mem_ba
        .memory_mem_ck                   			(HPS_DDR3_CK_P),                 //            .mem_ck
        .memory_mem_ck_n                 			(HPS_DDR3_CK_N),                 //            .mem_ck_n
        .memory_mem_cke                 			(HPS_DDR3_CKE),                  //            .mem_cke
        .memory_mem_cs_n                			(HPS_DDR3_CS_N),                 //            .mem_cs_n
        .memory_mem_ras_n               			(HPS_DDR3_RAS_N),                //            .mem_ras_n
        .memory_mem_cas_n               			(HPS_DDR3_CAS_N),                //            .mem_cas_n
        .memory_mem_we_n                			(HPS_DDR3_WE_N),                 //            .mem_we_n
        .memory_mem_reset_n              			(HPS_DDR3_RESET_N),              //            .mem_reset_n
        .memory_mem_dq                   			(HPS_DDR3_DQ),                   //            .mem_dq
        .memory_mem_dqs                  			(HPS_DDR3_DQS_P),                //            .mem_dqs
        .memory_mem_dqs_n                			(HPS_DDR3_DQS_N),                //            .mem_dqs_n
        .memory_mem_odt                  			(HPS_DDR3_ODT),                  //            .mem_odt
        .memory_mem_dm                   			(HPS_DDR3_DM),                   //            .mem_dm
        .memory_oct_rzqin                			(HPS_DDR3_RZQ),                 	//            .oct_rzqin

	 );

	 
	pll_65  pll_65   (
	  .refclk(CLOCK_50),
	  .rst(1'b0),
	  .outclk_0(CLK_65)
					); 

					
   THDB_ADA thdb_ada (
		.CLOCK_50	 (CLOCK_50),
		.CLOCK_65	 (CLK_65),
		.ADC_CLK_A	 (ADC_CLK_A),
		.ADC_CLK_B   (ADC_CLK_B),
		.ADC_DA		 (ADC_DA),
		.ADC_DB		 (ADC_DB),
		.ADC_OEB_A	 (ADC_OEB_A),
		.ADC_OEB_B	 (ADC_OEB_B),
		.ADC_OTR_A   (ADC_OTR_A),
		.ADC_OTR_B	 (ADC_OTR_B),
		.DAC_CLK_A	 (DAC_CLK_A),
		.DAC_CLK_B   (DAC_CLK_B),
		.DAC_DA		 (DAC_DA),
		.DAC_DB		 (DAC_DB),
		.DAC_MODE	 (DAC_MODE),
		.DAC_WRT_A	 (DAC_WRT_A),
		.DAC_WRT_B	 (DAC_WRT_B),
		.POWER_ON    (POWER_ON),
		.OSC_SMA_ADC4(OSC_SMA_ADC4),
		.SMA_DAC4    (SMA_DAC4)
	
	);

	
	COUNTER counter(
		.CLOCK_IN (CLK_65),
		.RESET (SW[9]),
		.DATA (LEDR[8:0]),
		.ENABLE (SW[0]),
		.TRIGGER (LEDR[9]),
	);
	
	CUMULATIVE_ADDER cumulative_adder(
		.DATA_IN(),
		.DATA_OUT(),
		.TRIGGER()
	);
	
	
//=======================================================
//  Structural coding
//=======================================================
/*
reg [25:0] count; 
reg led_level;

initial begin
	count<=0;
	led_level<=0;
end

always @ (posedge CLK_65)
begin
	if(count==32499999)
		begin
			count<=0;
			led_level<=~led_level;
	   end
	else
		count<=count+1'b1;
end


assign LEDR[0] = led_level;
assign LEDR[1] = LEDR[0];
assign LEDR[2] = LEDR[1];
assign LEDR[3] = LEDR[2];
assign LEDR[4] = LEDR[3];
assign LEDR[5] = LEDR[4];
assign LEDR[6] = LEDR[5];
assign LEDR[7] = LEDR[6];
assign LEDR[8] = LEDR[7];
assign LEDR[9] = LEDR[8];

*/





endmodule
