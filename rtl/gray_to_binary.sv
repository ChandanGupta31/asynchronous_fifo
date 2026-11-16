module gray_to_binary #(
    parameter int WIDTH = 4
) (
    input logic[WIDTH-1 : 0] gray,
    output logic[WIDTH-1 : 0] binary
);
    
    genvar i;
    for (i = 0; i<WIDTH; i=i+1) begin
        binary[i] = ^gray[WIDTH-1:i];
    end

endmodule