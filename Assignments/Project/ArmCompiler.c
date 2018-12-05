/*Arm cortex m4 Assembler code generating c Compiler code
Name: Bala Ayyappa, Mohan Madineni, A V Santhosh Kumar
College: IIIT Bangalore 
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define expsize 100
#define start_addr 0x20000000



char stack[expsize];
int stack_top=-1;
char *inputstring;
FILE *fp;
typedef struct{
	double entryvar;//can be operator or operand
	int entrytype;//0 implies operator, 1 implies operand
}entry;

entry inputelement[expsize],outputelement[expsize],*temp;

int priority_Array[expsize]={0},given[]={'(','*','/','+','-'};

char *opcode[]={"BRACKETOPCODE","VMUL.F32","VDIV.F32","VADD.F32","VSUB.F32"};

int inputsize,outputsize,temp_size;

/*check whether opening and closing brackets match*/
int ParanthesisCheck(){
    int i,count=0,size=strlen(inputstring);
    for(i=0;i<size;i++){
        if(inputstring[i]=='(') count++;
        else if(inputstring[i]==')') count--;
    }
    return count;
}

/*Assign precedence to each operator*/
void AssignPrecedence(){
	int i,size = sizeof(given)/sizeof(given[0]);
	for(i=0;i<size;i++) priority_Array[given[i]]=i+1;
}

/*Converts the input Expression from string format to Array of Structures*/
void InfixGenerationFromInputString(){
	int i,size = strlen(inputstring),flag=0,pt_check=0;
	double prev=0,mul=1;

	for(i=0;i<size;i++){
		if(inputstring[i]<=57&&inputstring[i]>=48||inputstring[i]==46){
                if(inputstring[i]==46) pt_check=1;
                else{
                    if(pt_check){//Floating point check
                        mul = mul*0.1;
                        prev = prev+(inputstring[i]-48)*mul;//if literal is floating point then multiply by 0.1 and add
                    }
                    else prev = prev*10 + inputstring[i]-48;//Generate the number
                }
                flag=1;
		}
		else if(inputstring[i]!='\0'&& inputstring[i]!=' '){
            mul=1; pt_check=0;
			if(prev||flag==1){
				inputelement[inputsize].entryvar = prev; inputelement[inputsize].entrytype = 1;//Adding the operand to the structure
				inputsize++;
				flag=0;
			}
			inputelement[inputsize].entryvar = inputstring[i]; inputelement[inputsize].entrytype = 0;//Adding the operator to the structure
			inputsize++;
			prev=0;
		}
	}
	if(prev||flag==1) {
		inputelement[inputsize].entryvar = prev; inputelement[inputsize].entrytype = 1;//Adding the final operand to the structure
		inputsize++;
	}
	accomodateunaryoperator();//check for unary operators
}

/*Operate with zero on encountering an unary operator*/
void accomodateunaryoperator(){
    int i,j,count;
    temp = (entry *)malloc(expsize*sizeof(entry));
    j=0;
    for(i=0;i<inputsize;i++){//if we encounter +,- or ++ then operate with zero
        if(((char)inputelement[i].entryvar=='-'||(char)inputelement[i].entryvar=='+')&&((i-1)==-1||(inputelement[i-1].entrytype==0&&(char)inputelement[i-1].entryvar!=')'))){
            temp[j].entryvar = '('; temp[j].entrytype=0; j++;
            temp[j].entryvar = 0; temp[j].entrytype=1; j++;
            temp[j].entryvar = inputelement[i].entryvar; temp[j].entrytype = 0; j++; i++;
            if(inputelement[i].entryvar=='('){
                temp[j]=inputelement[i]; j++;
                count=1;
                while(count!=0){
                    i++;//recursively build the brakets 
                    if((char)inputelement[i].entryvar=='(') count++;
                    else if ((char)inputelement[i].entryvar==')') count--;
                    temp[j]=inputelement[i]; j++;
                }
                temp[j].entryvar=')'; temp[j].entrytype = 0; j++;
            }
            else{
                temp[j] = inputelement[i]; j++;
                temp[j].entryvar = ')'; temp[j].entrytype=0; j++;
            }
        }
        else temp[j++] = inputelement[i];
    }
    temp_size = j; j=0;
    for(i=0;i<temp_size;i++)
        inputelement[j++] = temp[i];//Final Addition of Brackets and zeros where ever unary operators are present
    inputsize = i;
}

/*Check if stack is empty*/
int isstackempty(){
	if(stack_top==-1) return 1;
	else if(stack[stack_top]=='(') return 1;
	else return 0;
}

