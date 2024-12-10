
org 100h

AGAIN:
MOV COUNT,30H
MOV RESULT, 0
MOV RESULT_LENGTH,0
LEA DI, ARR       
MOV CX, 26       
RESET_LOOP:
    MOV BYTE PTR [DI], 0
    INC DI               
    LOOP RESET_LOOP      

MOV SI,0
MOV BP,0

MOV DI,0
MOV CX,0
MOV DX, OFFSET MSG
MOV AH,9
INT 21H

GETWORD:
 MOV AH,00
 INT 16H
 CMP AL,0DH
 JE PRINT
 MOV AH,0EH
 INT 10H
 MOV ARR[DI],AL
 INC DI
 INC CX
JMP GETWORD

PRINT:
 LEA DX, MSGPRINT
 MOV AH,9
 INT 21H
 MOV DI,0

LEA SI,CLOSE
LEA DI,ARR
 
CHECK_CLOSE:

 
 MOV AX,[SI]
 MOV BX,[DI]
 
 CMP AX,0
 JE  HLT_PROGRAM
  
 INC SI
 INC DI
  
 CMP AX,BX
 JE CHECK_CLOSE
 JNE PROCESS


MOV SI,0
MOV DI,0

PROCESS:

L1:
    MOV AL, ARR[DI]         
    CMP AL, 0                
    JE SKIP             
    
    LEA SI, ALPHABET 
    MOV CX, 26               

CHECK_ALPHABET:

    CMP AL, [SI]             
    JE NEXT_CHAR                
    INC SI                 
    
    LOOP CHECK_ALPHABET     

    CALL TAKEONE            
    JMP L1                  

NEXT_CHAR:
    INC DI                  
    JMP L1                  

SKIP:

     LEA SI, ARR
     LEA BP, ALPHABET

SCAN:
     LEA DI, RESULT


     
     CMP [SI],0
     JE GO_END
     
     MOV BL, [SI]
     MOV DL, [BP]
     
     INC SI
     INC BP
     
     
     
     CMP BL, DL
     JE INSERT_RESULT
     
    JMP SCAN
    
INSERT_RESULT:
     
    CMP RESULT,0
    JNE ADD_COMA
    
    CONTINUE:
    PUSH DI
    LEA DI, RESULT
    ADD DI, RESULT_LENGTH 
    MOV [DI], BL
    POP DI
    
    CALL INC_COUNT 
    CALL INC_RESULT_LENGTH

    JMP SCAN

ADD_COMA:
    PUSH DI
    MOV DI,0
    ADD DI, RESULT_LENGTH
    MOV RESULT[DI], ","
    CALL INC_RESULT_LENGTH
    
    
    POP DI
    
    JMP CONTINUE

    
GO_END:

LEA DI, RESULT
ADD DI, RESULT_LENGTH
MOV [DI], " "
INC DI
MOV [DI], ">"
INC DI
MOV [DI], " "
INC DI
MOV AX, COUNT
MOV [DI], AL

INC DI
MOV [DI], "$"

    LEA DX, RESULT
    MOV AH, 09H
    INT 21H
   
MOV AH, 02H      ; DOS interrupt to output a single character
MOV DL, 0DH      ; Carriage return
INT 21H
MOV DL, 0AH      ; Line feed
INT 21H


JMP AGAIN    

HLT_PROGRAM:
MOV AH, 4CH                 
    INT 21H

TAKEONE PROC

   
    PUSH CX         
    PUSH DI       

    MOV CX, 26      
    MOV SI, DI      

TAKELOOP:
    MOV AL, ARR[SI + 1] 
    MOV ARR[SI], AL     
    INC SI            
    LOOP TAKELOOP    

    DEC DI
    POP DI          
    POP CX   
RET
TAKEONE ENDP

INC_RESULT_LENGTH PROC
    
    PUSH AX
    MOV AX, 0
    MOV AX, RESULT_LENGTH   
    INC AX
    MOV RESULT_LENGTH, AX
    POP AX
     
     
RET      
INC_RESULT_LENGTH ENDP

INC_COUNT PROC
    PUSH AX
    MOV AX, COUNT
    INC AX
    MOV COUNT, AX
    POP AX

RET    
INC_COUNT ENDP
    


ARR DB 26 DUP(0)
MSG DB "ENTER INPUT:$"
MSGPRINT DB " > $"
NEWLINE DB 13,10,"$"

ALPHABET DB 'abcdefghijklmnopqrstuvwxyz', 0
CLOSE DB "close", 256 DUP(0)
RESULT DB 256 DUP(0)
RESULT_LENGTH DW 256 DUP(0)
COUNT DW 48


END
