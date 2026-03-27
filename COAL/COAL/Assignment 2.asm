INCLUDE C:\Irvine\Irvine32.inc
INCLUDELIB C:\Irvine\Irvine32.lib

;.data
;    prompt1 BYTE "Enter first number : ", 0
;    prompt2 BYTE "Enter second number: ", 0
;    resMsg  BYTE "Sum = ", 0
;    val1    DWORD ?
;    val2    DWORD ?
;
;.code
;main PROC
;    ; Get first number
;    mov edx, OFFSET prompt1     ; Load prompt address
;    call WriteString            ; Display prompt
;    call ReadInt                ; Read integer into EAX
;    mov val1, eax               ; Save EAX into val1 immediately (Tip #2)
;
;    ; Get second number
;    mov edx, OFFSET prompt2     ; Load prompt address
;    call WriteString            ; Display prompt
;    call ReadInt                ; Read integer into EAX
;    mov val2, eax               ; Save EAX into val2
;
;    ; Perform Addition
;    mov eax, val1               ; Load first number to EAX
;    add eax, val2               ; Add second number to EAX (EAX = val1 + val2)
;
;    ; Display Result
;    mov edx, OFFSET resMsg      ; Load "Sum = " string
;    call WriteString            ; Display it
;    call WriteInt               ; Display the value in EAX
;    call Crlf                   ; Move to next line (Tip #4)
;
;    exit
;main ENDP
;END main



;.data
;    prompt BYTE "Enter a string: ", 0
;    resMsg BYTE "Minimum number is: ", 0
;    buffer BYTE 21 DUP(0)      ; Buffer for 20 characters + null (Tip #1)
;
;.code
;main PROC
;    ; Read string from user
;    mov edx, OFFSET prompt      ; Load prompt
;    call WriteString
;    mov edx, OFFSET buffer      ; Point EDX to buffer
;    mov ecx, SIZEOF buffer      ; Set max characters to read
;    call ReadString             ; Read input into buffer
;
;    ; Initialize Scan
;    mov esi, OFFSET buffer      ; ESI points to start of string
;    mov al, [esi]               ; AL = first character (initial minimum)
;
;scanLoop:
;    inc esi                     ; Move to next character
;    mov bl, [esi]               ; Load character into BL
;    cmp bl, 0                   ; Check for NUL terminator (Tip #1)
;    je  done                    ; If 0, end of string reached
;
;    cmp bl, al                  ; Compare current char (BL) with min (AL)
;    jae scanLoop                ; If current is Above or Equal to min, skip
;    mov al, bl                  ; Else, current is smaller, update AL (min)
;    jmp scanLoop                ; Repeat
;
;done:
;    ; Display Result
;    mov edx, OFFSET resMsg
;    call WriteString
;    call WriteChar              ; Display the character stored in AL
;    call Crlf
;    
;    exit
;main ENDP
;END main


;.data
;    p1  BYTE "Enter first character : ", 0
;    p2  BYTE "Enter second character: ", 0
;    mGT BYTE "First character is GREATER than second.", 0
;    mLT BYTE "First character is SMALLER than second.", 0
;    mEQ BYTE "Both characters are EQUAL.", 0
;
;.code
;main PROC
;    ; Get first character
;    mov edx, OFFSET p1
;    call WriteString
;    call ReadChar               ; Read key into AL (Tip #3)
;    call WriteChar              ; Echo char to screen
;    call Crlf
;    mov bl, al                  ; Save first char in BL
;
;    ; Get second character
;    mov edx, OFFSET p2
;    call WriteString
;    call ReadChar               ; Read second key into AL
;    call WriteChar              ; Echo char to screen
;    call Crlf
;
;    ; Comparison (BL vs AL)
;    cmp bl, al                  ; Compare first char to second
;    je  isEqual                 ; Jump if Equal
;    jg  isGreater               ; Jump if BL > AL
;    
;    ; If code reaches here, it is smaller
;    mov edx, OFFSET mLT
;    jmp display
;
;isEqual:
;    mov edx, OFFSET mEQ
;    jmp display
;
;isGreater:
;    mov edx, OFFSET mGT
;
;display:
;    call WriteString            ; Print the chosen message
;    call Crlf
;    exit
;main ENDP
;END main


.data
    ; Defining each line as a separate string with newline (13,10) and Null (0)
    border BYTE "==============================", 13, 10, 0
    headerTitle  BYTE "       CURRICULUM VITAE       ", 13, 10, 0
    nameL  BYTE "Name    : Muhammad Ayan Sajid", 13, 10, 0
    regL   BYTE "Reg No  : 2024-CS-661", 13, 10, 0
    emailL BYTE "Email   : muhammadayansajid2005@gmail.com", 13, 10, 0
    sep    BYTE "------------------------------", 13, 10, 0
    edu1   BYTE "EDUCATION", 13, 10, 0
    edu2   BYTE " BS Computer Science (2024-2028)", 13, 10, 0
    skill1 BYTE "SKILLS", 13, 10, 0
    skill2 BYTE " Assembly, C++, Python", 13, 10, 0

.code
main PROC
    ; Display Header
    mov edx, OFFSET border
    call WriteString
    mov edx, OFFSET headerTitle
    call WriteString
    mov edx, OFFSET border
    call WriteString
    
    ; Display Info
    mov edx, OFFSET nameL
    call WriteString
    mov edx, OFFSET regL
    call WriteString
    mov edx, OFFSET emailL
    call WriteString
    
    ; Display Education
    mov edx, OFFSET sep
    call WriteString
    mov edx, OFFSET edu1
    call WriteString
    mov edx, OFFSET edu2
    call WriteString
    mov edx, OFFSET sep
    call WriteString
    
    ; Display Skills
    mov edx, OFFSET skill1
    call WriteString
    mov edx, OFFSET skill2
    call WriteString
    mov edx, OFFSET border
    call WriteString

    exit
main ENDP
END main