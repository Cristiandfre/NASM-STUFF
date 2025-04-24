section .data
    Snippet db "KANGAROO"
section .text
global main
main:
    mov rbp, rsp; for correct debugging
    ;Put your experiments between the two nops...
    nop
    mov rbx, Snippet
    mov rax, 8
DoMore: add byte [rbx], 32
    inc rbx
    dec rax
    jnz DoMore
    
    nop
    ;Put your experiments between the two nops...
section .bss