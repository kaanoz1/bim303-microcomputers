MOV CX, COUNT   
LEA SI, ARR     
MOV BP, 0        

L1:
PUSH CX

MOV AX, COUNT

SUB AX, CX
MOV CX, AX
 

CMP CX,1
JE continue
CMP CX,0
JE continue

MOV AX, CX 
MOV BX, 0  
MOV CX, CX 
MOV DX, 0 

reverse_digits:
    
    PUSH BX
    
    MOV BX,10              
    DIV BX
    
    POP BX
                 
    ADD BX, DX               
    CMP AX, 0            
    JE compare_numbers
    PUSH AX
    MOV AX, BX
    MUL TEN    
    MOV BX, AX
    POP AX              
    JMP reverse_digits   

compare_numbers:
    CMP CX, BX           
    JNE continue
    
    MOV AX, BX ; ACTUAL NUMBER
    MOV CX, BX
    DEC CX 
    JMP is_prime        

      
is_prime:
    CMP CX, 1
    JE print

    MOV DX, 0
    MOV AX, BX      

    DIV CX          

    CMP DX, 0       
    JE continue    

    DEC CX           
    JMP is_prime      
    
             
               

print:          
    MOV [SI + BP], BX
    INC BP
    INC BP              

continue:            


POP CX
LOOP L1          

RET

ARR DW 1000 DUP(0)
TEN DW 10D
COUNT DW 1000
END
