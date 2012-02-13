;           p1q1.asm
;           
;           RUN:      Linux
;           ASSEMBLE: nasm -l p1q1.lst -f elf p1q1.asm
;           LINK:     gcc -o p1q1 p1q1.o
;
;

; Equivalent statements

; Data segment
segment .data

; Un-initialized data segment
segment .bss

; Code segment
segment
.text

global main

main:

; Just some random code

	mov eax, edi
	mov ebx, 34h
	mov edi, 2

	; Return
	ret

