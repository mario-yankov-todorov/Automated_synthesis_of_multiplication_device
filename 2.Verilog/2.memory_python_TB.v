`timescale 1ns / 1ps

module memory_python_TB;

    parameter               N   = 8     ;

    // Inputs
    reg     [N     -1:0]    address     ;
    reg                     read_en     ;
    reg                     ce          ;

    // Output                   
    wire    [N     -1:0]    data        ;
 
    // Variable to enter combinations of
    // different inputs in the for loop 
    integer                 i           ;
  
    // Instantiate the Unit Under Test (UUT)
    memory_python dut
        (
            .address    (address)   ,
            .read_en    (read_en)   ,
            .ce         (ce)        ,
            .data       (data)      
        );

    initial begin
        address = 0;
        read_en = 0;
        ce      = 0;
        
        #10 
        $monitor 
            (
                "address = %h, data = %h, read_en = %b, ce = %b",
                address, data, read_en, ce
            );


        // Enter combinations of different inputs
        for (i = 0; i < 2**(2 * N); i = i + 1 )   begin

            #5 
            address = i;
            read_en = 1;
            ce = 1;

            #5 
            read_en = 0;
            ce = 0;
            address = 0;
        end

    end

endmodule