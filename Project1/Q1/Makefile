all: p1q1.asm p1q1.c
	nasm -l p1q1.lst -f elf p1q1.asm
	gcc -m32 -o p1q1 p1q1.o p1q1.c

clean:
	rm *.o p1q1 *.lst
