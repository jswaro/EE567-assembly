;           p1q1.asm
;
;           RUN:      Linux
;           ASSEMBLE: nasm -l p1q1.lst -f elf p1q1.asm
;           LINK:     ld -m elf_i386 -o p1q1 p1q1.o
;
;

; Equivalent statements

; Data segment
SECTION .data

; Un-initialized data segment
SECTION .bss

; Code segment
SECTION .text
GLOBAL _function1

_function1:
	push ebp
	mov ebp, esp

	mov esi, [ebp + 8]
	mov edi, [ebp + 12]

	mov ecx, 0000005Dh ; 93 decimal

	mov ax, 0h
	mov al, [esi]
	cbw
	mov bx, ax

	mov al, byte [esi + 1]
	cbw
	add bx, ax

	mov al, byte [esi + 2]
	cbw
	add bx, ax

	mov al, byte [esi + 3]
	cbw
	add bx, ax

	mov al, byte [esi + 4]
	cbw
	add bx, ax

	mov al, byte [esi + 5]
	cbw
	add bx, ax

	mov al, byte [esi + 6]
	cbw
	add bx, ax

.loop:
	mov al, byte [esi + 7]
	cbw
	add ax, bx
	mov dx, ax

	mov bl, 08h
	idiv bl
	cbw
	mov [edi + 14], ax

	mov bx, dx
	mov al, byte [esi]
	cbw
	sub bx, ax

	inc esi
	inc edi
	inc edi
	loopnz .loop

	; Return
	pop ebp
	ret
