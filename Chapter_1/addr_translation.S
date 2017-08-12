// Perform a few virtual address to physical address translations
// yourself and verify the result with a kernel debugger.
.section .data
// arch/alpha/include/asm/io.h
// identity mapping offset
IDENT_ADDR:
    .int 0xffff8
.section .text
.global _start
_start:
    movq IDENT_ADDR, %rcx
    shl $0x2c, %rcx

    movq %rcx, %rsi
    movq %rsp, %rdi
    call virt_to_phys
    nop
    
    movq %rax, %rdi
    call phys_to_virt
    nop

    //exit(0)
    xorq %rax, %rax
    movb $60, %al
    movw $0 , %di
    syscall

// virt_to_phys(UL address %rdi, UL offset %rsi) = %rax
virt_to_phys:
    subq %rsi, %rdi
    movq %rdi, %rax
    retq

// phys_to_virt(UL address %rdi, UL offset %rsi) = %rax
phys_to_virt:
    addq %rsi, %rdi
    movq %rdi, %rax
    retq

