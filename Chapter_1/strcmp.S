// Implement the following functions in x86 assembly: strcmp
.section .data
string1:
    .asciz "This is a test."
string2:
    .asciz "This is A test."

.section .text
.global _start
_start:
    lea (string2), %rdi
    lea (string1), %rsi
    call strcmp

    // will return %rax = $0 if equal
    // or diff char in source (%rsi)

    //exit(0)
    xorq %rax, %rax
    movb $60, %al
    movw $0 , %di
    syscall

strcmp:
    xorq %rax, %rax
    
.L01:
    lodsb
    cmpb $0, %al
    je .L02
    scasb
    je .L01

.L02:
    ret

