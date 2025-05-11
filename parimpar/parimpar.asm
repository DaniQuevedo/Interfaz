section .data
    even_msg    db "Es par", 0xA
    even_len    equ $ - even_msg
    odd_msg     db "Es impar", 0xA
    odd_len     equ $ - odd_msg

section .text
    global _start

_start:
    mov rax, 17
    test rax, 1
    jz .even

.odd:
    mov rax, 1
    mov rdi, 1
    mov rsi, odd_msg
    mov rdx, odd_len
    syscall
    jmp .exit

.even:
    mov rax, 1
    mov rdi, 1
    mov rsi, even_msg
    mov rdx, even_len
    syscall

.exit:
    mov rax, 60
    xor rdi, rdi
    syscall
