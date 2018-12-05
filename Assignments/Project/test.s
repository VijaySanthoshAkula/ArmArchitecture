	PRESERVE8
	THUMB
	AREA	appcode,	CODE,	READONLY
	EXPORT __main
	ENTRY
__main  FUNCTION
	MOV r0, #0x20000100 	;r0--> r0 start address of stack
	SUB r1, r0, #4 		;r1--> points to top of stack	

	;Pushing Data On to stack
	ADD r1, #4     ;r1=20000100
	VLDR.F32 s0, =0.000000
	VSTR.F32 s0, [r1]

	;Pushing Data On to stack
	ADD r1, #4     ;r1=20000104
	VLDR.F32 s0, =9.000000
	VSTR.F32 s0, [r1]

	;Pushing Data On to stack
	ADD r1, #4     ;r1=20000108
	VLDR.F32 s0, =5.000000
	VSTR.F32 s0, [r1]

	;Pushing Data On to stack
	ADD r1, #4     ;r1=2000010c
	VLDR.F32 s0, =2.000000
	VSTR.F32 s0, [r1]

	;Pushing Data On to stack
	ADD r1, #4     ;r1=20000110
	VLDR.F32 s0, =3.000000
	VSTR.F32 s0, [r1]

	;Pushing Data On to stack
	ADD r1, #4     ;r1=20000114
	VLDR.F32 s0, =2.000000
	VSTR.F32 s0, [r1]

	;Operation
	VLDR.F32 s1, [r1]
	SUB r1, #4
	VLDR.F32 s2, [r1]
	VSUB.F32 s2, s1
	VSTR.F32 s2, [r1]

	;Operation
	VLDR.F32 s1, [r1]
	SUB r1, #4
	VLDR.F32 s2, [r1]
	VMUL.F32 s2, s1
	VSTR.F32 s2, [r1]

	;Operation
	VLDR.F32 s1, [r1]
	SUB r1, #4
	VLDR.F32 s2, [r1]
	;Check for Div by 0 
	VMOV r4, s1
	CMP r4, #0
	MOVEQ r3, #1
	BEQ stop
	VDIV.F32 s2, s1
	VSTR.F32 s2, [r1]

	;Operation
	VLDR.F32 s1, [r1]
	SUB r1, #4
	VLDR.F32 s2, [r1]
	VMUL.F32 s2, s1
	VSTR.F32 s2, [r1]

	;Operation
	VLDR.F32 s1, [r1]
	SUB r1, #4
	VLDR.F32 s2, [r1]
	VADD.F32 s2, s1
	VSTR.F32 s2, [r1]

stop B stop		; Infinite Loop at the end
	ENDFUNC
	END
