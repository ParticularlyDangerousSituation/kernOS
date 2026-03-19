# kernOS

a kernel operating system
run this in your terminal

nasm -f bin src/boot.asm -o boot.bin
nasm -f bin src/kernel.asm -o kernel.bin
cat boot.bin kernel.bin > kernOS.img
truncate -s 1440k kernOS.img
qemu-system-x86_64 -drive format=raw,file=kernOS.img,if=floppy
