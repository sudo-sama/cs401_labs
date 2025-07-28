; A program to find largest number from an array of length 9
[org 0x0100]    

        jmp start   ; Goto start of program execution

;; These are memory variables ;;
nums:   db 2, 2, 0, 2, 0, 8, 9, 4, 3
max:    db 0

start:
        mov si, 0           ; SI starts from second value
        mov al, 0           ; Initial value of AL

    larger:
        mov [max], al       ; Move AL value to max
    
    find:
        cmp si, 9           ; Check if array had ended
        jz exit             ; if not, keep finding

        mov al, [nums+si]   ; AL stores the Array value of index SI
        inc si              ; Increment SI by one
        cmp al, [max]       ; Compare current array value with current max value
        jg larger           ; If AL contains larger value we mov AL to max

        jmp find            ; Else we check If program needs ending or no
    
    exit:    
        mov ax, 0x4c00  ; Program Termination
        int 0x21
