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
align 16

total: resq 4

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

    mov edx, [ebp + 8]	     ; store the first  argument into edx
    mov esi, [ebp + 12]      ; store the second argument into esi
    mov edi, [ebp + 16]      ; store the third  argument into edi
    mov eax, [ebp + 20]      ; store the fourth argument into eax
    mov ebx, [ebp + 24]      ; store the fifth  argument into ebx

    mov [total], dword 00h
    mov [total + 4], dword 00h
    mov [total + 8], dword 00h
    mov [total + 12], dword 00h

    call firstloop

    call secondloop

    ; Return
    pop eax
    pop esi
    pop edi
    pop edx                  ; restore value of edx from stack
    pop ecx                  ; restore value of ecx from stack
    pop ebx                  ; restore value of ebx from stack
    pop ebp                  ; restore stack base pointer from stack
    ret                      ; return Z in eax


sum:
    fld  dword [total]
    fadd dword [total + 4]
    fadd dword [total + 8]
    fadd dword [total + 12]
    fstp  dword [total]
    ret

firstloop:
    mov ecx, 255             ;
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
    add edx, 10h             ; move to next 4 values
    add esi, 10h             ; move to next 4 values
    loopnz .firstloop        ; continue while data left

    mov edx, [ebp + 8]       ; restore x initial position
    mov esi, [ebp + 12]      ; restore y initial position

    ;time to sum the sums of the data
    movups [total] , xmm3
    call sum
    mov eax, [total]
    mov [ebx], eax

    movups [total], xmm4
    call sum
    mov eax, [total]
    mov [ebx + 4], eax

    mov eax, [ebp + 20]

    movups [total], xmm5
    call sum
    mov ebx, [total]
    mov [eax + 4], ebx

    movups [total], xmm6
    call sum
    mov ebx, [total]
    mov [eax], ebx

    movups [total], xmm7
    call sum
    mov ebx, [total]
    mov [eax + 12], ebx

    mov ebx, [ebp + 24]
    ret

secondloop:
    ; start of second run through

    mov ecx, 255             ; 255 decimal
    movups xmm0, [edx]       ; move x values
    movups xmm1, [esi]       ; move y values
    movups xmm3, [edi]       ; move z values

    movaps xmm4, xmm3        ; sum of z_i

    movaps xmm2, xmm0        ; mov x values into working register
    mulps xmm2, xmm3         ; multiply x_i by z_i
    movaps xmm5, xmm2        ; store result

    movaps xmm2, xmm3        ; mov z values into working register
    mulps xmm2, xmm3         ; square z_i
    movaps xmm6, xmm2        ; store result

    movaps xmm2, xmm1        ; mov y values into working regisrer
    mulps xmm2, xmm3         ; multiply y_i by z_i
    movaps xmm7, xmm2        ; store result
    add edx, 10h             ; move to next 4 values
    add esi, 10h             ; move to next 4 values
    add edi, 10h             ; move to next 4 values

.secondloop:
    movups xmm0, [edx]       ; move x values
    movups xmm1, [esi]       ; move y values
    movups xmm3, [edi]       ; move z values

    addps xmm4, xmm3         ; sum of z_i

    movaps xmm2, xmm0        ; mov y values into working register
    mulps xmm2, xmm3         ; multiply x_i by z_i
    addps xmm5, xmm2         ; sum result

    movaps xmm2, xmm3        ; mov z values into working register
    mulps xmm2, xmm3         ; square z_i
    addps xmm6, xmm2         ; sum result

    movaps xmm2, xmm1        ; mov y values into working regisrer
    mulps xmm2, xmm3         ; multiply y_i by z_i
    addps xmm7, xmm2         ; sum result

    add edx, 10h             ; move to next 4 values
    add esi, 10h             ; move to next 4 values
    add edi, 10h             ; move to next 4 values
    loopnz .secondloop       ; continue while data left

    mov edx, [ebp + 8]       ; restore x initial position
    mov esi, [ebp + 12]      ; restore y initial position
    mov edi, [ebp + 16]      ; restore z initial position

    ;time to sum the sums of the data
    movups [total] , xmm4
    call sum
    mov eax, [total]
    mov [ebx + 8], eax

    mov eax, [ebp + 20]

    movups [total], xmm5
    call sum
    mov ebx, [total]
    mov [eax + 8], ebx

    movups [total], xmm6
    call sum
    mov ebx, [total]
    mov [eax + 20], ebx

    movups [total], xmm7
    call sum
    mov ebx, [total]
    mov [eax + 16], ebx

    mov ebx, [ebp + 24]
    ret



