module Single_Cycle_Top_Tb ();
    
    reg clk, rst;

    // Instantiate the Top Module
    Single_Cycle_Top dut (
        .clk(clk),
        .rst(rst)
    );

    // 1. Correct Clock Generation (100MHz / 10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

   // 2. Correct Reset and Simulation Control
    initial begin
        // Start with Reset ACTIVE (1) to clear internal registers
        rst = 1'b1; 
        #10;          // Wait 1.5 cycles (Releases reset between clock edges)

        // De-assert Reset (0) to let the CPU start fetching instructions
        rst = 1'b0;

        #500;        // Run for 500ns
        $finish;      // End simulation
    end

endmodule