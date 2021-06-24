module FSM(C, RET, CLK, MG, MY, MR, CG, CY, CR, T1, T2);

input C, RET, CLK;
output  MG, MY, MR, CG, CY, CR;
output [4:0]T1, T2;

reg MG, MY, MR, CG, CY, CR,F;//G suggest MainGreen��? MY suggest MainYellow
 reg [10:0] G;                          //MR suggest MainRed, CG suggest CountryGreen
                             //CY suggest CountryYellow
                             //CR suggest CountryRed
reg [4:0]T1, T2;    
reg [3:0] state;

parameter s1 = 4'b0001,   // state one:MG, CR
          s2 = 4'b0010,   // state two:MY, CR
          s3 = 4'b0100,   // state three:MR, CG
          s4 = 4'b1000;   // state four:MR, CY
initial
begin
G=525;
end

always @(posedge CLK)
begin

if (!RET)
    begin
    state = s1;
    T1 = 25;
    T2 = 30;
    MG = 1; CR = 1; MY = 0; MR = 0; CG = 0; CY = 0;
    end 
else
    
    case(state)
    s1: 

if(C == 0)
           begin
           T1 = 25;
           T2 = 30;
           end
        else if((C == 1)&&((T1 == 0)||(F==0))&&(G<=500))
           begin
           state = s2;
           T1 = 4;
           T2 = (T2 - 1);
           MY = 1; CR = 1; MG = 0; MR = 0; CG = 0; CY = 0;
           end
        else
           begin 
           state = s1;
           T1 = (T1 - 1);
           T2 = (T2 - 1);
           MG = 1; CR = 1; MY = 0; MR = 0; CG = 0; CY = 0;
           end

    s2: if(T1 == 0)
           begin
           state = s3;
           T1 = 21;
           T2 = 16;
           MR = 1; CG = 1; MG = 0; MY = 0; CR = 0; CY = 0;
           end
        else 
           begin
           state = s2;
           T1 = (T1 - 1);
           T2 = (T2 - 1);
           end
    s3: if(C == 0)
           begin
           state = s4;
           T1 = 5;
           T2 = 5;
           MR = 1; CY = 1; MG = 0; MY = 0; CG = 0; CR = 0; 
           end
        else if(T2 == 0)
           begin
           state = s4;
           T1 = (T1 - 1);
           T2 = 4;
           MR = 1; CY = 1; MG = 0; MY = 0; CG = 0; CR = 0; 
           end
        else
           begin 
           state = s3;
           T1 = (T1 - 1);
           T2 = (T2 - 1);
           end
    s4: if(T2 == 0)
           begin
           state = s1;
           T1 = 25;
           T2 = 30;
           MG = 1; CR = 1; MY = 0; MR = 0; CG = 0; CY = 0;
           end
        else
           begin 
           state = s4;
           T1 = (T1 - 1);
           T2 = (T2 - 1);


           end
    default: 
             begin
             state = s1;
             T1 = 25;
             T2 = 30;
             MG = 1; CR = 1; MY = 0; MR = 0; CG = 0; CY = 0;
             end
    endcase
F=C;
G=(G-1);
end
endmodule
