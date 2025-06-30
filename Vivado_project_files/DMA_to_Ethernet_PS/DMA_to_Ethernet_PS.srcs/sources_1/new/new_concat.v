module sign_extend_concat_32 (
    input  [11:0] num1,         // 12-bit input number 1
    input  [11:0] num2,         // 12-bit input number 2
    output [31:0] result        // 32-bit concatenated result (note: now truly 32-bit)
);

    wire [15:0] extended_num1, extended_num2;

    // Sign-extend by replicating the sign bit (bit 11) into the top 4 bits
    assign extended_num1 = { {4{num1[11]}}, num1 };
    assign extended_num2 = { {4{num2[11]}}, num2 };

    // Concatenate both extended numbers
    assign result = {extended_num2, extended_num1}; 

endmodule
