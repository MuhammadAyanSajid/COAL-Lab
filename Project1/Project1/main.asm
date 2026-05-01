INCLUDE C:/Irvine/Irvine32.inc
INCLUDELIB C:/Irvine/Irvine32.lib
SumArray PROTO
CalculateAverage PROTO
.data
    prompt      BYTE "Enter a number: ", 0
    sumMsg      BYTE "Sum of numbers: ", 0
    avgMsg      BYTE "Average of numbers: ", 0
    PUBLIC numArray
    numArray    DWORD 10 DUP(0)
    PUBLIC sum, avg
    sum         DWORD 0
    avg         DWORD 0
.code
main PROC
    MOV ECX, 10
    MOV ESI, OFFSET numArray
input_loop:
    MOV EDX, OFFSET prompt
    CALL WriteString
    CALL ReadInt
    MOV [ESI], EAX
    ADD ESI, 4
    LOOP input_loop
    CALL SumArray
    CALL CalculateAverage
    MOV EDX, OFFSET sumMsg
    CALL WriteString
    MOV EAX, sum
    CALL WriteInt
    CALL Crlf
    MOV EDX, OFFSET avgMsg
    CALL WriteString
    MOV EAX, avg
    CALL WriteInt
    CALL Crlf
    INVOKE ExitProcess, 0
main ENDP
END main