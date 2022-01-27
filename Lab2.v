module moore_FSM(I,clock,reset,O);
input I;
input clock;
input reset;
output reg O;

parameter 
s0 = 3'b000,
s1 = 3'b001,
s2 = 3'b010,
s3 = 3'b011,
s4 = 3'b100;

reg [2:0] CS, NS;
  
always @(posedge clock)
	begin
		if(reset == 1)
			CS <= s0;
		else 
			CS <= NS;
end

always @(CS,I)
	begin
		case(CS)
		s0:begin
			if (I==1)
				NS = s1;
			else 
				NS = s0;
			end
	
	
		s1:begin
			if (I==0)
				NS = s2;
			else
				NS = s1;
			end
	
	
		s2:begin
			if (I==0)
				NS = s3;
			else
				NS = s1;
			end
	
	
		s3:begin
			if (I==1)
				NS = s4;
			else
				NS = s0;
			end
		
		s4:begin
			if(I==1)
				NS = s1;
			else
				NS = s2;
			end
	
	default:NS = s0;
	endcase 


		O = (CS==s4)? 1:0;

	end

endmodule 