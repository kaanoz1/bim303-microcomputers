MOV SI, 3000H

MOV DX, 'B'   

MOV WORD PTR [SI], DX

INC SI 

MOV DX, 'I'

MOV WORD PTR [SI], DX   

INC SI

MOV DX, 'M'  

MOV WORD PTR [SI], DX 

INC SI

MOV DX, '3' 

MOV WORD PTR [SI], DX

INC SI

MOV DX, '0'  

MOV WORD PTR [SI], DX 

INC SI

MOV DX, '3' 

MOV WORD PTR [SI], DX 

INC SI

MOV DX, '-'

MOV WORD PTR [SI], DX 

INC SI

MOV DX, 'M'  

MOV WORD PTR [SI], DX  

INC SI

MOV DX, 'I' 

MOV WORD PTR [SI], DX 

INC SI

MOV DX, 'C' 

MOV WORD PTR [SI], DX    

INC SI

MOV DX, 'R' 

MOV WORD PTR [SI], DX 

INC SI
            
            
MOV DX, 'O'
MOV WORD PTR [SI], DX  

INC SI
           
MOV DX, 'C' 

MOV WORD PTR [SI], DX  

INC SI

MOV DX, 'O' 

MOV WORD PTR [SI], DX 

INC SI

MOV DX, 'M' 

MOV WORD PTR [SI], DX   

INC SI

MOV DX, 'P' 

MOV WORD PTR [SI], DX

INC SI

MOV DX, 'U' 

MOV WORD PTR [SI], DX

INC SI

MOV DX, 'T' 

MOV WORD PTR [SI], DX

INC SI

MOV DX, 'E'

MOV WORD PTR [SI], DX
              
INC SI
               
MOV DX, 'R' 

MOV WORD PTR [SI], DX  

INC SI   

MOV DX, 'S' 

MOV WORD PTR [SI], DX  


MOV SI, 3000H     
MOV CX, 21       

L:
    LEA BX, SI   
    
    PUSH BX    
        
    INC SI  
          
    LOOP L  
    
MOV DI, 3020H
MOV CX, 21     
   
K:
    POP SI
    
    LODSB 
    
    MOV [DI], AL 
    
    INC DI
               
    
    LOOP K    

RET







