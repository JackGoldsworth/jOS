[bits 16]
[org 0x7c00] ; Location of the boot sector

mov ah, 0x0e
mov al, [msg]
int 0x10

jmp $

msg db "X", 10 ; Can only print one character

times 510-($-$$) db 0 ; pads 510 bytes with 0
dw 0xaa55 ; Adds boot number to last 2 bytes