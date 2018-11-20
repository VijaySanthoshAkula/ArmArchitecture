 AREA     appcode, CODE, READONLY
	 export __main	 
	 ENTRY
EXPNFN    FUNCTION 
	    VCMP.F32 S3,#0;
		ITE LE;
		MOVLE R5,#20;
		MOVGT R5,#100;
        MOV R1,#1;Counting Variable 'i' 
        VLDR.F32 S0,=1;Holding the sum of series elements 's' 
        VLDR.F32 S1,=1;Temp Variable to hold the intermediate series elements 't' 
        VMOV.F32 S2,S3;Holding 'x' Value 
LOOP1    CMP R1,R5;Compare 'i' and 'n'  
        BLE LOOP;if i < n goto LOOP 
		VMOV.F32 S3,S0;
        BX LR;else goto stop 
LOOP      VMUL.F32 S1,S1,S2; t = t*x 
        VMOV.F32 S5,R1;Moving the bit stream in R1('i') to S5(floating point register) 
        VCVT.F32.U32 S5, S5;Converting the bitstream into unsigned fp Number 32 bit 
        VDIV.F32 S1,S1,S5;Divide t by 'i' and store it back in 't' 
        VADD.F32 S0,S0,S1;Finally add 's' to 't' and store it in 's' 
        ADD R1,R1,#1;Increment the counter variable 'i' 
        B LOOP1;Again goto comparision 
		ENDFUNC
		

__main    FUNCTION
	    B Initialize;
Sigmoid	VLDR.F32 S6,=1;
		VADD.F32 S4,S6,S3;
		VDIV.F32 S7,S3,S4;Sigmoid function is stored in S7
		B Decide;
Decide	VLDR.F32 S20 ,=0.5;
		VCMP.F32 S7, S20 ; 
		VMRS.F32 APSR_nzcv,FPSCR ; 
		ITE HI
		MOVHI R0,#1; 
		MOVLS R0,#0; 
		;BL printMsg;		
		B stop;
Weighted_X_Cacl VMLA.F32 S3, S11, S16;
	    VMLA.F32 S3, S12, S17;
		VMLA.F32 S3, S13, S18;
		VADD.F32 S3, S3, S14;
		BL EXPNFN;
		B Sigmoid;
Initialize VLDR.F32 S16,=1 ;X0
		VLDR.F32 S17,=0	;X1
		VLDR.F32 S18,=1	;X2
		ADR.W  R10, OffsetTable;
		MOV R11,#4 ;
		TBB   [R10, R11] ;
Logic_AND VLDR.F32 S11,=-0.1;
		VLDR.F32 S12,=0.2;
		VLDR.F32 S13,=0.2;
		VLDR.F32 S14,=-0.2;
		B Weighted_X_Cacl;
Logic_OR VLDR.F32 S11,=-0.1;
		VLDR.F32 S12,=0.7;
		VLDR.F32 S13,=0.7;
		VLDR.F32 S14,=-0.1;
		B Weighted_X_Cacl;
Logic_NOT VLDR.F32 S11,=0.5;
		VLDR.F32 S12,=-0.7;
		VLDR.F32 S13,=0;
		VLDR.F32 S14,=0.1;
		B Weighted_X_Cacl;
Logic_NAND VLDR.F32 S11,=0.6;
		VLDR.F32 S12,=-0.8;
		VLDR.F32 S13,=-0.8;
		VLDR.F32 S14,=0.3;
		B Weighted_X_Cacl;
Logic_NOR VLDR.F32 S11,=0.5;
		VLDR.F32 S12,=-0.7;
		VLDR.F32 S13,=-0.7;
		VLDR.F32 S14,=0.1;
		B Weighted_X_Cacl;
Logic_XOR VLDR.F32 S11,=-5;
		VLDR.F32 S12,=20;
		VLDR.F32 S13,=10;
		VLDR.F32 S14,=1;
		B Weighted_X_Cacl;
Logic_XNOR VLDR.F32 S11,=-5;
		VLDR.F32 S12,=20;
		VLDR.F32 S13,=10;
		VLDR.F32 S14,=1;
		B Weighted_X_Cacl;
OffsetTable	DCB    0
		DCB    ((Logic_OR-Logic_AND)/2)
		DCB    ((Logic_NOT-Logic_AND)/2)
		DCB    ((Logic_NAND-Logic_AND)/2)
		DCB    ((Logic_NOR-Logic_AND)/2)	
		DCB    ((Logic_XOR-Logic_AND)/2)
		DCB    ((Logic_XNOR-Logic_AND)/2)

		
		;MOV R8,#0x20000000;
		;VSTR.F32 S7,[R8];
		;VLDR.F32 S8,[R8];
stop    B stop 
        ENDFUNC 
        END
