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
GLOBAL calculateHCValues

calculateHCValues:
	push ebp                 ; store stack base pointer
	mov ebp, esp             ; move current stack pointer to base pointer
	push ebx                 ; store current value of ebx on stack
	push ecx                 ; store current value of ecx on stack
	push edx                 ; store current value of edx on stack
        push edi                 ; store current value of edi on stack
        push esi                 ; store current value of esi on stack
        push eax                 ; store current value of eax on stack

	mov edx, [ebp + 8]	 ; store the first  argument into edx
	mov esi, [ebp + 12]      ; store the second argument into esi
	mov edi, [ebp + 16]      ; store the third  argument into edi
        mov eax, [ebp + 20]      ; store the fourth argument into eax
        mov ebx, [ebp + 24]      ; store the fifth  argument into ebx

	mov ecx, 3Fh             ; 63 decimal
        movups xmm0, [edx]       ; move x values
        movups xmm1, [esi]       ; move y values
        movaps xmm3, xmm0        ; sum of x_i
        movaps xmm4, xmm1        ; sum of y_i

        movaps xmm2, xmm1        ; mov y values into working register
        mulps xmm2, xmm0         ; multiply x_i by y_i
        movaps xmm5, xmm2        ; store result

        movaps xmm2, xmm0        ; mov x values into working register
        mulps xmm2, xmm0         ; square x_i
        movaps xmm6, xmm2        ; store result

        movaps xmm2, xmm1        ; mov y values into working regisrer
        mulps xmm2, xmm1         ; square y_i
        movaps xmm7, xmm2        ; store result
        add edx, 10h
        add esi, 10h
.firstloop:
        movups xmm0, [edx]       ; move x values
        movups xmm1, [esi]       ; move y values

        addps xmm3, xmm0         ; sum of x_i

        addps xmm4, xmm1         ; sum of y_i

        movaps xmm2, xmm1        ; mov y values into working register
        mulps xmm2, xmm0         ; multiply x_i by y_i
        addps xmm5, xmm2         ; store result

        movaps xmm2, xmm0        ; mov x values into working register
        mulps xmm2, xmm0         ; square x_i
        addps xmm6, xmm2         ; store result

        movaps xmm2, xmm1        ; mov y values into working regisrer
        mulps xmm2, xmm1         ; square y_i
        addps xmm7, xmm2         ; store result
        add edx, 10h
        add esi, 10h
        loopnz .firstloop

        ;time to sum the sums of the data
        

        
	; Return
        pop eax
        pop esi
        pop edi
	pop edx                  ; restore value of edx from stack
	pop ecx                  ; restore value of ecx from stack
	pop ebx                  ; restore value of ebx from stack
	pop ebp                  ; restore stack base pointer from stack
	ret                      ; return Z in eax
