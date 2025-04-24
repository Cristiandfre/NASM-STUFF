section .data
section .text
global main
main:
    mov rbp, rsp; for correct debugging
    ;write your code here
    mov rbp, rsp ;for the debugger
    nop
    xor rbx, rbx
    xor rcx, rcx
    
    mov rax, 067FEh
    mov rbx, rax
    mov cl, bh
    mov ch, bl
    xchg cl, ch
    nop
    
section .bss