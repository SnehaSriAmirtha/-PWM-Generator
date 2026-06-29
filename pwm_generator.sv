// Code your design here
module pwm_generator #(
    parameter WIDTH = 8   // counter width, sets resolution
)(
    input  wire              clk,
    input  wire              rst,
    input  wire [WIDTH-1:0]  duty,    // duty cycle control (0 to PERIOD)
    input  wire [WIDTH-1:0]  period,  // period value sets frequency
    output reg               pwm_out
);

    reg [WIDTH-1:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter  <= 0;
            pwm_out  <= 0;
        end else begin
         
            if (counter >= period - 1)
                counter <= 0;
            else
                counter <= counter + 1;

            if (counter < duty)
                pwm_out <= 1'b1;
            else
                pwm_out <= 1'b0;
        end
    end

endmodule
