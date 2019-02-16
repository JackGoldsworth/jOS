print:
    pusha

start:
    mov al, [bx] ; Address of the string
    cmp al, 0
    je done

    mov ah, 0x0e
    int 0x10 ; interrupt

    add bx, 1
    jmp start

done:
    popa
    ret

print_n1:
    pusha

    mov ah, 0x0e
    mov al, 0x0a ; new line
    int 0x10
    mov al, 0x0d ; carriage return
    int 0x10

    popa
    ret
