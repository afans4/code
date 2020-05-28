module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        case (state) 
            A: next_state = in ? A : B ;
            B: next_state = in ? B : A ;
            default : next_state = 1'bz;
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        if (areset == 1) state = B ;
        else state = next_state;
    end

    // Output logic
     assign out = (state == B) | ~(state == A);

endmodule
