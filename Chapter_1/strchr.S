// Implement the following functions in x86 assembly: strchr
.section .data
string:
    .asciz "This is a test."
char:
    .byte 'i'

.section .text
.global _start
_start:
    lea (string), %rsi
    call strchr

    // will return string pointer
    // in %rax if found or NULL

    //exit(0)
    xorq %rax, %rax
    movb $60, %al
    movw $0 , %di
    syscall

strchr:
    xorq %rax, %rax
.L0:
    lodsb
    cmpb char, %al
    je .L1
    cmpb $0, %al
    je .L2
    jmp .L0
.L1:
    movq %rsi, %rax
    ret
.L2:
    xorq %rax, %rax
    ret