/*Converts Infix to Postfix Expression*/
void infixtopostfix(){
	int i;
	for(i=0;i<inputsize;i++){
		if(inputelement[i].entrytype==1){//store operands in output array
			outputelement[outputsize]=inputelement[i];
			outputsize++;
		}
		else{
			if(inputelement[i].entryvar=='('){//push ( to stack
				stack_top++; stack[stack_top] = (char)inputelement[i].entryvar;
			}
			else if(inputelement[i].entryvar==')'){
				while(stack[stack_top]!='('){//popout all operators until ( is met
					outputelement[outputsize].entryvar = stack[stack_top]; outputelement[outputsize].entrytype=0;
					outputsize++; stack_top--;
				}
				stack_top--;
			}
			else{   //popout all operators until lower priority than current is met
				while(!isstackempty()&&priority_Array[(char)inputelement[i].entryvar]>=priority_Array[stack[stack_top]]){
				outputelement[outputsize].entryvar = stack[stack_top]; outputelement[outputsize].entrytype=0;
				outputsize++; stack_top--;
				}
				stack_top++; stack[stack_top] = (char)inputelement[i].entryvar;
			}
		}
	}
	while(!isstackempty()){//popout all operators until stack is empty
		outputelement[outputsize].entryvar = stack[stack_top]; outputelement[outputsize].entrytype=0;
		outputsize++; stack_top--;
	}
}

/*Assembly code gen for postfix expression evaluation */
void AssemblyCodeGenForPostFixEval(){
	int i,temp_mem=start_addr;
	fprintf(fp,"\tPRESERVE8\n\tTHUMB\n\tAREA\tappcode,\tCODE,\tREADONLY\n\tEXPORT __main\n\tENTRY\n__main  FUNCTION\n");//Arm format
	fprintf(fp,"\tMOV r0, #0x%x 	;r0--> r0 start address of stack\n",start_addr);//r0 start address of stack memory
	temp_mem -= 4;
	fprintf(fp,"\tSUB r1, r0, #4 		;r1--> points to top of stack	\n\n");//r1 points to top of stack
	for(i=0;i<outputsize;i++){
		if(outputelement[i].entrytype==1){
			temp_mem += 4;
			fprintf(fp,"\t;Pushing Data On to stack\n\tADD r1, #4     ;r1=%x\n",temp_mem);
			fprintf(fp,"\tVLDR.F32 s0, =%f\n",outputelement[i].entryvar);
			fprintf(fp,"\tVSTR.F32 s0, [r1]\n\n");
		}
		else{
			fprintf(fp,"\t;Operation\n\tVLDR.F32 s1, [r1]\n\tSUB r1, #4\n\tVLDR.F32 s2, [r1]\n");
			if((char)outputelement[i].entryvar=='/'){
			    fprintf(fp,"\t;Check for Div by 0 \n\tVMOV r4, s1\n\tCMP r4, #0\n\tMOVEQ r3, #1\n\tBEQ stop\n");
			}
            fprintf(fp,"\t%s s2, s1\n\tVSTR.F32 s2, [r1]\n\n",opcode[priority_Array[(char)outputelement[i].entryvar]-1]);
		}
	}
	fprintf(fp,"stop B stop\t\t; Infinite Loop at the end\n\tENDFUNC\n\tEND\n");
}



int main(int argc, char **argv)
{

	FILE *ip;
        int i;
	if(argc==3){
            fp = fopen(argv[1],"w");/* Opening the Output.s file to write the resulting assembly code*/
            inputstring = argv[2]; /* Assigning Input Expression to input String*/
            if(ParanthesisCheck()){
            printf("Opening and closing paranthesis didnot match\n");
            return 0;
            }
            AssignPrecedence();/*Assign the Precedence for some selected opertors*/
	    printf("Below is the precedence of opertors\n");
	    for(i=0;i<expsize;i++) if(priority_Array[i]) printf("Character=%c Precedance=%d\n",i,priority_Array[i]);
            InfixGenerationFromInputString();/*Seperating Operators and Operands from Input Expression*/
            printf("\ninfix expression generated is as follows\n");
            for(i=0;i<inputsize;i++){
		if(inputelement[i].entrytype==0) printf("%c ",(char)inputelement[i].entryvar);
		else printf("%.2f ",inputelement[i].entryvar);
	    }
            printf("\n");
            infixtopostfix();/*Infix to Postfix Logic*/
	    printf("\nPostfix expression generated is as follows\n");
            for(i=0;i<outputsize;i++){
			if(outputelement[i].entrytype==0) printf("%c ",(char)outputelement[i].entryvar);
			else printf("%.2f ",outputelement[i].entryvar);
	    }
            printf("\n");
            AssemblyCodeGenForPostFixEval();/*Final Assembly code gen logic for postfix eval*/
            printf("\nAssembly code has been generated in %s file.\n", argv[1]);
	    fclose(fp);
	    return 0;
	}else{
            printf("Please Enter the expression and output file name in the <exp> <file.s> format\n");
        }	
}
