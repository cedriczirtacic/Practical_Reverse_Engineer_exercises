// Given what you learned about CALL and RET, explain how you would read
// the value of EIP? Why can’t you just do MOV EAX, EIP?
.section .text
.globl _start
_start:
    call read_eip

    //exit(0)
    xorq %rax, %rax
    movb $60, %al
    movw $0 , %di
    syscall

read_eip:
    push %rbp
    movq %rsp, %rbp
    lea (%rip), %rax
    // %rax register points to the value of %roip
    // %rip can't be mov'd because is RDONLY                
    pop %rbp
    retq
