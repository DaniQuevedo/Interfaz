section .data
    msg db "Cuadrado: ", 0
    len equ $ - msg
    newline db 0xA

section .bss
    buffer resb 16

section .text
    global _start

_start:
    mov r12, 1
    mov rcx, 10

.print_loop:
    mov rax, r12
    imul rax, r12

    push rcx
    push rax

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    pop rax
    call print_number

    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    pop rcx
    inc r12
    loop .print_loop

    mov rax, 60
    xor rdi, rdi
    syscall

print_number:
    mov rbx, 10
    lea rdi, [buffer+15]
    mov byte [rdi], 0

.convert:
    xor rdx, rdx
    div rbx
    add dl, '0'
    dec rdi
    mov [rdi], dl
    test rax, rax
    jnz .convert

    mov rsi, rdi
    mov rdx, buffer+16
    sub rdx, rdi

    mov rax, 1
    mov rdi, 1
    syscall
    ret

