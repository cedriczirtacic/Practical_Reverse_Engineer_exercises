// Implement the following functions in x86 assembly: strset
// INFO: not in string.h
.section .data
string:
    .asciz "This is a test."
char:
    .byte 'X'

.section .text
.global _start
_start:
    movb char, %sil
    lea (string), %rdi
    call strset

    // will return string pointer

    //exit(0)
    xorq %rax, %rax
    movb $60, %al
    movw $0 , %di
    syscall

strset:
    xorq %rax, %rax
    xorq %rcx, %rcx
    movq %rdi, %rcx
    movb %sil, %al

.L01:
    cmpb $0, (%rdi)
    je .L02
    stosb
    jmp .L01
.L02:
    movq %rcx, %rax
    ret

