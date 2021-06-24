module frequency(F1, F2);    //  this module is used to get the proper clock

input F1;
output F2;
reg F2;
reg [31:0] division;
parameter K =5 ;       //this date is set by the user according to the needed frequency 


initial
begin
     division <= 0;
end

always @(posedge F1) 
begin
           if(division == (K - 1) )
           begin 
                division <= 0;
                F2 <= ~F2;
           end
           else
           division <= (division + 1);
      end
endmodule
