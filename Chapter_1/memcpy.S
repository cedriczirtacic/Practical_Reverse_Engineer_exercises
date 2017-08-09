// Implement the following functions in x86 assembly: memcpy
// XXX: this is a kinda messy approach but meh...
.section .data
string:
    .asciz "This is a test."
count:
    .byte 0x4

.section .text
.global _start
_start:
    push %rbp
    movq %rsp, %rbp

    movb count, %dl
    lea (string), %rsi
    lea -8(%rbp), %rdi
    call memcpy

    // will return pointer to start
    // of buffer in %rax

    pop %rbp

    //exit(0)
    xorq %rax, %rax
    movb $60, %al
    movw $0 , %di
    syscall

memcpy:
    xorq %rax, %rax

    sub %rdx, %rdi
    movq %rdi, %rcx
.L01:
    lodsb
    stosb
    dec %rdx
    test %rdx, %rdx
    jnz .L01

    movq %rcx, %rax
    ret

