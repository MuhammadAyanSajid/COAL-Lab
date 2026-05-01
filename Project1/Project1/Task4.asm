INCLUDE C:/Irvine/Irvine32.inc
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
numArray DWORD 45, 12, 78
maxVal DWORD ?
.code
main PROC
MOV ESI, OFFSET numArray
CALL FindMax3
MOV maxVal, EAX
CALL WriteInt
CALL Crlf
INVOKE ExitProcess, 0
main ENDP
FindMax3 PROC
MOV EAX, [ESI]
CMP EAX, [ESI+4]
JGE check_third
MOV EAX, [ESI+4]
check_third:
CMP EAX, [ESI+8]
JGE done
MOV EAX, [ESI+8]
done:
RET
FindMax3 ENDP
END main