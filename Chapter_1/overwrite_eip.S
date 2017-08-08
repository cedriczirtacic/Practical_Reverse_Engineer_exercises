// Come up with at least two code sequences to set EIP to 0xAABBCCDD.
.section .text
.global _start
_start:
    movq    $0xaabbccddeeff0011, %rax
    pushq    %rax
    retq
    // segmentation fault
