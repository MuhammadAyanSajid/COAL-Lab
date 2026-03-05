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
;    array2 dword 100,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2 ; 25 numbers
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
    target dword 5 dup(0)       ; Destination array

.code
main PROC
    mov esi, OFFSET source      ; Pointer to start of source
    mov edi, OFFSET target
    add edi, 16                 ; Point to the last element of target (4 elements * 4 bytes)
    
    mov ecx, 5                  ; Number of elements

L3:
    mov eax, [esi]              ; Get element from source [cite: 124]
    mov [edi], eax              ; Place in target in reverse position [cite: 93]
    
    add esi, 4                  ; Move source pointer forward [cite: 125]
    sub edi, 4                  ; Move target pointer backward
    
    sub ecx, 1                  ; Loop control [cite: 126]
    jnz L3 

    INVOKE ExitProcess, 0
main ENDP
END main
