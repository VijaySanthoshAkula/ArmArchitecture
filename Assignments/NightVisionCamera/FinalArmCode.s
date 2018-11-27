 AREA     appcode, CODE, READONLY
     export __main	 
	 ENTRY 
ParityCheck    FUNCTION 
	  MOV     r4,#1
	  LSL     r5,r4,#0;
	  AND    r6, r0, r5;Extracting p1
	  cmp     r6,#0
	  ITE     GT
	  MOVGT    r6,#1;
	  MOVLE    r6,#0;
	  LSL     r5,r4,#2;
	  AND    r7, r0, r5;Extracting do
	  cmp     r7,#0
	  ITE     GT
	  MOVGT    r7,#1;
	  MOVLE    r7,#0;
	  LSL     r5,r4,#4;
	  AND    r8, r0, r5;Extracting d1
	  cmp     r8,#0
	  ITE     GT
	  MOVGT    r8,#1;
	  MOVLE    r8,#0;
	  LSL     r5,r4,#6;
	  AND    r9, r0, r5;Extracting d3
	  cmp     r9,#0
	  ITE     GT
	  MOVGT    r9,#1;
	  MOVLE    r9,#0;
	  LSL     r5,r4,#8;
	  AND    r10, r0, r5;Extracting d4
	  cmp     r10,#0
	  ITE     GT
	  MOVGT    r10,#1;
	  MOVLE    r10,#0;
	   LSL     r5,r4,#10;
	  AND    r11, r0, r5;Extracting d6
	  cmp     r11,#0
	  ITE     GT
	  MOVGT    r11,#1;
	  MOVLE    r11,#0;
	  EORS    r1,r7,r6;
	  EORS    r1,r1,r8;
	  EORS    r1,r1,r9;
	  EORS    r1,r1,r10;
	  EORS    r1,r1,r11;C1 value is computed
	  LSL     r5,r4,#1;
	  AND    r6, r0, r5;Extracting p2
	  cmp     r6,#0
	  ITE     GT
	  MOVGT    r6,#1;
	  MOVLE    r6,#0;
	  LSL     r5,r4,#5;
	  AND    r8, r0, r5;Extracting d2
	  cmp     r8,#0
	  ITE     GT
	  MOVGT    r8,#1;
	  MOVLE    r8,#0;
	  LSL     r5,r4,#9;
	  AND    r10, r0, r5;Extracting d5
	  cmp     r10,#0
	  ITE     GT
	  MOVGT    r10,#1;
	  MOVLE    r10,#0;
	  EORS    r2,r7,r6;
	  EORS    r2,r2,r8;
	  EORS    r2,r2,r9;
	  EORS    r2,r2,r10;
	  EORS    r2,r2,r11;C2 value is computed
	  LSL     r5,r4,#4;
	  AND    r6, r0, r5;Extracting p4
	  cmp     r6,#0
	  ITE     GT
	  MOVGT    r6,#1;
	  MOVLE    r6,#0;
	  LSL     r5,r4,#4;
	  AND    r7, r0, r5;Extracting d1
	  cmp     r7,#0
	  ITE     GT
	  MOVGT    r7,#1;
	  MOVLE    r7,#0;
	  LSL     r5,r4,#11;
	  AND    r10, r0, r5;Extracting d7
	  cmp     r10,#0
	  ITE     GT
	  MOVGT    r10,#1;
	  MOVLE    r10,#0;
	  EORS    r3,r7,r6;
	  EORS    r3,r3,r8;
	  EORS    r3,r3,r9;
	  EORS    r3,r3,r10;Computed c4
	  LSL     r5,r4,#7;
	  AND    r6, r0, r5;Extracting p8
	  cmp     r6,#0
	  ITE     GT
	  MOVGT    r6,#1;
	  MOVLE    r6,#0;
	  LSL     r5,r4,#8;
	  AND    r7, r0, r5;Extracting d4
	  cmp     r7,#0
	  ITE     GT
	  MOVGT    r7,#1;
	  MOVLE    r7,#0;
	  LSL     r5,r4,#9;
	  AND    r8, r0, r5;Extracting d5
	  cmp     r8,#0
	  ITE     GT
	  MOVGT    r8,#1;
	  MOVLE    r8,#0;
	  LSL     r5,r4,#10;
	  AND    r9, r0, r5;Extracting d6
	  cmp     r9,#0
	  ITE     GT
	  MOVGT    r9,#1;
	  MOVLE    r9,#0;
	  EORS    r12,r7,r6;
	  EORS    r12,r12,r8;
	  EORS    r12,r12,r9;
	  EORS    r12,r12,r10;calculated c8
	  mov     r10,#0;
	  LSL     r6,r1,#0;
	  ADD     r10,r10,r6; Adding c1
	  LSL     r7,r2,#1;
	  ADD     r10,r10,r7; Adding c2
	  LSL     r8,r3,#2;
	  ADD     r10,r10,r8; Adding c4
	  LSL     r9,r12,#3;
	  ADD     r10,r10,r9; Adding c4
	  MOV     r0,r10;
      BX      LR;
