with open('traffic_light.v', 'w') as f:
    f.write("""
module traffic_controller (
    input clk,
    input reset,
    input ped_button,    
    output reg [2:0] light 
);
    parameter S_GREEN  = 2'b00, S_YELLOW = 2'b01, S_RED = 2'b10;
    reg [1:0] state, next_state;
    reg [3:0] timer; 

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S_GREEN;
            timer <= 0;
        end else begin
            if (timer == 4'd10 || (state == S_GREEN && ped_button)) begin
                state <= next_state;
                timer <= 0;
            end else begin
                timer <= timer + 1;
            end
        end
    end

    always @(*) begin
        case (state)
            S_GREEN:  next_state = S_YELLOW;
            S_YELLOW: next_state = S_RED;
            S_RED:    next_state = S_GREEN;
            default:  next_state = S_GREEN;
        endcase
    end

    always @(*) begin
        case (state)
            S_GREEN:  light = 3'b001; 
            S_YELLOW: light = 3'b010; 
            S_RED:    light = 3'b100; 
            default:  light = 3'b100;
        endcase
    end
endmodule
""")
