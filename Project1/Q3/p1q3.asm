;           p1q3.asm
;
;           RUN:      Linux
;           ASSEMBLE: nasm -l p1q3.lst -f elf p1q3.asm
;           LINK:     ld -m elf_i386 -o p1q3 p1q3.o p1q3.c
;
;

; Equivalent statements

; Data segment
SECTION .data

; Un-initialized data segment
SECTION .bss

; Code segment
SECTION .text
GLOBAL sort

sort:
	push ebp                 ; store stack base pointer
	mov ebp, esp             ; move current stack pointer to base pointer 
	push ebx                 ; store current value of ebx on stack
	push ecx                 ; store current value of ecx on stack
	push edx                 ; store current value of edx on stack

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
	mov ax, [edx]            ; move x[n] into ax
	cmp ax, 00h              ; compare x[n] with 0
	jg .ifgreater            ; if x[n] > 0, goto .ifgreater
	jl .ifless               ; if x[n] < 0, goto .ifless
	jmp .ifequal             ; otherwise, goto .ifequal

.ifgreater:
	mov [esi], ax            ; place x[n] into P[n']
	add esi, 02h             ; move n' to the next element
	jmp .endif               ; move to end of if statement

.ifless:
	mov [edi], ax            ; place x[n] into N[n']
	add edi, 02h             ; move n' to the next element
	jmp .endif               ; move to end of if statement

.ifequal:
	inc bx                   ; increment Z

.endif:
	add edx, 02h             ; move to next element of x
	loopnz .loop             ; continue while there are more elements

.end:
	mov ax, bx               ; store Z into ax
	cwde                     ; expand Z into dword

	; Return
	pop edx                  ; restore value of edx from stack
	pop ecx                  ; restore value of ecx from stack
	pop ebx                  ; restore value of ebx from stack
	pop ebp                  ; restore stack base pointer from stack
	ret                      ; return Z in eax
