INCLUDE C:/Irvine/Irvine32.inc
INCLUDELIB C:/Irvine/Irvine32.lib
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
    prompt         BYTE "Enter a string (max 20 chars): ", 0
    reversedLabel  BYTE "Reversed string: ", 0
    buffer         BYTE 21 DUP(0)
    stringSize     DWORD ?
.code
main PROC
    MOV EDX, OFFSET prompt
    CALL WriteString
    MOV EDX, OFFSET buffer
    MOV ECX, SIZEOF buffer
    CALL ReadString
    MOV stringSize, EAX
    MOV ECX, stringSize
    MOV ESI, 0
push_loop:
    MOVZX EAX, buffer[ESI]
    PUSH EAX
    INC ESI
    LOOP push_loop
    MOV ECX, stringSize
    MOV ESI, 0
pop_loop:
    POP EAX
    MOV buffer[ESI], AL
    INC ESI
    LOOP pop_loop
    MOV EDX, OFFSET reversedLabel
    CALL WriteString    
    MOV EDX, OFFSET buffer
    CALL WriteString
    CALL Crlf
    INVOKE ExitProcess, 0
main ENDP
END main