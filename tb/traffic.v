with open('tb_traffic.v', 'w') as f:
    f.write("""
module tb_traffic;
    reg clk, reset, ped_button;
    wire [2:0] light;

    traffic_controller uut (clk, reset, ped_button, light);

    always #5 clk = ~clk; 

    initial begin
        $dumpfile("traffic.vcd");
        $dumpvars(0, tb_traffic);
        clk = 0; reset = 1; ped_button = 0;
        #10 reset = 0;
        #100;
        ped_button = 1; // Pedestrian presses button
        #10 ped_button = 0;
        #100 $finish;
    end
endmodule
""")
