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

; Un-initialized data segment
SECTION .bss

; Code segment
SECTION .text
GLOBAL _function1

_function1:
	push ebp                 ; store stack base pointer
	mov ebp, esp             ; move current stack pointer to base pointer 
	push ebx
	push ecx
	push edx

	mov edx, [ebp + 8]	 ; store the first  argument into edx
	mov esi, [ebp + 12]      ; store the second argument into esi
	mov edi, [ebp + 16]      ; store the third  argument into edi

	mov ecx, 64h             ; 100 decimal
.clear:
	mov word [esi], 00h      ; clear an element of x
	mov word [edi], 00h      ; clear an element of y

	add esi, 02h             ; move the pointer forward to the next element
	add edi, 02h             ; move the pointer forward to the next element
	loopnz .clear            ; continue while elements not cleared

	mov esi, [ebp + 12]      ; rebase x index
	mov edi, [ebp + 16]      ; rebase y index
	mov ecx, 64h             ; 100 decimal
	mov bx, 00h              ; counter for Z
.loop:
	mov ax, [edx]
	cmp ax, 00h
	jg .ifgreater
	jl .ifless
	jmp .ifequal

.ifgreater:
	mov [esi], ax
	add esi, 02h
	jmp .endif

.ifless:
	mov [edi], ax
	add edi, 02h
	jmp .endif

.ifequal:
	inc bx

.endif:
	add edx, 02h
	loopnz .loop

.end:
	mov ax, bx
	cwde

	; Return
	pop edx
	pop ecx
	pop ebx
	pop ebp
	ret
