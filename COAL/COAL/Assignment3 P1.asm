INCLUDE C:\Irvine\Irvine32.inc
INCLUDELIB C:\Irvine\Irvine32.lib

;.386
;.model flat, stdcall
;.stack 4096
;
;ExitProcess PROTO, dwExitCode:DWORD
;
;.data
;    prompt      BYTE "Enter a number: ", 0
;    sumMsg      BYTE "Sum of numbers: ", 0
;    avgMsg      BYTE "Average of numbers: ", 0
;    
;    numArray    DWORD 10 DUP(0)
;    sum         DWORD 0
;    avg         DWORD 0
;
;.code
;main PROC
;    MOV ECX, 10              
;    MOV ESI, OFFSET numArray
;
;input_loop:
;    MOV EDX, OFFSET prompt
;    CALL WriteString         
;    CALL ReadInt             
;    MOV [ESI], EAX           
;    ADD ESI, 4            
;    LOOP input_loop
;
;    CALL SumArray            
;    
;    MOV EDX, OFFSET sumMsg
;    CALL WriteString
;    MOV EAX, sum
;    CALL WriteInt            
;    CALL Crlf
;
;    CALL CalculateAverage    
;    
;    MOV EDX, OFFSET avgMsg
;    CALL WriteString
;    MOV EAX, avg
;    CALL WriteInt            
;    CALL Crlf
;
;    INVOKE ExitProcess, 0
;main ENDP
;
;SumArray PROC
;    PUSH ECX                 
;    PUSH ESI
;    
;    MOV ECX, 10              
;    MOV ESI, OFFSET numArray
;    XOR EAX, EAX             
;
;sum_loop:
;    ADD EAX, [ESI]           
;    ADD ESI, 4               
;    LOOP sum_loop
;
;    MOV sum, EAX             
;    
;    POP ESI
;    POP ECX
;    RET
;SumArray ENDP
;
;CalculateAverage PROC
;    PUSH ECX
;    
;    MOV EAX, sum             
;    MOV ECX, 10              
;    CDQ                      
;    IDIV ECX                 
;    MOV avg, EAX             
;    
;    POP ECX
;    RET
;CalculateAverage ENDP
;
;END main

