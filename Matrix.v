`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ativ Joshi & Pratik Padalia
// 
// Create Date:    16:58:11 10/06/2016 
// Design Name: 
// Module Name:    Matrix 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Matrix(clk);

input clk;

reg [31:0] matrix [0:49];
reg [31:0] temp32 [0:9];
reg [63:0] temp64 [0:10];
reg error_flag;
reg [2:0] row_no;

initial begin
	$readmemh ("memlist.txt", matrix);
	row_no = 3'b0;
	error_flag = 1'b0;
	#1000;
end

/////////////////////////////////////////////////
//answer is in fixed point decimal
//eg: 0110_0101 is 6.3125[base10] and not 101[base10]

always@(posedge clk)
begin
	if(error_flag==1'b0)
	begin
		if(row_no == 3'b0)
		begin
			if(matrix[0]==0)
			begin
				if(matrix[10]!=0)
				begin
					temp32[0] = matrix[10];
					temp32[1] = matrix[11];
					temp32[2] = matrix[12];
					temp32[3] = matrix[13];
					temp32[4] = matrix[14];
					temp32[5] = matrix[15];
					temp32[6] = matrix[16];
					temp32[7] = matrix[17];
					temp32[8] = matrix[18];
					temp32[9] = matrix[19];
					
					matrix[10] = matrix[0];
					matrix[11] = matrix[1];
					matrix[12] = matrix[2];
					matrix[13] = matrix[3];
					matrix[14] = matrix[4];
					matrix[15] = matrix[5];
					matrix[16] = matrix[6];
					matrix[17] = matrix[7];
					matrix[18] = matrix[8];
					matrix[19] = matrix[9];

					matrix[0] = temp32[0];
					matrix[1] = temp32[1];
					matrix[2] = temp32[2];
					matrix[3] = temp32[3];
					matrix[4] = temp32[4];
					matrix[5] = temp32[5];
					matrix[6] = temp32[6];
					matrix[7] = temp32[7];
					matrix[8] = temp32[8];
					matrix[9] = temp32[9];
				end
					
				else if(matrix[20]!=0)
				begin
					temp32[0] = matrix[20];
					temp32[1] = matrix[21];
					temp32[2] = matrix[22];
					temp32[3] = matrix[23];
					temp32[4] = matrix[24];
					temp32[5] = matrix[25];
					temp32[6] = matrix[26];
					temp32[7] = matrix[27];
					temp32[8] = matrix[28];
					temp32[9] = matrix[29];
					
					matrix[20] = matrix[0];
					matrix[21] = matrix[1];
					matrix[22] = matrix[2];
					matrix[23] = matrix[3];
					matrix[24] = matrix[4];
					matrix[25] = matrix[5];
					matrix[26] = matrix[6];
					matrix[27] = matrix[7];
					matrix[28] = matrix[8];
					matrix[29] = matrix[9];

					matrix[0] = temp32[0];
					matrix[1] = temp32[1];
					matrix[2] = temp32[2];
					matrix[3] = temp32[3];
					matrix[4] = temp32[4];
					matrix[5] = temp32[5];
					matrix[6] = temp32[6];
					matrix[7] = temp32[7];
					matrix[8] = temp32[8];
					matrix[9] = temp32[9];
				end
					
				else if(matrix[30]!=0)
				begin
					temp32[0] = matrix[30];
					temp32[1] = matrix[31];
					temp32[2] = matrix[32];
					temp32[3] = matrix[33];
					temp32[4] = matrix[34];
					temp32[5] = matrix[35];
					temp32[6] = matrix[36];
					temp32[7] = matrix[37];
					temp32[8] = matrix[38];
					temp32[9] = matrix[39];
					
					matrix[30] = matrix[0];
					matrix[31] = matrix[1];
					matrix[32] = matrix[2];
					matrix[33] = matrix[3];
					matrix[34] = matrix[4];
					matrix[35] = matrix[5];
					matrix[36] = matrix[6];
					matrix[37] = matrix[7];
					matrix[38] = matrix[8];
					matrix[39] = matrix[9];

					matrix[0] = temp32[0];
					matrix[1] = temp32[1];
					matrix[2] = temp32[2];
					matrix[3] = temp32[3];
					matrix[4] = temp32[4];
					matrix[5] = temp32[5];
					matrix[6] = temp32[6];
					matrix[7] = temp32[7];
					matrix[8] = temp32[8];
					matrix[9] = temp32[9];
				end

				else if(matrix[40]!=0)
				begin
					temp32[0] = matrix[40];
					temp32[1] = matrix[41];
					temp32[2] = matrix[42];
					temp32[3] = matrix[43];
					temp32[4] = matrix[44];
					temp32[5] = matrix[45];
					temp32[6] = matrix[46];
					temp32[7] = matrix[47];
					temp32[8] = matrix[48];
					temp32[9] = matrix[49];
					
					matrix[40] = matrix[0];
					matrix[41] = matrix[1];
					matrix[42] = matrix[2];
					matrix[43] = matrix[3];
					matrix[44] = matrix[4];
					matrix[45] = matrix[5];
					matrix[46] = matrix[6];
					matrix[47] = matrix[7];
					matrix[48] = matrix[8];
					matrix[49] = matrix[9];

					matrix[0] = temp32[0];
					matrix[1] = temp32[1];
					matrix[2] = temp32[2];
					matrix[3] = temp32[3];
					matrix[4] = temp32[4];
					matrix[5] = temp32[5];
					matrix[6] = temp32[6];
					matrix[7] = temp32[7];
					matrix[8] = temp32[8];
					matrix[9] = temp32[9];
				end
				
				else
					error_flag=1'b1;
			end//end of if(matrix[0]==0)
			
			else
			begin
				//calculation
				temp64[0] = matrix[0]<<16;
				temp64[10] = (matrix[10]<<16);
				temp64[1] = (((matrix[1]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[2]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[3]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[4]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[5]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[6]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[7]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[8]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[9]<<32)/temp64[0])*temp64[10])>>32;
				
				matrix[11] = matrix[11] - temp64[1];
				matrix[12] = matrix[12] - temp64[2];
				matrix[13] = matrix[13] - temp64[3];
				matrix[14] = matrix[14] - temp64[4];
				matrix[15] = matrix[15] - temp64[5];
				matrix[16] = matrix[16] - temp64[6];
				matrix[17] = matrix[17] - temp64[7];
				matrix[18] = matrix[18] - temp64[8];
				matrix[19] = matrix[19] - temp64[9];
				matrix[10] = 0;
				
				temp64[0] = matrix[0]<<16;
				temp64[10] = (matrix[20]<<16);
				temp64[1] = (((matrix[1]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[2]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[3]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[4]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[5]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[6]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[7]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[8]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[9]<<32)/temp64[0])*temp64[10])>>32;
				
				matrix[21] = matrix[21] - temp64[1];
				matrix[22] = matrix[22] - temp64[2];
				matrix[23] = matrix[23] - temp64[3];
				matrix[24] = matrix[24] - temp64[4];
				matrix[25] = matrix[25] - temp64[5];
				matrix[26] = matrix[26] - temp64[6];
				matrix[27] = matrix[27] - temp64[7];
				matrix[28] = matrix[28] - temp64[8];
				matrix[29] = matrix[29] - temp64[9];
				matrix[20] = 0;
				
				temp64[0] = matrix[0]<<16;
				temp64[10] = (matrix[30]<<16);
				temp64[1] = (((matrix[1]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[2]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[3]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[4]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[5]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[6]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[7]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[8]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[9]<<32)/temp64[0])*temp64[10])>>32;

				matrix[31] = matrix[31] - temp64[1];
				matrix[32] = matrix[32] - temp64[2];
				matrix[33] = matrix[33] - temp64[3];
				matrix[34] = matrix[34] - temp64[4];
				matrix[35] = matrix[35] - temp64[5];
				matrix[36] = matrix[36] - temp64[6];
				matrix[37] = matrix[37] - temp64[7];
				matrix[38] = matrix[38] - temp64[8];
				matrix[39] = matrix[39] - temp64[9];
				matrix[30] = 0;
				
				temp64[0] = matrix[0]<<16;
				temp64[10] = (matrix[40]<<16);
				temp64[1] = (((matrix[1]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[2]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[3]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[4]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[5]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[6]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[7]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[8]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[9]<<32)/temp64[0])*temp64[10])>>32;

				matrix[41] = matrix[41] - temp64[1];
				matrix[42] = matrix[42] - temp64[2];
				matrix[43] = matrix[43] - temp64[3];
				matrix[44] = matrix[44] - temp64[4];
				matrix[45] = matrix[45] - temp64[5];
				matrix[46] = matrix[46] - temp64[6];
				matrix[47] = matrix[47] - temp64[7];
				matrix[48] = matrix[48] - temp64[8];
				matrix[49] = matrix[49] - temp64[9];
				matrix[40] = 0;
				
				row_no = 3'b001;
			end//end of else matrix[0]==0
		end//end of if(row_no==3'b0)

		else if(row_no == 3'b001)
		begin
			if(matrix[11]==0)
			begin
				if(matrix[21]!=0)
				begin
					temp32[0] = matrix[20];
					temp32[1] = matrix[21];
					temp32[2] = matrix[22];
					temp32[3] = matrix[23];
					temp32[4] = matrix[24];
					temp32[5] = matrix[25];
					temp32[6] = matrix[26];
					temp32[7] = matrix[27];
					temp32[8] = matrix[28];
					temp32[9] = matrix[29];
					
					matrix[20] = matrix[10];
					matrix[21] = matrix[11];
					matrix[22] = matrix[12];
					matrix[23] = matrix[13];
					matrix[24] = matrix[14];
					matrix[25] = matrix[15];
					matrix[26] = matrix[16];
					matrix[27] = matrix[17];
					matrix[28] = matrix[18];
					matrix[29] = matrix[19];

					matrix[10] = temp32[0];
					matrix[11] = temp32[1];
					matrix[12] = temp32[2];
					matrix[13] = temp32[3];
					matrix[14] = temp32[4];
					matrix[15] = temp32[5];
					matrix[16] = temp32[6];
					matrix[17] = temp32[7];
					matrix[18] = temp32[8];
					matrix[19] = temp32[9];
				end
					
				else if(matrix[30]!=0)
				begin
					temp32[0] = matrix[30];
					temp32[1] = matrix[31];
					temp32[2] = matrix[32];
					temp32[3] = matrix[33];
					temp32[4] = matrix[34];
					temp32[5] = matrix[35];
					temp32[6] = matrix[36];
					temp32[7] = matrix[37];
					temp32[8] = matrix[38];
					temp32[9] = matrix[39];
					
					matrix[30] = matrix[10];
					matrix[31] = matrix[11];
					matrix[32] = matrix[12];
					matrix[33] = matrix[13];
					matrix[34] = matrix[14];
					matrix[35] = matrix[15];
					matrix[36] = matrix[16];
					matrix[37] = matrix[17];
					matrix[38] = matrix[18];
					matrix[39] = matrix[19];

					matrix[10] = temp32[0];
					matrix[11] = temp32[1];
					matrix[12] = temp32[2];
					matrix[13] = temp32[3];
					matrix[14] = temp32[4];
					matrix[15] = temp32[5];
					matrix[16] = temp32[6];
					matrix[17] = temp32[7];
					matrix[18] = temp32[8];
					matrix[19] = temp32[9];
				end

				else if(matrix[40]!=0)
				begin
					temp32[0] = matrix[40];
					temp32[1] = matrix[41];
					temp32[2] = matrix[42];
					temp32[3] = matrix[43];
					temp32[4] = matrix[44];
					temp32[5] = matrix[45];
					temp32[6] = matrix[46];
					temp32[7] = matrix[47];
					temp32[8] = matrix[48];
					temp32[9] = matrix[49];
					
					matrix[40] = matrix[10];
					matrix[41] = matrix[11];
					matrix[42] = matrix[12];
					matrix[43] = matrix[13];
					matrix[44] = matrix[14];
					matrix[45] = matrix[15];
					matrix[46] = matrix[16];
					matrix[47] = matrix[17];
					matrix[48] = matrix[18];
					matrix[49] = matrix[19];

					matrix[10] = temp32[0];
					matrix[11] = temp32[1];
					matrix[12] = temp32[2];
					matrix[13] = temp32[3];
					matrix[14] = temp32[4];
					matrix[15] = temp32[5];
					matrix[16] = temp32[6];
					matrix[17] = temp32[7];
					matrix[18] = temp32[8];
					matrix[19] = temp32[9];
				end
				
				else
					error_flag=1'b1;
			end//end of if(matrix[11]==0)
			
			else
			begin
				//calculation
				temp64[0] = matrix[11]<<16;
				temp64[10] = (matrix[1]<<16);
				temp64[1] = (((matrix[11]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[12]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[13]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[14]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[15]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[16]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[17]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[18]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[19]<<32)/temp64[0])*temp64[10])>>32;
				
				matrix[2] = matrix[2] - temp64[2];
				matrix[3] = matrix[3] - temp64[3];
				matrix[4] = matrix[4] - temp64[4];
				matrix[5] = matrix[5] - temp64[5];
				matrix[6] = matrix[6] - temp64[6];
				matrix[7] = matrix[7] - temp64[7];
				matrix[8] = matrix[8] - temp64[8];
				matrix[9] = matrix[9] - temp64[9];
				matrix[1] = 0;
				
				temp64[0] = matrix[11]<<16;
				temp64[10] = (matrix[21]<<16);
				temp64[1] = (((matrix[11]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[12]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[13]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[14]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[15]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[16]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[17]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[18]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[19]<<32)/temp64[0])*temp64[10])>>32;

				matrix[22] = matrix[22] - temp64[2];
				matrix[23] = matrix[23] - temp64[3];
				matrix[24] = matrix[24] - temp64[4];
				matrix[25] = matrix[25] - temp64[5];
				matrix[26] = matrix[26] - temp64[6];
				matrix[27] = matrix[27] - temp64[7];
				matrix[28] = matrix[28] - temp64[8];
				matrix[29] = matrix[29] - temp64[9];
				matrix[21] = 0;
				
				temp64[0] = matrix[11]<<16;
				temp64[10] = (matrix[31]<<16);
				temp64[1] = (((matrix[11]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[12]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[13]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[14]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[15]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[16]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[17]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[18]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[19]<<32)/temp64[0])*temp64[10])>>32;

				matrix[32] = matrix[32] - temp64[2];
				matrix[33] = matrix[33] - temp64[3];
				matrix[34] = matrix[34] - temp64[4];
				matrix[35] = matrix[35] - temp64[5];
				matrix[36] = matrix[36] - temp64[6];
				matrix[37] = matrix[37] - temp64[7];
				matrix[38] = matrix[38] - temp64[8];
				matrix[39] = matrix[39] - temp64[9];
				matrix[31] = 0;
				
				temp64[0] = matrix[11]<<16;
				temp64[10] = (matrix[41]<<16);
				temp64[1] = (((matrix[11]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[12]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[13]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[14]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[15]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[16]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[17]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[18]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[19]<<32)/temp64[0])*temp64[10])>>32;

				matrix[42] = matrix[42] - temp64[2];
				matrix[43] = matrix[43] - temp64[3];
				matrix[44] = matrix[44] - temp64[4];
				matrix[45] = matrix[45] - temp64[5];
				matrix[46] = matrix[46] - temp64[6];
				matrix[47] = matrix[47] - temp64[7];
				matrix[48] = matrix[48] - temp64[8];
				matrix[49] = matrix[49] - temp64[9];
				matrix[41] = 0;
				
				row_no = 3'b010;
			end//end of else matrix[11]==0
		end//end of if(row_no==3'b001)
		
		else if(row_no == 3'b010)
		begin
			if(matrix[22]==0)
			begin					
				if(matrix[32]!=0)
				begin
					temp32[0] = matrix[30];
					temp32[1] = matrix[31];
					temp32[2] = matrix[32];
					temp32[3] = matrix[33];
					temp32[4] = matrix[34];
					temp32[5] = matrix[35];
					temp32[6] = matrix[36];
					temp32[7] = matrix[37];
					temp32[8] = matrix[38];
					temp32[9] = matrix[39];
					
					matrix[30] = matrix[20];
					matrix[31] = matrix[21];
					matrix[32] = matrix[22];
					matrix[33] = matrix[23];
					matrix[34] = matrix[24];
					matrix[35] = matrix[25];
					matrix[36] = matrix[26];
					matrix[37] = matrix[27];
					matrix[38] = matrix[28];
					matrix[39] = matrix[29];

					matrix[20] = temp32[0];
					matrix[21] = temp32[1];
					matrix[22] = temp32[2];
					matrix[23] = temp32[3];
					matrix[24] = temp32[4];
					matrix[25] = temp32[5];
					matrix[26] = temp32[6];
					matrix[27] = temp32[7];
					matrix[28] = temp32[8];
					matrix[29] = temp32[9];
				end

				else if(matrix[40]!=0)
				begin
					temp32[0] = matrix[40];
					temp32[1] = matrix[41];
					temp32[2] = matrix[42];
					temp32[3] = matrix[43];
					temp32[4] = matrix[44];
					temp32[5] = matrix[45];
					temp32[6] = matrix[46];
					temp32[7] = matrix[47];
					temp32[8] = matrix[48];
					temp32[9] = matrix[49];
					
					matrix[40] = matrix[20];
					matrix[41] = matrix[21];
					matrix[42] = matrix[22];
					matrix[43] = matrix[23];
					matrix[44] = matrix[24];
					matrix[45] = matrix[25];
					matrix[46] = matrix[26];
					matrix[47] = matrix[27];
					matrix[48] = matrix[28];
					matrix[49] = matrix[29];

					matrix[20] = temp32[0];
					matrix[21] = temp32[1];
					matrix[22] = temp32[2];
					matrix[23] = temp32[3];
					matrix[24] = temp32[4];
					matrix[25] = temp32[5];
					matrix[26] = temp32[6];
					matrix[27] = temp32[7];
					matrix[28] = temp32[8];
					matrix[29] = temp32[9];
				end
				
				else
					error_flag=1'b1;
			end//end of if(matrix[11]==0)
			
			else
			begin
				//calculation
				temp64[0] = matrix[22]<<16;
				temp64[10] = (matrix[2]<<16);
				temp64[1] = (((matrix[21]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[22]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[23]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[24]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[25]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[26]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[27]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[28]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[29]<<32)/temp64[0])*temp64[10])>>32;

				matrix[3] = matrix[3] - temp64[3];
				matrix[4] = matrix[4] - temp64[4];
				matrix[5] = matrix[5] - temp64[5];
				matrix[6] = matrix[6] - temp64[6];
				matrix[7] = matrix[7] - temp64[7];
				matrix[8] = matrix[8] - temp64[8];
				matrix[9] = matrix[9] - temp64[9];
				matrix[2] = 0;
				
				temp64[0] = matrix[22]<<16;
				temp64[10] = (matrix[12]<<16);
				temp64[1] = (((matrix[21]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[22]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[23]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[24]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[25]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[26]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[27]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[28]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[29]<<32)/temp64[0])*temp64[10])>>32;

				matrix[13] = matrix[13] - temp64[3];
				matrix[14] = matrix[14] - temp64[4];
				matrix[15] = matrix[15] - temp64[5];
				matrix[16] = matrix[16] - temp64[6];
				matrix[17] = matrix[17] - temp64[7];
				matrix[18] = matrix[18] - temp64[8];
				matrix[19] = matrix[19] - temp64[9];
				matrix[12] = 0;
				
				temp64[0] = matrix[22]<<16;
				temp64[10] = (matrix[32]<<16);
				temp64[1] = (((matrix[21]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[22]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[23]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[24]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[25]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[26]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[27]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[28]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[29]<<32)/temp64[0])*temp64[10])>>32;

				matrix[33] = matrix[33] - temp64[3];
				matrix[34] = matrix[34] - temp64[4];
				matrix[35] = matrix[35] - temp64[5];
				matrix[36] = matrix[36] - temp64[6];
				matrix[37] = matrix[37] - temp64[7];
				matrix[38] = matrix[38] - temp64[8];
				matrix[39] = matrix[39] - temp64[9];
				matrix[32] = 0;
				
				temp64[0] = matrix[22]<<16;
				temp64[10] = (matrix[42]<<16);
				temp64[1] = (((matrix[21]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[22]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[23]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[24]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[25]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[26]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[27]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[28]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[29]<<32)/temp64[0])*temp64[10])>>32;

				matrix[43] = matrix[43] - temp64[3];
				matrix[44] = matrix[44] - temp64[4];
				matrix[45] = matrix[45] - temp64[5];
				matrix[46] = matrix[46] - temp64[6];
				matrix[47] = matrix[47] - temp64[7];
				matrix[48] = matrix[48] - temp64[8];
				matrix[49] = matrix[49] - temp64[9];
				matrix[42] = 0;
				
				row_no = 3'b011;
			end//end of else matrix[22]==0
		end//end of if(row_no==3'b010)
		
		
		else if(row_no == 3'b011)
		begin
			if(matrix[33]==0)
			begin
				if(matrix[43]!=0)
				begin
					temp32[0] = matrix[40];
					temp32[1] = matrix[41];
					temp32[2] = matrix[42];
					temp32[3] = matrix[43];
					temp32[4] = matrix[44];
					temp32[5] = matrix[45];
					temp32[6] = matrix[46];
					temp32[7] = matrix[47];
					temp32[8] = matrix[48];
					temp32[9] = matrix[49];
					
					matrix[40] = matrix[30];
					matrix[41] = matrix[31];
					matrix[42] = matrix[32];
					matrix[43] = matrix[33];
					matrix[44] = matrix[34];
					matrix[45] = matrix[35];
					matrix[46] = matrix[36];
					matrix[47] = matrix[37];
					matrix[48] = matrix[38];
					matrix[49] = matrix[39];

					matrix[30] = temp32[0];
					matrix[31] = temp32[1];
					matrix[32] = temp32[2];
					matrix[33] = temp32[3];
					matrix[34] = temp32[4];
					matrix[35] = temp32[5];
					matrix[36] = temp32[6];
					matrix[37] = temp32[7];
					matrix[38] = temp32[8];
					matrix[39] = temp32[9];
				end
				
				else
					error_flag=1'b1;
			end//end of if(matrix[31]==0)
			
			else
			begin
				//calculation
				temp64[0] = matrix[33]<<16;
				temp64[10] = (matrix[3]<<16);
				temp64[1] = (((matrix[31]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[32]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[33]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[34]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[35]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[36]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[37]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[38]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[39]<<32)/temp64[0])*temp64[10])>>32;

				matrix[4] = matrix[4] - temp64[4];
				matrix[5] = matrix[5] - temp64[5];
				matrix[6] = matrix[6] - temp64[6];
				matrix[7] = matrix[7] - temp64[7];
				matrix[8] = matrix[8] - temp64[8];
				matrix[9] = matrix[9] - temp64[9];
				matrix[3] = 0;
				
				temp64[0] = matrix[33]<<16;
				temp64[10] = (matrix[13]<<16);
				temp64[1] = (((matrix[31]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[32]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[33]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[34]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[35]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[36]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[37]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[38]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[39]<<32)/temp64[0])*temp64[10])>>32;

				matrix[14] = matrix[14] - temp64[4];
				matrix[15] = matrix[15] - temp64[5];
				matrix[16] = matrix[16] - temp64[6];
				matrix[17] = matrix[17] - temp64[7];
				matrix[18] = matrix[18] - temp64[8];
				matrix[19] = matrix[19] - temp64[9];
				matrix[13] = 0;
				
				temp64[0] = matrix[33]<<16;
				temp64[10] = (matrix[23]<<16);
				temp64[1] = (((matrix[31]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[32]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[33]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[34]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[35]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[36]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[37]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[38]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[39]<<32)/temp64[0])*temp64[10])>>32;

				matrix[24] = matrix[24] - temp64[4];
				matrix[25] = matrix[25] - temp64[5];
				matrix[26] = matrix[26] - temp64[6];
				matrix[27] = matrix[27] - temp64[7];
				matrix[28] = matrix[28] - temp64[8];
				matrix[29] = matrix[29] - temp64[9];
				matrix[23] = 0;
				
				temp64[0] = matrix[33]<<16;
				temp64[10] = (matrix[43]<<16);
				temp64[1] = (((matrix[31]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[32]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[33]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[34]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[35]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[36]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[37]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[38]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[39]<<32)/temp64[0])*temp64[10])>>32;

				matrix[44] = matrix[44] - temp64[4];
				matrix[45] = matrix[45] - temp64[5];
				matrix[46] = matrix[46] - temp64[6];
				matrix[47] = matrix[47] - temp64[7];
				matrix[48] = matrix[48] - temp64[8];
				matrix[49] = matrix[49] - temp64[9];
				matrix[43] = 0;
				
				row_no = 3'b100;
			end//end of else matrix[33]==0
		end//end of if(row_no==3'b011)
		
		else if(row_no == 3'b100)
		begin
			if(matrix[44]==0)
			begin
				error_flag=1'b1;
			end//end of if(matrix[31]==0)
			
			else
			begin
				//calculation
				temp64[0] = matrix[44]<<16;
				temp64[10] = (matrix[4]<<16);
				temp64[1] = (((matrix[41]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[42]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[43]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[44]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[45]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[46]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[47]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[48]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[49]<<32)/temp64[0])*temp64[10])>>32;

				matrix[5] = matrix[5] - temp64[5];
				matrix[6] = matrix[6] - temp64[6];
				matrix[7] = matrix[7] - temp64[7];
				matrix[8] = matrix[8] - temp64[8];
				matrix[9] = matrix[9] - temp64[9];
				matrix[4] = 0;
				
				temp64[0] = matrix[44]<<16;
				temp64[10] = (matrix[14]<<16);
				temp64[1] = (((matrix[41]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[42]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[43]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[44]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[45]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[46]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[47]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[48]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[49]<<32)/temp64[0])*temp64[10])>>32;

				matrix[15] = matrix[15] - temp64[5];
				matrix[16] = matrix[16] - temp64[6];
				matrix[17] = matrix[17] - temp64[7];
				matrix[18] = matrix[18] - temp64[8];
				matrix[19] = matrix[19] - temp64[9];
				matrix[14] = 0;
				
				temp64[0] = matrix[44]<<16;
				temp64[10] = (matrix[24]<<16);
				temp64[1] = (((matrix[41]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[42]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[43]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[44]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[45]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[46]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[47]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[48]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[49]<<32)/temp64[0])*temp64[10])>>32;

				matrix[25] = matrix[25] - temp64[5];
				matrix[26] = matrix[26] - temp64[6];
				matrix[27] = matrix[27] - temp64[7];
				matrix[28] = matrix[28] - temp64[8];
				matrix[29] = matrix[29] - temp64[9];
				matrix[24] = 0;
								
				temp64[0] = matrix[44]<<16;
				temp64[10] = (matrix[34]<<16);
				temp64[1] = (((matrix[41]<<32)/temp64[0])*temp64[10])>>32;
				temp64[2] = (((matrix[42]<<32)/temp64[0])*temp64[10])>>32;
				temp64[3] = (((matrix[43]<<32)/temp64[0])*temp64[10])>>32;
				temp64[4] = (((matrix[44]<<32)/temp64[0])*temp64[10])>>32;
				temp64[5] = (((matrix[45]<<32)/temp64[0])*temp64[10])>>32;
				temp64[6] = (((matrix[46]<<32)/temp64[0])*temp64[10])>>32;
				temp64[7] = (((matrix[47]<<32)/temp64[0])*temp64[10])>>32;
				temp64[8] = (((matrix[48]<<32)/temp64[0])*temp64[10])>>32;
				temp64[9] = (((matrix[49]<<32)/temp64[0])*temp64[10])>>32;

				matrix[35] = matrix[35] - temp64[5];
				matrix[36] = matrix[36] - temp64[6];
				matrix[37] = matrix[37] - temp64[7];
				matrix[38] = matrix[38] - temp64[8];
				matrix[39] = matrix[39] - temp64[9];
				matrix[34] = 0;
				
				row_no = 3'b101;
			end//end of else matrix[44]==0
		end//end of if(row_no==3'b100)

		else if(row_no == 3'b101)
		begin
			temp64[0] = matrix[0]<<16;
			temp64[1] = ((matrix[5]<<32)/temp64[0])>>16;
			temp64[2] = ((matrix[6]<<32)/temp64[0])>>16;
			temp64[3] = ((matrix[7]<<32)/temp64[0])>>16;
			temp64[4] = ((matrix[8]<<32)/temp64[0])>>16;
			temp64[5] = ((matrix[9]<<32)/temp64[0])>>16;
			
			matrix[0] = 32'h0001_0000;
			matrix[5] = temp64[1];
			matrix[6] = temp64[2];
			matrix[7] = temp64[3];
			matrix[8] = temp64[4];
			matrix[9] = temp64[5];
			
			temp64[0] = matrix[11]<<16;
			temp64[1] = ((matrix[15]<<32)/temp64[0])>>16;
			temp64[2] = ((matrix[16]<<32)/temp64[0])>>16;
			temp64[3] = ((matrix[17]<<32)/temp64[0])>>16;
			temp64[4] = ((matrix[18]<<32)/temp64[0])>>16;
			temp64[5] = ((matrix[19]<<32)/temp64[0])>>16;
			
			matrix[11] = 32'h0001_0000;
			matrix[15] = temp64[1];
			matrix[16] = temp64[2];
			matrix[17] = temp64[3];
			matrix[18] = temp64[4];
			matrix[19] = temp64[5];

			temp64[0] = matrix[22]<<16;
			temp64[1] = ((matrix[25]<<32)/temp64[0])>>16;
			temp64[2] = ((matrix[26]<<32)/temp64[0])>>16;
			temp64[3] = ((matrix[27]<<32)/temp64[0])>>16;
			temp64[4] = ((matrix[28]<<32)/temp64[0])>>16;
			temp64[5] = ((matrix[29]<<32)/temp64[0])>>16;
			
			matrix[22] = 32'h0001_0000;
			matrix[25] = temp64[1];
			matrix[26] = temp64[2];
			matrix[27] = temp64[3];
			matrix[28] = temp64[4];
			matrix[29] = temp64[5];

			temp64[0] = matrix[33]<<16;
			temp64[1] = ((matrix[35]<<32)/temp64[0])>>16;
			temp64[2] = ((matrix[36]<<32)/temp64[0])>>16;
			temp64[3] = ((matrix[37]<<32)/temp64[0])>>16;
			temp64[4] = ((matrix[38]<<32)/temp64[0])>>16;
			temp64[5] = ((matrix[39]<<32)/temp64[0])>>16;
			
			matrix[33] = 32'h0001_0000;
			matrix[35] = temp64[1];
			matrix[36] = temp64[2];
			matrix[37] = temp64[3];
			matrix[38] = temp64[4];
			matrix[39] = temp64[5];

			temp64[0] = matrix[44]<<16;
			temp64[1] = ((matrix[45]<<32)/temp64[0])>>16;
			temp64[2] = ((matrix[46]<<32)/temp64[0])>>16;
			temp64[3] = ((matrix[47]<<32)/temp64[0])>>16;
			temp64[4] = ((matrix[48]<<32)/temp64[0])>>16;
			temp64[5] = ((matrix[49]<<32)/temp64[0])>>16;
			
			matrix[44] = 32'h0001_0000;
			matrix[45] = temp64[1];
			matrix[46] = temp64[2];
			matrix[47] = temp64[3];
			matrix[48] = temp64[4];
			matrix[49] = temp64[5];

			row_no = 3'b111;
		end//end of if(row_no==3'b100)

	end//end of if(!error_flag)
end//end of always

endmodule
