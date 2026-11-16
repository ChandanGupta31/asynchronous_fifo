module synchronizer(
    input logic clk,
    input logic rst_n,
    input logic async_in,
    output logic sync_out
);

    logic intermediate_value;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sync_out <= 1'b0;
            intermediate_value <= 1'b0;
        end
        else begin
            intermediate_value <= async_in;
            sync_out <= intermediate_value;
        end
    end
    
endmodule