module sign_extend_concat (
    input [11:0] num1,   // 12-bit input number 1
    input [11:0] num2,   // 12-bit input number 2
    output [15:0] result // 32-bit concatenated result
);

    wire [15:0] extended_num1, extended_num2;

    //assign extended_num1 = {  4'b0000,num1};
    //assign extended_num2 = { 4'b0000,num2}; 
    assign extended_num1 = {num1[11:4]};
    assign extended_num2 = {num2[11:4]};

    assign result = {extended_num2, extended_num1}; 


endmodule 