;ENDFUNC

Decoding    FUNCTION 
	  MOV     r4,#1
	  LSL     r5,r4,#2;
	  AND     r6, r0, r5;Extracting d0
	  cmp     r6,#0
	  ITE     GT
	  MOVGT    r6,#1;
	  MOVLE    r6,#0;
	  LSL     r5,r4,#4;
	  AND     r7, r0, r5;Extracting d1
	  cmp     r7,#0
	  ITE     GT
	  MOVGT    r7,#1;
	  MOVLE    r7,#0;
	  LSL     r5,r4,#5;
	  AND     r8, r0, r5;Extracting d2
	  cmp     r8,#0
	  ITE     GT
	  MOVGT    r8,#1;
	  MOVLE    r8,#0;
	  LSL     r5,r4,#7;
	  AND     r9, r0, r5;Extracting d3
	  cmp     r9,#0
	  ITE     GT
	  MOVGT    r9,#1;
	  MOVLE    r9,#0;
	  LSL     r5,r4,#8;
	  AND     r10, r0, r5;Extracting d4
	  cmp     r10,#0
	  ITE     GT
	  MOVGT    r10,#1;
	  MOVLE    r10,#0;
	  LSL     r5,r4,#9;
	  AND     r11, r0, r5;Extracting d5
	  cmp     r11,#0
	  ITE     GT
	  MOVGT    r11,#1;
	  MOVLE    r11,#0;
	  LSL     r5,r4,#10;
	  AND     r12, r0, r5;Extracting d6
	  cmp     r12,#0
	  ITE     GT
	  MOVGT    r12,#1;
	  MOVLE    r12,#0;
	  LSL     r5,r4,#11;
	  AND     r2, r0, r5;Extracting d7
	  cmp     r2,#0
	  ITE     GT
	  MOVGT    r2,#1;
	  MOVLE    r2,#0;
	  mov     r3,#0;
	  LSL     r1,r6,#0;
	  ADD     r3,r3,r1; Adding d0
	  LSL     r1,r7,#1;
	  ADD     r3,r3,r1; Adding d1
	  LSL     r1,r8,#2;
	  ADD     r3,r3,r1; Adding d2
	  LSL     r1,r9,#3;
	  ADD     r3,r3,r1; Adding d3
	  LSL     r1,r10,#4;
	  ADD     r3,r3,r1; Adding d4
	  LSL     r1,r11,#5;
	  ADD     r3,r3,r1; Adding d5
	  LSL     r1,r12,#6;
	  ADD     r3,r3,r1; Adding d6
	  LSL     r1,r2,#7;
	  ADD     r3,r3,r1; Adding d7
	  MOV     r0,r3;
      BX      LR;
;ENDFUNC
Encription    FUNCTION 
	          EOR  r0,r0,r1;
              BX      LR;

