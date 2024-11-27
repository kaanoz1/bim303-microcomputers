MOV CX, 4
MOV DI, 3000H
LEA SI, NUM1
REP MOVSB

MOV CX, 4
LEA SI, NUM2
REP MOVSB
         
MOV SI, 3000H
MOV DI, 3004H
MOV BP, 3010H

MOV CX, 4     

OUTER_LOOP:
   
    PUSH CX
    
    
    MOV BP, 3010H
    
    MOV BX, 4         ;
    
    SUB BX, CX        ;
    
    ADD BP, BX        ;
           
    MOV CX, 4         ;
    
    MOV DI, 3004H     ; MOV BP, [BP + 4 - CX]
    

                                             
    
    INNER_LOOP:
          MOV AL, [DI]
          MOV AH, [SI]
          MUL AH
          
          ADD AX, [BP]
                 
          MOV [BP], AX 
          
          MOV BX, 0        
          ADC [BP+2], BX 
      
          INC DI
          
          INC BP
                  
          
        LOOP INNER_LOOP
        
        INC SI        
    
    POP CX
    LOOP OUTER_LOOP 


RET

NUM1 DB 63H, 6FH, 6DH, 70H  
NUM2 DB 75H, 74H, 65H, 72H 

END