section .data
    newline db 0xA

section .bss
    digit resb 1

section .text
    global _start

_start:
    mov rbx, '0'
.loop:
    cmp rbx, '9' + 1
    jge .end

    mov [digit], bl

    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    inc bl
    jmp .loop

.end:

    mov rax, 60
    xor rdi, rdi
    syscall
