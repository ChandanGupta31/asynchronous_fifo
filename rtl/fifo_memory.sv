module fifo_memory #(
    parameter int DATA_WIDTH = 8,
    parameter int ADDR_WIDTH = 3
)(
    input logic wr_clk,
    input logic rd_clk,
    input logic wr_en,
    input logic rd_en,
    input logic[ADDR_WIDTH-1 : 0] wr_addr,
    input logic[ADDR_WIDTH-1 : 0] rd_addr,
    input logic[DATA_WIDTH-1 : 0] data_in,

    output logic[DATA_WIDTH-1 : 0] data_out
);

    logic [DATA_WIDTH-1:0] mem [0:(1 << ADDR_WIDTH)-1];     // Data Size and then Address Size

    always_ff @( posedge wr_clk ) begin
        if (wr_en) begin
            mem[wr_addr] <= data_in;
        end
    end

    always_ff @(posedge rd_clk) begin
        if (rd_en ) begin
            data_out <= mem[rd_addr];
        end
    end

endmodule