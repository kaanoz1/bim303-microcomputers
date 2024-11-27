LEA SI, ARR 
MOV DI, 3000H
 
LODSB          
STOSB

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

LODSB          
STOSB 

   

MOV CX, 22
   
MOV DI, 303FH    
    
LOOP_REVERSE:
    STD
    LODSB
    CLD           
    STOSB            
    LOOP LOOP_REVERSE
   
MOV DI,3000H
MOV SI,3040H


MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB
MOVSB           
      
RET

ARR DW 'BIM303-MICROCOMPUTERS',0

END


           
       
