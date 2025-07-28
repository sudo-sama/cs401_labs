; A program to add three numbers using AX and BX
[org 0x0100]    ; Tells the IP where the execution starts

mov ax, 10      ; Place 10 in AX register
mov bx, 5       ; Place 5 in BX resgiter
add ax, bx      ; Add values in AX and BX and store result in AX
mov bx, 15      ; Place 15 in BX register
add ax, bx      ; Add values of AX and BX and store result in AX

mov ax, 0x4c00  ; Terminate Program
int 0x21
