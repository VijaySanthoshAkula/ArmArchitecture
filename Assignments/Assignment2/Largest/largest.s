 AREA     appcode, CODE, READONLY
     export __main	 
	 ENTRY 
__main  function
	          MOV r3,#-2; First number
			  MOV r4,#9; Second number
			  MOV r5,#8; Third Number
			  MOV r6,#0; Largest Number is stored in this register
              CMP r3, r4; First Compare Function to find which is largest b/w r3,r4
              ITE LT ;
              MOVLT r6, r4; Largest of r3,r4 is stored in r6
              MOVGE r6, r3; Largest of r3,r4 is stored in r6
			  CMP r6, r5 ;Second Compare Function to find which is largest b/w r6,r5
              ITE LT
              MOVLT r6, r5 ;Largest Number is stored in r6
              MOVGE r6, r6;Largest Number is stored in r6
stop        B stop  ; stop program
        endfunc
      end
