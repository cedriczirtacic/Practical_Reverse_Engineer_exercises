// Implement the following functions in x86 assembly: strlen
.section .data
string:
    .asciz "This is a test."

.section .text
.global _start
_start:
    lea (string), %rsi
    call strlen

    // will return string length
    // in %rax

    //exit(0)
    xorq %rax, %rax
    movb $60, %al
    movw $0 , %di
    syscall

strlen:
    xorq %rcx, %rcx
    xorq %rax, %rax
    movl $0, %ecx
.L0:
    lodsb
    cmpb $0, %al
    je .L1
    incl %ecx
    jmp .L0
.L1:
    movq %rcx, %rax
    ret

