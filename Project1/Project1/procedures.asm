INCLUDE C:/Irvine/Irvine32.inc
PUBLIC SumArray, CalculateAverage
EXTERN numArray:DWORD, sum:DWORD, avg:DWORD
.code
SumArray PROC
    PUSH ECX
    PUSH ESI
    MOV ECX, 10
    MOV ESI, OFFSET numArray
    XOR EAX, EAX
sum_loop:
    ADD EAX, [ESI]
    ADD ESI, 4
    LOOP sum_loop
    MOV sum, EAX   
    POP ESI
    POP ECX
    RET
SumArray ENDP
CalculateAverage PROC
    MOV EAX, sum
    MOV ECX, 10
    CDQ
    IDIV ECX
    MOV avg, EAX
    RET
CalculateAverage ENDP
END