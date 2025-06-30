module axi_streamer #(
    parameter DATA_WIDTH = 32,
    parameter TLAST_INTERVAL = 4096,
    // Calculate the required counter width automatically.
    parameter COUNTER_WIDTH = $clog2(TLAST_INTERVAL)
)(
    input  wire                  m_axis_aclk,
    input  wire                  rst_n,

    // Data source signals: when iq_data_valid=1, iq_32_data is a new data word
    input  wire                  iq_data_valid,
    input  wire [DATA_WIDTH-1:0] iq_32_data,

    // AXI4-Stream output interface
    output reg [DATA_WIDTH-1:0]  m_axis_tdata,
    output reg                   m_axis_tvalid,
    output reg                   m_axis_tlast,
    input  wire                  m_axis_tready
);

    // Counter to track successful transfers
    reg [COUNTER_WIDTH-1:0] transfer_count;

    always @(posedge m_axis_aclk or negedge rst_n) begin
        if (!rst_n) begin
            m_axis_tdata   <= {DATA_WIDTH{1'b0}};
            m_axis_tvalid  <= 1'b0;
            m_axis_tlast   <= 1'b0;
            transfer_count <= 0;
        end else begin
            // Only update the transfer count and tlast when a handshake occurs.
            if (m_axis_tvalid && m_axis_tready) begin
                // On a successful transfer, if tlast was asserted, clear it.
                if (m_axis_tlast)
                    m_axis_tlast <= 1'b0;
                
                // Increment counter or reset if TLAST_INTERVAL reached.
                if (transfer_count == (TLAST_INTERVAL - 1))
                    transfer_count <= 0;
                else
                    transfer_count <= transfer_count + 1'b1;
                    
                // If no new data is immediately available, drop tvalid.
                if (!iq_data_valid)
                    m_axis_tvalid <= 1'b0;
            end

            // When new data is available and either idle or handshake ready:
            if (iq_data_valid && (!m_axis_tvalid || (m_axis_tvalid && m_axis_tready))) begin
                m_axis_tdata <= iq_32_data;
                m_axis_tvalid <= 1'b1;
                // Check if this transfer should be the last in the burst.
                if (transfer_count == (TLAST_INTERVAL - 1)) begin
                    m_axis_tlast <= 1'b1;
                end
            end
            // Otherwise, if m_axis_tvalid is high and m_axis_tready is low, hold the current values.
        end
    end
endmodule
