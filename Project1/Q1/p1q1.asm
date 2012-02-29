;           p1q1.asm
;
;           RUN:      Linux
;           ASSEMBLE: nasm -l p1q1.lst -f elf p1q1.asm
;           LINK:     ld -m elf_i386 -o p1q1 p1q1.o
;
;           Author: James Swaro

; Equivalent statements

; Data segment
SECTION .data

; Un-initialized data segment
SECTION .bss

; Code segment
SECTION .text
GLOBAL filter

filter:
	push ebp               ; pushing stack base onto the stack
	mov ebp, esp           ; moving stack pointer onto stack base

	mov esi, [ebp + 8]     ; moving first argument into esi
	mov edi, [ebp + 12]    ; moving second argument into edi

	mov ecx, 0000005Dh     ; 93 decimal

	mov ax, 0h             ; clearing ax
	mov al, [esi]          ; move the contents of x[n-7] into al
	cbw                    ; convert byte to word
	mov bx, ax             ; move the word value of x[n-7] into bx

	mov al, byte [esi + 1] ; move the contents of x[n-6] into al
	cbw                    ; convert byte to word
	add bx, ax             ; add x[n-7] and x[n-6], saving it into bx

	mov al, byte [esi + 2] ; move the contents of x[n-5] into al
	cbw                    ; convert byte to word
	add bx, ax             ; add sum and x[n-5], saving it into bx

	mov al, byte [esi + 3] ; move the contents of x[n-4] into al
	cbw                    ; convert byte to word
	add bx, ax             ; add sum and x[n-4], saving it into bx

	mov al, byte [esi + 4] ; move the contents of x[n-3] into al
	cbw                    ; convert byte to word
	add bx, ax             ; add sum and x[n-3], saving it into bx

	mov al, byte [esi + 5] ; move the contents of x[n-2] into al
	cbw                    ; convert byte to word
	add bx, ax             ; add sum and x[n-2], saving it into bx

	mov al, byte [esi + 6] ; move the contents of x[n-1] into al
	cbw                    ; convert byte to word
	add bx, ax             ; add sum and x[n-1], saving it into bx

.loop:
	mov al, byte [esi + 7] ; move the contents of x[n] into al
	cbw                    ; convert byte to word
	add ax, bx             ; add sum and x[n], saving it into ax
	mov dx, ax             ; save sum in dx

	mov bl, 08h            ; move 8 into bl
	idiv bl                ; divide the sum by 8
	cbw                    ; byte extend the result
	mov [edi + 14], ax     ; store result in y[n]

	mov bx, dx             ; move sum into bx
	mov al, byte [esi]     ; move x[n-7] into al
	cbw                    ; convert byte to word
	sub bx, ax             ; subtract the [n-7] from the sum

	inc esi                ; move to the next element of x
	add edi, 02h           ; move to the next element of y
	loopnz .loop           ; while not finished, loop back

	; Return
	pop ebp                ; restore base pointer
	ret                    ; return
