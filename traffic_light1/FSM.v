module FSM(C, RET, CLK, MG, MY, MRR, CG, CY, CRR, T1, T2);

input C, RET, CLK;
output  MG, MY, MRR, CG, CY, CRR;
output [4:0]T1, T2;

reg MG, MY, MRR, CG, CY, CRR,F;//G suggest MainGreen¡ê? MY suggest MainYellow
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
G=512;
end
/**/

always @(posedge CLK)
begin

if (!RET)
    begin
    state = s1;
    T1 = 25;
    T2 = 30;
    MG = 1; CRR = 1; MY = 0; MRR = 0; CG = 0; CY = 0;
    end 
else
    
    case(state)
    s1: 

if(C == 0)
           begin
           T1 = 25;
           T2 = 30;
           MG = 1; CRR = 1; MY = 0; MRR = 0; CG = 0; CY = 0;
           end
        else if((C == 1)&&((T1 == 0)||(F==0))&&(G<=487))
           begin
           state = s2;
           T1 = 4;
           T2 = (T2 - 1);
           MY = 1; CRR = 1; MG = 0; MRR = 0; CG = 0; CY = 0;
           end
        else
           begin 
           state = s1;
           T1 = (T1 - 1);
           T2 = (T2 - 1);
           MG = 1; CRR= 1; MY = 0; MRR= 0; CG = 0; CY = 0;
           end

    s2: if(T1 == 0)
           begin
           state = s3;
           T1 = 21;
           T2 = 16;
           MRR = 1; CG = 1; MG = 0; MY = 0; CRR = 0; CY = 0;
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
           MRR = 1; CY = 1; MG = 0; MY = 0; CG = 0; CRR = 0; 
           end
        else if(T2 == 0)
           begin
           state = s4;
           T1 = (T1 - 1);
           T2 = 4;
           MRR = 1; CY = 1; MG = 0; MY = 0; CG = 0; CRR = 0; 
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
           MG = 1; CRR = 1; MY = 0; MRR = 0; CG = 0; CY = 0;
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
             MG = 1; CRR = 1; MY = 0; MRR = 0; CG = 0; CY = 0;
             end
    endcase
F=C;
G=(G-1);
end
endmodule
