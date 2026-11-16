module binary_to_gray #(
    parameter int WIDTH = 4
) (
    input logic[WIDTH-1:0] binary,
    output logic[WIDTH-1:0] gray 
);

    assign gray = {binary[WIDTH-1], binary[WIDTH-1 :1] ^ binary[WIDTH-2 : 0]};

endmodule