all: p1q3.asm p1q3.c
	nasm -l p1q3.lst -f elf p1q3.asm
	gcc -o p1q3 p1q3.o p1q3.c

clean:
	rm *.o *.lo p1q3 *.lst
