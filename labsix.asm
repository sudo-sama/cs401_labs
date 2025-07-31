;; This program multiplies first three digits of VUID (BC123456789) with last three digits ;;
[org 0x0100]
    jmp start   ; Jump to start of Execution

first:  dd 123  ; Multiplicand of 4 Bytes
last:   dw 789  ; Multiplier of 2 Bytes
result: dd 0    ; Store result in 4 Bytes


start:  ;;; Program Execution Starts From Here ;;;
    mov dx, [last]      ; Load Multiplier in DX
    mov bx, first       ; Load Multiplicand in BX
    mov cx, 16          ; Load 16 in CX since its 16-bit multiplication

    checkbit:
        shr dx, 1       ; Shift the right most bit to carry flag
        jnc skip        ; If flag contains 0 then skip adding

    mov ax, [bx]        ; Move Value of DX to AX
    add [result], ax    ; Add AX to first two bytes of result
    mov ax, [bx+2]      ; Then move move the next two bytes of result to AX
    adc [result+2], ax  ; Add the carry to result and then the AX value

    skip:
        shl word [bx], 1    ; Add a zero to right side and shift biths to left side
        rcl word [bx+2], 1  ; Insert carry to right most side and shift bits to left
        dec cx              ; Decrement CX
        jnz checkbit        ; If CX becomes zero then that means 16-bit multiplication is complete

    mov ax, 0x4c00  ; Program Termination
    int 0x21
