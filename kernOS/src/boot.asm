[BITS 16]
[org 0x7c00]

KERNEL_OFFSET equ 0x1000

start:
    mov [BOOT_DRIVE], dl

    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov bp, 0x9000
    mov sp, bp

    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov dh, 0
    mov cl, 2
    mov bx, KERNEL_OFFSET
    int 0x13
    
    jc error
    jmp KERNEL_OFFSET

error:
    mov ah, 0x0e
    mov al, 'E'
    int 0x10
    jmp $

BOOT_DRIVE db 0
times 510-($-$$) db 0
dw 0xaa55
