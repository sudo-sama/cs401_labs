; This program adds value of BX 10 times
[org 0x0100]

    mov ax, 0   ; AX will Accumulate values
    mov bx, 5   ; BX has value to be Accumulated
    mov cx, 10  ; CX is number of times we want to iterate

; This is loop for accumulation
l1:
    add ax, bx  ; adds value of BX to AX and stores result in AX
    sub cx, 1   ; Decrement CX by 1
    jnz l1      ; Jump to l1 until CX becomes zero

    mov [total], ax ; Store the AX to memory with name total

    mov ax, 0x4c00  ; Program Termination
    int 0x21

; These variables are reference to Memory
total:  dw 0
