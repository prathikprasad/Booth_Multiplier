module BoothMulti(X, Y, Z);
input signed [7:0] X, Y;
output signed [15:0] Z;
reg signed [15:0] Z;
reg [1:0] temp;
integer i;
reg E1;
reg [7:0] Y1;
always @ (X, Y)
begin
Z = 16'd0;
E1 = 1'd0;
for (i = 0; i < 4; i = i + 1)
begin
temp = {X[i], E1};
Y1 = - Y;
case (temp)
2'd2 : Z [15 : 7] = Z [15 : 7] + Y
2'd1 : Z [15: 7] = Z [15 : 7] + Y;
default : begin end
endcase
Z = Z >> 1;
Z[15] = Z[14];
E1 = X[i];
end
if (Y == 8'd16)
begin
Z = - Z;
end
end
endmodule