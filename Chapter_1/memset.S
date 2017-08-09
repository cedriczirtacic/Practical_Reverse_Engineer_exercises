// Implement the following functions in x86 assembly: memset
// XXX: this is a kinda messy approach but meh...
.section .data
count:
    .byte 0x4
char:
    .byte 'A'

.section .text
.global _start
_start:
    push %rbp
    movq %rsp, %rbp

    movb count, %dl
    movb char, %sil
    lea -8(%rbp), %rdi
    call memset

    // will return pointer to start
    // of buffer in %rax

    pop %rbp

    //exit(0)
    xorq %rax, %rax
    movb $60, %al
    movw $0 , %di
    syscall

memset:
    xorq %rax, %rax
    movb %sil, %al
    movb %dl, %cl

    sub %rcx, %rdi
    movq %rdi, %rdx
    repz stosb

    movq %rdx, %rax
    ret

