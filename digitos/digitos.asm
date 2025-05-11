section .data
    msg     db "Cantidad de digitos: ", 0
    len     equ $ - msg
    newline db 0xA

section .bss
    buffer resb 16

section .text
    global _start

_start:
    mov rax, 12345
    call count_digits

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

    mov rax, 60
    xor rdi, rdi
    syscall

count_digits:
    mov rcx, 0
    mov rbx, 10

.loop:
    inc rcx
    xor rdx, rdx
    div rbx
    test rax, rax
    jnz .loop

    mov rax, rcx
    ret

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
