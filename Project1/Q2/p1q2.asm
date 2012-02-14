;           p1q2.asm
;
;           RUN:      Linux
;           ASSEMBLE: nasm -l p1q2.lst -f elf p1q2.asm
;           LINK:     ld -m elf_i386 -o p1q2 p1q2.o
;
;

; Equivalent statements

; Data segment
SECTION .data
x: dw 8h

; Un-initialized data segment
SECTION .bss

; Code segment
SECTION .text
GLOBAL _function1

_function1:
	push ebp                 ; store stack base pointer
	mov ebp, esp             ; move current stack pointer to base pointer 
	push eax
	push ebx
	push ecx
	push edx


	mov esi, [ebp + 8]       ; store the first argument into esi
	mov edi, [ebp + 12]      ; store the second argument into edi

	mov ecx, 0000005Dh       ; 93 decimal

	fld dword [esi]
	fadd dword [esi + 4]
	fadd dword [esi + 8]
	fadd dword [esi + 12]
	fadd dword [esi + 16]
	fadd dword [esi + 20]
	fadd dword [esi + 24]
.loop:
	fadd dword [esi + 28]
	fld ST0 

	fild dword [x]
	fdivp
	fstp dword [edi + 28]

	fsub dword [esi]

	add esi, 04h
	add edi, 04h
	loopnz .loop

	; Return
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop ebp
	ret
