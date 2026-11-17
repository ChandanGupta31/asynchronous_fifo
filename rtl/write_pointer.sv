module write_pointer #(
    parameter int ADDR_WIDTH = 3
) (
    input logic wr_clk,
    input logic wr_en,
    input logic wr_rst_n,

    output logic[ADDR_WIDTH : 0] wr_bin,
    output logic[ADDR_WIDTH : 0] wr_gray
);

    always_ff @(posedge wr_clk or negedge wr_rst_n) begin
        if (!wr_rst_n) wr_bin <= 0;
        else begin
            if (wr_en) wr_bin <= wr_bin + 1'b1;
        end
    end

    always_comb begin
        wr_gray = wr_bin ^ (wr_bin >> 1);
    end
    
endmodule