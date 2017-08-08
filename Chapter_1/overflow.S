// What happens when the return value does not fi t in a
// 64-bit register?
.section .data
num1:
    .quad 0xffffffffffffffff
num2:
    .byte 0x2

.section .text
.globl _start
_start:
    movq num1, %rax
    movq num2, %rcx
    mulq %rcx
    // %rdx:%rax will be overwritten with the
    // overflowing data

    //exit(0)
    xorq %rax, %rax
    movb $60, %al
    movw $0 , %di
    syscall
