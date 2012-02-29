all: proj2.asm proj2.c
	nasm -l proj2.lst -f elf proj2.asm
	gcc -msse -o proj2 proj2.o proj2.c

clean:
	rm *.o *.lo proj2 *.lst
