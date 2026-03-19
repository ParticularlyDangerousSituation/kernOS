[BITS 16]
[org 0x1000]

start:
    mov si, msg
    call print

shell_loop:
    mov ah, 0x00
    int 0x16

    mov ah, 0x0e
    int 0x10

    jmp shell_loop

print:
    mov ah, 0x0e
.l:
    lodsb
    cmp al, 0
    je .d
    int 0x10
    jmp .l
.d:
    ret

msg db 'kernOS 1.0 Ready.', 0x0D, 0x0A, 0

times 512 db 0
