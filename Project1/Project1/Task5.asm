INCLUDE C:/Irvine/Irvine32.inc
.386
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
buffer BYTE "Assembly Language", 0
key BYTE 05Ah
msg1 BYTE "Original/Decrypted: ", 0
msg2 BYTE "Encrypted: ", 0
.code
main PROC
MOV EDX, OFFSET msg1
CALL WriteString
MOV EDX, OFFSET buffer
CALL WriteString
CALL Crlf
CALL TranslateString
MOV EDX, OFFSET msg2
CALL WriteString
MOV EDX, OFFSET buffer
CALL WriteString
CALL Crlf
CALL TranslateString
MOV EDX, OFFSET msg1
CALL WriteString
MOV EDX, OFFSET buffer
CALL WriteString
CALL Crlf
INVOKE ExitProcess, 0
main ENDP
TranslateString PROC
PUSHAD
MOV ESI, OFFSET buffer
MOV ECX, LENGTHOF buffer
MOV BL, key
L1:
XOR BYTE PTR [ESI], BL
INC ESI
LOOP L1
POPAD
RET
TranslateString ENDP
END main