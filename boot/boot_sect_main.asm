[org 0x7c00]
[bits 16]

    mov bp, 0x8000 ; Setting the stack so we don't overwrite the boot.
    mov sp, bp

    mov bx, 0x9000
    mov dh, 2 ; read 2 secotrs

    call disk_load

    mov dx, [0x9000] ; first loaded word
    call print_hex

    call print_n1

    mov dx, [0x9000 + 512] ; first word from second sector
    call print_hex

    jmp $

%include "./utils/print.asm"
%include "./utils/print_hex.asm"
%include "./utils/boot_sect_disk.asm"

times 510 - ($ - $$) db 0 ; Padding 0's using Current address - first address and distance from 510
dw 0xaa55 ; Putting this bad boi at the end to show it's the a boot sector.

times 256 dw 0xdada ; sector 2
times 256 dw 0xface ; sector 3