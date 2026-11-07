module alu(
    input [7:0]a,
    input [7:0]b,
    input [2:0]op,
    output reg [7:0]result,
    output reg negative,
    output reg carry,
    output reg overflow,
    output reg zero
);
reg [8:0]temp;

always @(*) begin
    temp     = 9'b0;
    overflow = 1'b0;

    case (op)
        3'b000: begin   // ADD
            temp     = {1'b0, a} + {1'b0, b};
            overflow = (a[7] == b[7]) && (temp[7] != a[7]);
        end
        3'b001: begin   // SUB
            temp     = {1'b0, a} - {1'b0, b};
            overflow = (a[7] != b[7]) && (temp[7] != a[7]);
        end
        3'b010: temp = {1'b0, a & b};
        3'b011: temp = {1'b0, a | b};
        3'b100: temp = {1'b0, a ^ b};
        3'b101: temp = {1'b0, a << b[2:0]};
        3'b110: temp = {1'b0, a >> b[2:0]};
        3'b111: temp = {8'b0, (a == b)};
        default: temp = 9'b0;
    endcase

    result   = temp[7:0];
    carry    = temp[8];
    zero     = (temp[7:0] == 8'b0);
    negative = temp[7];
end
endmodule

