module read_pointer #(
    parameter int ADDR_WIDTH = 3
) (
    input logic rd_clk,
    input logic rd_en,
    input logic rd_rst_n,

    output logic[ADDR_WIDTH : 0] rd_bin,
    output logic[ADDR_WIDTH : 0] rd_gray
);

    always_ff @( posedge rd_clk or negedge rd_rst_n ) begin
        if (!rd_rst_n) rd_bin <= 0;
        else begin
            if (rd_en) rd_bin <= rd_bin + 1'b1;
        end
    end

    always_comb begin
        rd_gray = rd_bin ^ (rd_bin >> 1);
    end
    
endmodule