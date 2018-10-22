 AREA     appcode, CODE, READONLY
     export __main	 
	 ENTRY 
__main  function
	          MOV r3,#9; First number
			  MOV r4,#5; Second number
			  MOV r6,#0; GCD
loop          CMP r3, r4; Compare of while loop to find are r3,r4 Equal
              BNE IFCNDNTN;if not equals goto IFCNDNTN 
			  MOV r6,r3; r6 contains GCD of r3,r4
              B stop; Else goto end  
IFCNDNTN      CMP r3, r4; Compare to find which is largest b/w r3,r4
              ITE LT ;
			  SUBLT r4, r4, r3 ; 
              SUBGE r3, r3,r4; 
			  B loop ; this will redirect to starting of while loop
stop        B stop  ; stop program
        endfunc
      end
