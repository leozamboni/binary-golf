NASM=nasm 
NASMFLAGS=-f elf -o
LD=ld
LDFLAGS=-m elf_i386 -o

reverse:
	$(NASM) $(NASMFLAGS) reverse-elf.o reverse.asm
	$(LD) $(LDFLAGS) reverse reverse-elf.o
	./reverse

clean:
	-rm -f *.o
	-rm  reverse