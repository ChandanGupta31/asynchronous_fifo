module async_fifo #(
    parameter int DATA_WIDTH = 8,
    parameter int ADDR_WIDTH = 3
) (
    input logic wr_clk,
    input logic rd_clk,
    input logic wr_en,
    input logic rd_en,
    input logic wr_rst_n,
    input logic rd_rst_n,
    input logic[DATA_WIDTH-1 : 0] data_in,

    output logic full,
    output logic empty,
    output logic[DATA_WIDTH-1 : 0] data_out
);

    // declaring local variables
    localparam int PTR_WIDTH = ADDR_WIDTH + 1;
    logic[PTR_WIDTH-1 : 0] wr_bin, rd_bin, wr_gray, rd_gray, wr_gray_sync, rd_gray_sync;
    logic[ADDR_WIDTH-1 : 0] wr_addr, rd_addr;
    logic wr_accept, rd_accept;

    // read, write acceptance logic
    assign wr_accept = wr_en && !full;
    assign rd_accept = rd_en && !empty;

    // extracting address
    assign wr_addr = wr_bin[ADDR_WIDTH-1 : 0];
    assign rd_addr = rd_bin[ADDR_WIDTH-1 : 0];

    // intantiating write module
    write_pointer wp1(
        .wr_clk(wr_clk),
        .wr_en(wr_accept),
        .wr_rst_n(wr_rst_n),
        .wr_bin(wr_bin),
        .wr_gray(wr_gray)
    );

    // instantiating read module
    read_pointer rp1(
        .rd_clk(rd_clk),
        .rd_en(rd_accept),
        .rd_rst_n(rd_rst_n),
        .rd_bin(rd_bin),
        .rd_gray(rd_gray)
    );

    // instantiating synchronizer for write
    synchronizer #(.WIDTH(PTR_WIDTH)) swr(
        .clk(wr_clk),
        .rst_n(wr_rst_n),
        .async_in(rd_gray),
        .sync_out(rd_gray_sync)
    );

    // instantiating sychronizer for read
    synchronizer #(.WIDTH(PTR_WIDTH)) srd(
        .clk(rd_clk),
        .rst_n(rd_rst_n),
        .async_in(wr_gray),
        .sync_out(wr_gray_sync)
    );

    // memory instantiation
    fifo_memory #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) memory(
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .wr_en(wr_accept),
        .rd_en(rd_accept),
        .wr_addr(wr_addr),
        .rd_addr(rd_addr),
        .data_in(data_in),
        .data_out(data_out)
    );

endmodule