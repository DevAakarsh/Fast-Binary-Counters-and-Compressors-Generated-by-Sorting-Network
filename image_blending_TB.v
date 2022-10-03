
module tb;
    reg [15:0] A;
    reg [15:0] B;
    reg [35:0] final_image;
    wire [33:0] y_cameraman, y_lena;
    
    integer cameraman_file, lena_file, output_file;
    
    counter_mult DUT_cameraman (A,3,y_cameraman);
    counter_mult DUT_lena (7,B,y_lena);
    
    initial begin
       cameraman_file = $fopen("D:/IIIT-B/Semester3/Aakarsh_PE/cameraman.txt", "r");
       lena_file = $fopen("D:/IIIT-B/Semester3/Aakarsh_PE/lena.txt", "r");
       //output_file = $fopen("D:/IIIT-B/Semester3/Aakarsh_PE/output_alpha_0.5.txt", "w");
        
       while (!$feof(cameraman_file)) begin 
            $fscanf(cameraman_file,"%d\n",A);
            $fscanf(lena_file,"%d\n",B);
            final_image = y_cameraman + y_lena;
            #10;
            //$fwrite(output_file,"%d\n",final_image);
       end
        
       $fclose(cameraman_file);
       $fclose(lena_file);
       //$fclose(output_file);
       $finish;
    end
    
endmodule