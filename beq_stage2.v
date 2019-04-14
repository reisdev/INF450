`if_ndef beq_stage2
define beq_stage2

module beq_stage2(
    input data1,
    input data2,
    output comp_out
);
    assign comp_out = data1 == data2
`endif