;; Program to sum all numbers of an array
[org 0x0100]

    jmp start
    
nums:   db 2, 2, 0, 2, 0, 8, 9, 4, 3
sum:    db 0

start:
    mov al, 0   ; We store initial value zero in al
    mov si, 0   ; SI contains index of nums

    loop1:
        mov byte al, [nums+si]  ; Store value in AL
        add byte [sum], al      ; Accumulate value in sum
        inc si                  ; Move SI to next index
        cmp si, 9               ; Check if array has extended
        jnz loop1               ; If Not then loop

    mov ax, 0x4c00  ; Program Termination
    int 0x21
