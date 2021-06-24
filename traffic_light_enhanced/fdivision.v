module fdivision(Fin, Fout);    //  this module is used to get the proper clock

input Fin;
output Fout;
reg Fout;
reg [31:0] division;
parameter N = 10;           //this date is set by the user according to the needed frequency 


initial
begin
     division <= 0;
end

always @(posedge Fin) 
begin
           if(division == (N - 1) )
           begin 
                division <= 0;
                Fout <= ~Fout;
           end
           else
           division <= (division + 1);
      end
endmodule
