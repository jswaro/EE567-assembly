all: p1q2.asm p1q2.c
	nasm -l p1q2.lst -f elf p1q2.asm
	gcc -m32 -o p1q2 p1q2.o p1q2.c

clean:
	rm *.o p1q2 *.lst
