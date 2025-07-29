;; This program bubble sorts a signed integer array
[org 0x0100]
    jmp start

nums:       dw -15, -30, -12, -50, 10, 20, 55, 40, 7, 0
swap_flag:  db 0

;; This Routine Sorts an List of Signed Array ;;
bubble_sort:
    push bp
    mov bp, sp
    push si
    push cx
    push bx
    push ax
    push dx

    mov bx, [bp+6]  ; BX stores the address of start of nums array
    mov cx, [bp+4]  ; CX stores length of array
    dec cx          ; CX is used for iteration and last iteration is redundant
    shl cx, 1       ; convert byte length to word

    sort_loop:
        mov si, 0               ; SI stores the starting index of Array
        mov byte [swap_flag], 0 ; Reset Swap flag

        inner_loop:
            mov ax, [bx+si]     ; Move previous value in ax
            cmp ax, [bx+si+2]   ; Compare AX with next value
            jle no_swap         ; If AX is smaller than next value then no swap is needed

            mov dx, [bx+si+2]   ; Temporarily store smaller value in DX
            mov [bx+si+2], ax   ; Put larger value in next position
            mov [bx+si], dx     ; Put smaller value in last position

            mov byte [swap_flag], 1 ; Set swap flag 

        no_swap:
            add si, 2           ; Since we comparing 2 bytes
            cmp si, cx          ; Check if SI has reached the end of Loop
            jnz inner_loop      ; if not then loop again

        cmp byte [swap_flag], 1 ; Checking if swapping happened
        jz sort_loop            ; If yes then keep sorting

    pop dx
    pop ax
    pop bx
    pop cx
    pop si
    pop bp
    ret 4

start:
    mov ax, nums    ; Move the address of first element in AX
    push ax         ; Push it on stack
    mov bx, 10      ; Move the size of array in bx
    push bx         ; Push the array size on stack
    call bubble_sort

    mov ax, 0x4c00  ; Program Termination
    int 0x21
