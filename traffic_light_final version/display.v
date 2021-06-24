module display(RET, CLK, MainNumber, CountryNumber, M1, M0, C1, C0,C);
input CLK, RET,C;
input [4:0]MainNumber, CountryNumber;
output [7:0]M1, M0, C1, C0;

reg [7:0]M1, M0, C1, C0;
reg [4:0]T;


task led_out;        
output [7:0]N1, N2;             //this task translate the numJber for LED
case(T)
0: begin
        N1 = 8'b11000000;
        N2 = 8'b11000000;
   end
1:  begin
        N1 = 8'b11000000;
        N2 = 8'b11111001;
    end
2:  begin
        N1 = 8'b11000000;
        N2 = 8'b10100100;
    end
3:  begin
        N1 = 8'b11000000;
        N2 = 8'b10110000;
    end
4:  begin
        N1 = 8'b11000000;
        N2 = 8'b10011001;
    end
5:  begin
        N1 = 8'b11000000;
        N2 = 8'b10010010;
    end
6:  begin
        N1 = 8'b11000000;
        N2 = 8'b10000010;
    end
7:  begin
        N1 = 8'b11000000;
        N2 = 8'b11111000;
    end
8:  begin
        N1 = 8'b11000000;
        N2 = 8'b10000000;
    end
9:  begin
        N1 = 8'b11000000;
        N2 = 8'b10010000;
    end
10:  begin
        N1 = 8'b11111001;
        N2 = 8'b11000000;
     end
11:  begin
        N1 = 8'b11111001;
        N2 = 8'b11111001;
     end
12:  begin
        N1 = 8'b11111001;
        N2 = 8'b10100100;
     end
13:  begin
        N1 = 8'b11111001;
        N2 = 8'b10110000;
     end
14:  begin
        N1 = 8'b11111001;
        N2 = 8'b10011001;
     end
15:  begin
        N1 = 8'b11111001;
        N2 = 8'b10010010;
     end
16:  begin
        N1 = 8'b11111001;
        N2 = 8'b10000010;
     end
17:  begin
        N1 = 8'b11111001;
        N2 = 8'b11111000;
     end
18:  begin
        N1 = 8'b11111001;
        N2 = 8'b10000000;
     end
19:  begin
        N1 = 8'b11111001;
        N2 = 8'b10010000;
     end
20:  begin
        N1 = 8'b10100100;
        N2 = 8'b11000000;
     end
21:  begin
        N1 = 8'b10100100;
        N2 = 8'b11111001;
     end
22:  begin
        N1 = 8'b10100100;
        N2 = 8'b10100100;
     end
23:  begin
        N1 = 8'b10100100;
        N2 = 8'b10110000;
     end
24:  begin
        N1 = 8'b10100100;
        N2 = 8'b10011001;
     end
25:  begin
     if(C==0)
begin
N1 = 8'b11111111;
 N2 = 8'b11111111;
end
else
    begin
        N1 = 8'b10100100;
        N2 = 8'b10010010;
end
     end
26:  begin
        N1 = 8'b10100100;
        N2 = 8'b10000010;
     end
27:  begin
        N1 = 8'b10100100;
        N2 = 8'b11111000;
     end
28:  begin
        N1 = 8'b10100100;
        N2 = 8'b10000000;
     end
29:  begin
        N1 = 8'b10100100;
        N2 = 8'b10010000;
     end
30:  begin
if(C==0)
begin
N1 = 8'b11111111;
 N2 = 8'b11111111;
end
else
begin       
 N1 = 8'b10110000;
        N2 = 8'b11000000;
end
     end
default: begin
              N1 = 8'b11000000;
              N2 = 8'b11000000;
         end
endcase
endtask


always @(posedge CLK)
if(!RET)
       begin
           M1 = 8'b11111111;
           M0 = 8'b11111111;
           C1 = 8'b11111111;
           C0 = 8'b11111111;
       end
else
       begin
       T = MainNumber;     //set T to MainNumber than display
       led_out(M1, M0);
       T = CountryNumber;  //set T to CountryNumber than display
       led_out(C1, C0);
       end
endmodule
