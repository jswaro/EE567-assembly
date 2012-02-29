;           p1q2.asm
;
;           RUN:      Linux
;           ASSEMBLE: nasm -l p1q2.lst -f elf p1q2.asm
;           LINK:     ld -m elf_i386 -o p1q2 p1q2.o
;
;           Author: James Swaro

; Equivalent statements

; Data segment
SECTION .data
x: dw 08h

; Un-initialized data segment
SECTION .bss

; Code segment
SECTION .text
GLOBAL filterFloat

filterFloat:
	push ebp                 ; store stack base pointer
	mov ebp, esp             ; move current stack pointer to base pointer 
	push eax                 ; move current value of eax onto the stack
	push ebx                 ; move current value of ebx onto the stack
	push ecx                 ; move current value of ecx onto the stack
	push edx                 ; move current value of edx onto the stack


	mov esi, [ebp + 8]       ; store the first argument into esi
	mov edi, [ebp + 12]      ; store the second argument into edi

	mov ecx, 0000005Dh       ; 93 decimal

	fld dword [esi]          ; load x[n-7] into floating point stack
	fadd dword [esi + 4]     ; add x[n-7] and x[n-6]
	fadd dword [esi + 8]     ; add sum and x[n-5]
	fadd dword [esi + 12]    ; add sum and x[n-4]
	fadd dword [esi + 16]    ; add sum and x[n-3]
	fadd dword [esi + 20]    ; add sum and x[n-2]
	fadd dword [esi + 24]    ; add sum and x[n-1]
.loop:
	fadd dword [esi + 28]    ; add sum and x[n]
	fld ST0                  ; duplicate sum on the stack

	;fild dword [x]           ; move the integer '8' into stack
	fidiv dword [x]                   ; divide duplicate sum by 8 and pop 8
                                 ;   off the stack
	fstp dword [edi + 28]    ; store result of division into y[n] and 
                                 ;   pop result

	fsub dword [esi]         ; subtract x[n-7] from sum

	add esi, 04h             ; move pointer to next element of y
	add edi, 04h             ; move pointer to next element of y
	loopnz .loop             ; continue until all elements are computed

	; Return
	pop edx                  ; restore value of edx from stack
	pop ecx                  ; restore value of ecx from stack
	pop ebx                  ; restore value of ebx from stack
	pop eax                  ; restore value of eax from stack
	pop ebp                  ; restore stack base pointer from stack
	ret                      ; return