Encoding    FUNCTION 
	  MOV     r4,#1
	  LSL     r5,r4,#0;
	  AND    r6, r0, r5;Extracting d0
	  cmp     r6,#0
	  ITE     GT
	  MOVGT    r6,#1;
	  MOVLE    r6,#0;
	  LSL     r5,r4,#1;
	  AND    r7, r0, r5;Extracting d1
	  cmp     r7,#0
	  ITE     GT
	  MOVGT    r7,#1;
	  MOVLE    r7,#0;
	  LSL     r5,r4,#2;
	  AND    r8, r0, r5;Extracting d2
	  cmp     r8,#0
	  ITE     GT
	  MOVGT    r8,#1;
	  MOVLE    r8,#0;
	  LSL     r5,r4,#3;
	  AND    r9, r0, r5;Extracting d3
	  cmp     r9,#0
	  ITE     GT
	  MOVGT    r9,#1;
	  MOVLE    r9,#0;
	  LSL     r5,r4,#4;
	  AND    r10, r0, r5;Extracting d4
	  cmp     r10,#0
	  ITE     GT
	  MOVGT    r10,#1;
	  MOVLE    r10,#0;
	  LSL     r5,r4,#5;
	  AND    r11, r0, r5;Extracting d5
	  cmp     r11,#0
	  ITE     GT
	  MOVGT    r11,#1;
	  MOVLE    r11,#0;
	  LSL     r5,r4,#6;
	  AND    r12, r0, r5;Extracting d6
	  cmp     r12,#0
	  ITE     GT
	  MOVGT    r12,#1;
	  MOVLE    r12,#0;
	  LSL     r5,r4,#7;
	  AND    r3, r0, r5;Extracting d7
	  cmp     r3,#0
	  ITE     GT
	  MOVGT    r3,#1;
	  MOVLE    r3,#0;
	  EORS    r1,r7,r6;
	  EORS    r1,r1,r9;
	  EORS    r1,r1,r10;
	  EORS    r1,r1,r12;
	  EORS    r2,r6,r8;
	  EORS    r2,r2,r9;
	  EORS    r2,r2,r11;
	  EORS    r2,r2,r12;
	  EORS    r6,r7,r8;
	  EORS    r6,r6,r9;
	  EORS    r6,r6,r3;
	  EORS    r7,r10,r11;
	  EORS    r7,r7,r12;
	  EORS    r7,r7,r3;
	  
	  MOV     r3,#1
	  LSL     r5,r3,#0;
	  AND    r4, r0, r5;Extracting d0
	  cmp     r4,#0
	  ITE     GT
	  MOVGT    r4,#1;
	  MOVLE    r4,#0;
	  LSL     r5,r3,#1;
	  AND    r8, r0, r5;Extracting d1
	  cmp     r8,#0
	  ITE     GT
	  MOVGT    r8,#1;
	  MOVLE    r8,#0;
	  LSL     r5,r3,#2;
	  AND    r9, r0, r5;Extracting d2
	  cmp     r9,#0
	  ITE     GT
	  MOVGT    r9,#1;
	  MOVLE    r9,#0;
	  LSL     r5,r3,#3;
	  AND    r10, r0, r5;Extracting d3
	  cmp     r10,#0
	  ITE     GT
	  MOVGT    r10,#1;
	  MOVLE    r10,#0;
	  MOV     r11,r1;
	  LSL     r12,r2,#1; 
	  ADD     r11,r11,r12;Adding p1
	  LSL     r12,r4,#2;
	  ADD     r11,r11,r12;Adding p2
	  LSL     r12,r6,#3;
	  ADD     r11,r11,r12;Adding d0
	  LSL     r12,r8,#4;
	  ADD     r11,r11,r12;Adding p4
	  LSL     r12,r9,#5;
	  ADD     r11,r11,r12;Adding d1
	  LSL     r12,r10,#6;
	  ADD     r11,r11,r12;Adding d2
	  LSL     r12,r7,#7;
	  ADD     r11,r11,r12;Adding d3
	  LSL     r5,r3,#4;
	  AND    r6, r0, r5;Extracting d4
	  cmp     r6,#0
	  ITE     GT
	  MOVGT    r6,#1;
	  MOVLE    r6,#0;
	  LSL     r5,r3,#5;
	  AND    r7, r0, r5;Extracting d5
	  cmp     r7,#0
	  ITE     GT
	  MOVGT    r7,#1;
	  MOVLE    r7,#0;
	  LSL     r5,r3,#6;
	  AND    r8, r0, r5;Extracting d6
	  cmp     r8,#0
	  ITE     GT
	  MOVGT    r8,#1;
	  MOVLE    r8,#0;
	  LSL     r5,r3,#7;
	  AND    r9, r0, r5;Extracting d7
	  cmp     r9,#0
	  ITE     GT
	  MOVGT    r9,#1;
	  MOVLE    r9,#0;
	  LSL     r12,r6,#8;
	  ADD     r11,r11,r12; Adding d4
	  LSL     r12,r7,#9;
	  ADD     r11,r11,r12;Adding d5
	  LSL     r12,r8,#10;
	  ADD     r11,r11,r12;Adding d6
	  LSL     r12,r9,#11;
	  ADD     r11,r11,r12;Adding d7
	  MOV     r0,r11;  moving 12 bits D7,D6,D5,D4,P8,D3,D2,D1,P4,D0,P2,P1 from r11 to r0 Now Encoding will be present in r0
      BX      LR;
