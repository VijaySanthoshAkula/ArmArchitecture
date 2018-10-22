 AREA     appcode, CODE, READONLY
     export __main	 
	 ENTRY 
__main  function
    MOV R0,#0;0 
    MOV R1,#1;1 
	MOV R2,#0x20000000;Fibonaccii series is written from this memory location
    MOV R3,#0;intermediate result holder 
    MOV R4,#10; Number upto which series needs to be generated
    STR R0,[R2],#1;Storing 0 at 0x20000000
	STR R1,[R2],#1;Storing 1 at 0x20000001
    ADD R3,R0,R1;R3 = R0+R1 
loop1 CMP R3,R4;check for max number R4
    BLE loop2;
    B stop;Else goto end  
loop2 STR R3,[R2],#1;pushing the values to memory from R3
    MOV R0,R1;R0=R1 
    MOV R1,R3;R1=R3
    ADD R3,R0,R1;R3 = R0 + R1 
    B loop1;
stop    B stop 
        ENDFUNC 
        END
