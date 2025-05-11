section .data
    msg_result db "Resultado: ", 0
    len_result equ $ - msg_result

    newline db 0xA

section .bss
    buffer resb 3

section .text
    global _start

_start:
    mov rax, 25
    sub rax, 10

    mov rcx, 10
    xor rdx, rdx
    div rcx

    add al, '0'
    mov byte [buffer], al
    add dl, '0'
    mov byte [buffer+1], dl
    mov byte [buffer+2], 0xA

    mov rax, 1
    mov rdi, 1
    mov rsi, msg_result
    mov rdx, len_result
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 3
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
