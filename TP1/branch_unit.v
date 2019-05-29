`if_ndef branch_unit
define branch_unit

module branch_unit(
        input b,
        input beq_s2,
        input H,
        input P,
        input Hd,
        input Pd,
        output flush,
        output [1:0] mux_PC,
        output WRt,
        output WRp,
    );
    
    always @(*) begin
        if ((b == 1'b0) && (H == 1'b0)) begin
            mux_PC <= 2'd0; //PC + 4, don't go to branch
            WRt    <= 1'd0;
            WRp    <= 1'd0;
            flush  <= 1'd0;  // Don't flush
        end else if ((b == 1'b0) && (H == 1'b1)) begin
            mux_PC <= 2'd0; //PC + 4, don't go to branch
            WRt    <= 1'd0;
            WRp    <= 1'd0;
            flush  <= 1'd0;  // Don't flush
        end else if ((b == 1'b0) && (H == 1'b1) && (P == 1'b1)) begin
            mux_PC  <= 2'd1          
            WRt    <= 1'd0;
            WRp    <= 1'd0;
            flush  <= 1'd0;  // Don't flush      
        end else if((b == 1'b0) && (H == 1'b0)) begin
            mux_PC <= 2'd0; //PC + 4, don't go to branch
            WRt    <= 1'd1;
            WRp    <= 1'd1;
            flush  <= 1'd0; // Don't flush
        end else if((b == 1'b1) and (c == 1'b1) and (Hd == 1'b0))begin
            mux_PC <= 2'd3; // Goes to branch
            WRt    <= 1'd1;
            WRp    <= 1'd1;
            flush  <= 1'd1; // Flush the stage
        end else if((b == 1'b1) and (H == 1'b0)) begin
            mux_PC <= 2'd0; //PC + 4, don't go to branch
            WRt    <= 1'd0;
            WRp    <= 1'd0;
            flush  <= 1'd0; // Don't flush
        end else if((b == 1'b1) and (H == 1'b0) and (c == 1'b1) and (Hd == 1'b1) and (Pd == 1'b1)) begin
            mux_PC <= 2'd0; //PC + 4, don't go to branch
            WRt    <= 1'd0;
            WRp    <= 1'd0;
            flush  <= 1'd0; // Don't flush
        end else if((b == 1'b1) and (H == 1'b0) and (c == 1'b1) and (Hd == 1'b1) and (Pd == 1'b0)) begin
            mux_PC <= 2'd3; // Go to branch
            WRt    <= 1'd0; 
            WRp    <= 1'd1; // Change prediction to 1
            flush  <= 1'd1; // Don't flush
        end else if((b == 1'b1) and (H == 1'b0) and (c == 1'b0) and (Hd == 1'b1) and (Pd == 1'b1)) begin
            mux_PC <= 2'd2; // Go to branch
            WRt    <= 1'd0; 
            WRp    <= 1'd1; // Change prediction to 1
            flush  <= 1'd1; // Don't flush
        end
    end
endmodule
`endif
