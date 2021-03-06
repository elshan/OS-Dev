
all: $(media)
	@sudo nasm -f bin boot.asm -o boot.bin
	@sudo nasm -f bin second_boot.asm -o second.bin
	@sudo nasm -f bin shell.asm -o shell.bin
	@sudo dd if=/dev/zero of=$(media) bs=1024 count=1440 status=none
	@sudo dd if=boot.bin of=$(media) bs=512 count=1 conv=notrunc status=none
	@sudo dd if=second.bin of=$(media) bs=512 count=1 seek=1 conv=notrunc status=none
	@sudo dd if=shell.bin of=$(media) bs=512 count=1 seek=2 conv=notrunc status=none
