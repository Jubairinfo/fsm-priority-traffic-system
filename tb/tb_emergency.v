with open('tb_emergency.v', 'w') as f:
    f.write("""
module tb_emergency;
    reg clk, reset, ped_button, emergency_input;
    wire [2:0] light;

    emergency_traffic uut (clk, reset, ped_button, emergency_input, light);

    always #5 clk = ~clk; 

    initial begin
        $dumpfile("emergency.vcd");
        $dumpvars(0, tb_emergency);
        
        clk = 0; reset = 1; ped_button = 0; emergency_input = 0;
        #10 reset = 0;

        // Normal cycle
        #50;

        // Scenario: Light is turning Red, but an Ambulance arrives!
        $display("Ambulance detected at 80ns!");
        #20 emergency_input = 1; 
        #20 emergency_input = 0;

        #100 $finish;
    end
endmodule
""")
