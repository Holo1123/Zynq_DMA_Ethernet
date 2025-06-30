module test_data_gen_axi_stream (
    input  wire        clk,        // System clock (100 MHz)
    input  wire        rstn,       // Active-low reset
    input  wire        tready,     // AXI stream ready
    output wire        tvalid,     // AXI stream valid
    output wire [31:0] tdata,      // AXI stream data (signed ramp)
    output wire        tlast       // AXI stream TLAST every 4096 samples
);

    // Clock divider to generate a 10 MHz tick
    reg [3:0] clk_div_cnt = 0;
    wire tick_10mhz = (clk_div_cnt == 9);

    always @(posedge clk) begin
        if (!rstn)
            clk_div_cnt <= 0;
        else if (tick_10mhz)
            clk_div_cnt <= 0;
        else
            clk_div_cnt <= clk_div_cnt + 1;
    end

    // Ramp generator and TLAST counter
    reg signed [31:0] ramp     = 0;
    reg        [11:0] sample_count = 0;  // Counts up to 4095
    reg               valid_reg = 0;
    reg               last_reg  = 0;

    always @(posedge clk) begin
        if (!rstn) begin
            ramp         <= 0;
            sample_count <= 0;
            valid_reg    <= 0;
            last_reg     <= 0;
        end else if (tick_10mhz && tready) begin
            ramp <= ramp + 1;

            // Update sample count and TLAST
            if (sample_count == 4095) begin
                sample_count <= 0;
                last_reg <= 1;
            end else begin
                sample_count <= sample_count + 1;
                last_reg <= 0;
            end

            valid_reg <= 1;
        end else begin
            valid_reg <= 0;
            last_reg  <= 0;
        end
    end

    assign tdata  = ramp;
    assign tvalid = valid_reg;
    assign tlast  = last_reg;

endmodule
