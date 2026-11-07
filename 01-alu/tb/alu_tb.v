module alu_tb;
    reg [7:0] a, b;
    reg [2:0] op;

    wire [7:0] result;
    wire zero, carry, overflow, negative;

    integer pass = 0, fail = 0;

    alu dut (
        .a(a), .b(b), .op(op),
        .result(result),
        .zero(zero), .carry(carry),
        .overflow(overflow), .negative(negative)
    );

    task check;
        input [7:0] ta, tb_val;
        input [2:0] top;
        input [7:0] exp_res;
        input exp_z, exp_c, exp_v, exp_n;

        begin
            a = ta;
            b = tb_val;
            op = top;
            #10;

            if ({result,zero,carry,overflow,negative} ===
                {exp_res,exp_z,exp_c,exp_v,exp_n}) begin
                pass = pass + 1;
            end
            else begin
                fail = fail + 1;
                $display("FAIL: a=%0d b=%0d op=%b result=%h",
                         ta,tb_val,top,result);
            end
        end
    endtask

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0,alu_tb);

        // ADD
        check(5,3,0,8,0,0,0,0);
        check(255,1,0,0,1,1,0,0);
        check(127,1,0,128,0,0,1,1);
        check(128,128,0,0,1,1,1,0);
        check(10,20,0,30,0,0,0,0);

        // SUB
        check(5,5,1,0,1,0,0,0);
        check(3,5,1,254,0,1,0,1);
        check(0,1,1,255,0,1,0,1);
        check(128,1,1,127,0,0,1,0);
        check(10,3,1,7,0,0,0,0);

        // AND
        check(240,15,2,0,1,0,0,0);
        check(255,255,2,255,0,0,0,1);
        check(170,85,2,0,1,0,0,0);
        check(240,240,2,240,0,0,0,1);

        // OR
        check(240,15,3,255,0,0,0,1);
        check(0,0,3,0,1,0,0,0);
        check(170,85,3,255,0,0,0,1);
        check(15,16,3,31,0,0,0,0);

        // XOR
        check(240,15,4,255,0,0,0,1);
        check(170,85,4,255,0,0,0,1);
        check(255,255,4,0,1,0,0,0);
        check(12,10,4,6,0,0,0,0);

        // LEFT SHIFT
        check(1,1,5,2,0,0,0,0);
        check(1,3,5,8,0,0,0,0);
        check(255,1,5,254,0,0,0,1);
        check(1,0,5,1,0,0,0,0);

        // RIGHT SHIFT
        check(8,1,6,4,0,0,0,0);
        check(128,1,6,64,0,0,0,0);
        check(255,4,6,15,0,0,0,0);
        check(64,0,6,64,0,0,0,0);

        // COMPARE
        check(5,5,7,1,0,0,0,0);
        check(5,3,7,0,1,0,0,0);
        check(0,0,7,1,0,0,0,0);
        check(255,255,7,1,0,0,0,0);

        $display("Done: %0d passed, %0d failed",pass,fail);
        $finish;
    end
endmodule