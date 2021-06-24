module nixie_tube(RET, CLK, MainCountdown, CountryCountdown, ML, MR, CL, CR,C);
input CLK, RET,C;
input [4:0]MainCountdown, CountryCountdown;
output [7:0]ML, MR, CL, CR;

reg [7:0]ML, MR, CL, CR;
reg [4:0]m;


task display;        
output [7:0]N1, N2;             //this task translate the numJber for LED
case(m)
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
           ML = 8'b11111111;
           MR = 8'b11111111;
           CL = 8'b11111111;
           CR = 8'b11111111;
       end
else
       begin
       m = MainCountdown;     //set T to MainNumber than display
       display(ML, MR);
       m = CountryCountdown;  //set T to CountryNumber than display
       display(CL, CR);
       end
endmodule
