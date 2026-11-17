module synchronizer #(
    parameter int WIDTH = 1
)(
    input logic clk,
    input logic rst_n,
    input logic[WIDTH-1 : 0] async_in,
    output logic[WIDTH-1 : 0] sync_out
);

    logic[WIDTH-1 : 0] intermediate_value;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sync_out <= 0;
            intermediate_value <= 0;
        end
        else begin
            intermediate_value <= async_in;
            sync_out <= intermediate_value;
        end
    end
    
endmodule