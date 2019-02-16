; load dh sectors from d1

disk_load:
    pusha ; push the general registries

    push dx

    mov ah, 0x02 ; read function
    mov al, dh ; number of sectors to read
    mov cl, 0x02 ; sector (0x01 is the boot sector, so 0x02 is the first available sector)

    mov ch, 0x00 ; cylinder
    mov dh, 0x00 ; head number

    int 0x13
    jc disk_error ; check for error

    pop dx
    cmp al, dh ; compare al to number of sectors

    jne sector_error
    popa ; pop general registries
    ret

disk_error:
    mov bx, DISK_ERROR
    call print
    call print_n1
    mov dh, ah ; ah = error code, dh = disk drive
    call print_hex
    jmp disk_loop

sector_error:
    mov bx, SECTORS_ERROR
    call print

disk_loop:
    jmp $

DISK_ERROR: db "Disk read error", 0
SECTORS_ERROR: db "Incorrect number of sectors read", 0
