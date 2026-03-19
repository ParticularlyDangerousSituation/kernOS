org 0x7C00
[BITS 16]

start:
	cli

.loop  
	hlt	;  halts the cpu
	jmp .loop	; wakes up when a interuption wakes it and then jumps to halt again

times 510-($-$$) db ; this fills the rest of the 512 bytes with zeros
dw 0xAA55	; the signature