CrossWire    FUNCTION
	          ;MOV r1,#320; x extreme
			  ;MOV r2,#240; y extreme
			  ADD r7,r1,r2;
			  SUB r7,r7,#1;
			  MOV r3,#5; received x
			  MOV r4,#1; received y
			  MOV r6,#0;counter for generating cross
			  
			  ADD r9,r1,#1;
			  MOV r12,r3; value of modified x
			  MOV r0,#1; value of modified y
			  MOV r5,#1; value of modified x
			  CMP r4,#1;
			  BNE Outerloop
Cornerlooper  CMP r6, r7; Compare for loop length of total array size
              BEQ EndSt;
			  CMP r0,#1
			  BNE ContOutLoop1;

PopY1         STR r5,[r8], #4; 
              STR r0, [r8], #4;
              ADD r5,r5,#1; incrementing x
			  ADD r6,r6,#1; incrementing loop counter
			  CMP r5,r9
			  BNE PopY1 ;
ContOutLoop1  ADD r0,r0,#1; incrementing Y
			  MOV r10,r12;xvalue
			  MOV r11,r0;yvalue
			  STR r10, [r8],#4; storing latest x value in memory
			  STR r11, [r8],#4; storing latest y value in memory
			  ADD r6,r6,#1; incrementing loop counter
              B Cornerlooper ; this will redirect to starting of while loop

Outerloop     CMP r6, r7; Compare for loop length of total array size
              BEQ EndSt;
			  MOV r10,r12;xvalue
			  MOV r11,r0;yvalue
			  STR r10, [r8],#4; storing latest x value in memory
			  STR r11, [r8],#4; storing latest y value in memory
			  ADD r0,r0,#1; incrementing Y
			  ADD r6,r6,#1; incrementing loop counter
Innerloop     CMP r4,r0 ;checking r0  with received y
			  BEQ PopY;
			  BNE ContOutLoop;

PopY          STR r5,[r8], #4; 
              STR r0, [r8], #4;
              ADD r5,r5,#1; incrementing x
			  ADD r6,r6,#1; incrementing loop counter
			  CMP r5,r9
			  BNE PopY ;
			  ADD r0,r0,#1; incrementing Y
ContOutLoop   B Outerloop ; this will redirect to starting of while loop
EndSt	      BX      LR;

			  
__main  function
	          ;Inputs for Cross Wire
	          MOV r1,#5; x extreme 
			  MOV r2,#4; y extreme 
			  LDR r7,=0x20000000 ;This location stores address of list of x,y
			  LDR r8,=0x20000100 ;Starting address of first x
			  STR r8, [r7], #0;
			  BL CrossWire; 
			  MOV r5,#10;
			  MOV r3,#1;
			  LDR r4,=0x20000140 ; Contains pixel count
			  STR r5, [r4], #0;
			  LDR r2,=0x20000144; Starting address of 8bit pixel count IS 0x20000144
			  LDR r6,=0x20000144;
PopltPixels   STR r3, [r6], #4;
			  CMP r5,r3;
			  ADD r3,r3,#1;
			  BNE PopltPixels
			  ;LDR r0, [r2, #0];
			  MOV r0,#204;
			  MOV r1,#9;
			  BL Encription;
			  BL Encoding;
			  MOV r2,#0;
			  MOV r3,#0;
			  MOV r4,#0;
			  MOV r5,#0;
			  MOV r6,#0;
			  MOV r7,#0;
			  MOV r8,#0;
			  MOV r9,#0;
			  MOV r10,#0;
			  MOV r11,#0;
			  MOV r12,#0;
			  BL Decoding;
			  MOV  r1,#9;
			  BL Encription;
	          ;MOV r0,#3110;r0 contains 12 bit input
			 ; BL ParityCheck;
			 ; BL Decoding;
stop        B stop  ; stop program
        endfunc
      end
