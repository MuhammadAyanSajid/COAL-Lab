;.386
;.model flat, stdcall
;.stack 4096
;ExitProcess PROTO, dwExitCode: DWORD
;
;.data
;    array1 dword 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25
;    sum dword 0
;
;.code
;main PROC
;    mov edi, OFFSET array1      
;    mov ecx, LENGTHOF array1    
;    mov eax, 0                  
;
;L1:
;    add eax, [edi]              
;    add edi, 4                 
;    sub ecx, 1                  
;    jnz L1                   
;    mov sum, eax               
;    
;    INVOKE ExitProcess, 0
;main ENDP
;END main

;.386
;.model flat, stdcall
;.stack 4096
;ExitProcess PROTO, dwExitCode: DWORD
;
;.data
;    array2 dword 100,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2 
;    result dword 0
;
;.code
;main PROC
;    mov edi, OFFSET array2      
;    mov ecx, 24                
;    mov ebx, 4                  
;    mov eax, [edi]              
;
;L2:
;    sub eax, [edi + ebx]        
;    add ebx, 4                 
;    sub ecx, 1                 
;    jnz L2                      
;
;    mov result, eax
;    
;    INVOKE ExitProcess, 0 
;main ENDP
;END main

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
    source dword 10, 20, 30, 40, 50
    target dword 5 dup(0)       
.code
main PROC
    mov esi, OFFSET source      
    mov edi, OFFSET target
    add edi, 16                
    
    mov ecx, 5                  

L3:
    mov eax, [esi]              
    mov [edi], eax              
    
    add esi, 4                 
    sub edi, 4                 
    
    sub ecx, 1                 
    jnz L3 

    INVOKE ExitProcess, 0
main ENDP
END main
