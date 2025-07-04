//ad9361 top
module top(
            DDR_0_addr,
            DDR_0_ba,
            DDR_0_cas_n,
            DDR_0_ck_n,
            DDR_0_ck_p,
            DDR_0_cke,
            DDR_0_cs_n,
            DDR_0_dm,
            DDR_0_dq,
            DDR_0_dqs_n,
            DDR_0_dqs_p,
            DDR_0_odt,
            DDR_0_ras_n,
            DDR_0_reset_n,
            DDR_0_we_n,
            FIXED_IO_0_ddr_vrn,
            FIXED_IO_0_ddr_vrp,
            FIXED_IO_0_mio,
            FIXED_IO_0_ps_clk,
            FIXED_IO_0_ps_porb,
            FIXED_IO_0_ps_srstb


   );
    inout [14:0]DDR_0_addr;
    inout [2:0]DDR_0_ba;
    inout DDR_0_cas_n;
    inout DDR_0_ck_n;
    inout DDR_0_ck_p;
    inout DDR_0_cke;
    inout DDR_0_cs_n;
    inout [3:0]DDR_0_dm;
    inout [31:0]DDR_0_dq;
    inout [3:0]DDR_0_dqs_n;
    inout [3:0]DDR_0_dqs_p;
    inout DDR_0_odt;
    inout DDR_0_ras_n;
    inout DDR_0_reset_n;
    inout DDR_0_we_n;
    inout FIXED_IO_0_ddr_vrn;
    inout FIXED_IO_0_ddr_vrp;
    inout [53:0]FIXED_IO_0_mio;
    inout FIXED_IO_0_ps_clk;
    inout FIXED_IO_0_ps_porb;
    inout FIXED_IO_0_ps_srstb; 



	design_1_wrapper inst_design_1_wrapper
		(
			.DDR_0_addr            (DDR_0_addr),
			.DDR_0_ba              (DDR_0_ba),
			.DDR_0_cas_n           (DDR_0_cas_n),
			.DDR_0_ck_n            (DDR_0_ck_n),
			.DDR_0_ck_p            (DDR_0_ck_p),
			.DDR_0_cke             (DDR_0_cke),
			.DDR_0_cs_n            (DDR_0_cs_n),
			.DDR_0_dm              (DDR_0_dm),
			.DDR_0_dq              (DDR_0_dq),
			.DDR_0_dqs_n           (DDR_0_dqs_n),
			.DDR_0_dqs_p           (DDR_0_dqs_p),
			.DDR_0_odt             (DDR_0_odt),
			.DDR_0_ras_n           (DDR_0_ras_n),
			.DDR_0_reset_n         (DDR_0_reset_n),
			.DDR_0_we_n            (DDR_0_we_n),
			.FIXED_IO_0_ddr_vrn    (FIXED_IO_0_ddr_vrn),
			.FIXED_IO_0_ddr_vrp    (FIXED_IO_0_ddr_vrp),
			.FIXED_IO_0_mio        (FIXED_IO_0_mio),
			.FIXED_IO_0_ps_clk     (FIXED_IO_0_ps_clk),
			.FIXED_IO_0_ps_porb    (FIXED_IO_0_ps_porb),
			.FIXED_IO_0_ps_srstb   (FIXED_IO_0_ps_srstb)
			


		);
endmodule
