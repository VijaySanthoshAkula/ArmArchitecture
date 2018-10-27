 AREA     appcode, CODE, READONLY
     export __main	 
	 ENTRY 
__main  function
	    VLDR.F32 S3,=2;Value of X float number
        MOV R2,#2;'n' Number of terms in series
        VLDR.F32 S4,=1;intermedite term holding variable. Value is float
		VLDR.F32 S5,=1;final sum of exponential series for n elements, value is float.
		MOV R3,#1;LPBGN counter m 
        
LPBGN    CMP R3,R2;Compare 'm' and 'n'  
        BLE STEP;if m < n goto STEP 
        B stop;
		
STEP      VMUL.F32 S4,S4,S3; S4 = S4*S3 Multiply the intermedite term with Value Of X
        VMOV.F32 S1,R3;The contents of an ARM core register R1 to a single-precision register S5.
        VCVT.F32.U32 S1, S1; U32 is for unsigned . Converts a value in a register from floating-point to a 32-bit integer. 
        VDIV.F32 S4,S4,S1;s4=s4/m 
        VADD.F32 S5,S5,S4;Sum of exponential series upto 'm' elements
        ADD R3,R3,#1;Increment the counter variable 'm' 
        B LPBGN;GOTO Beginning of loop 
		
stop    B stop 
        ENDFUNC 
        END