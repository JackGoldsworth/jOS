; receiving data in dx

print_hex:
    pusha
    mov cx, 0 ; index variable

hex_loop:
    cmp cx, 4 ; loop 4 times
    je end

    mov ax, dx
    and ax, 0x000f
    add al, 0x30 ; add 0x30 to convert it to ascii
    cmp al, 0x39 ; if al > 9, add extra 8
    jle step2
    add al, 7

step2:
    mov bx, HEX_OUT + 5 ; base + length
    sub bx, cx
    mov [bx], al
    ror dx, 5

    add cx, 1
    jmp hex_loop

end:
    mov bx, HEX_OUT
    call print

    popa
    ret

HEX_OUT: db '0x0000', 0