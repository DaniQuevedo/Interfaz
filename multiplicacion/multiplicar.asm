section .data
    msg_mul     db "Multiplicacion: ", 0
    len_mul     equ $ - msg_mul
    newline     db 0xA

section .bss
    buffer resb 16

section .text
    global _start

_start:
    mov rsi, 20
    mov rdi, 5
    mov rax, rsi
    imul rax, rdi        
    
    push rax             
    
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_mul
    mov rdx, len_mul
    syscall            
    
    pop rax             
    call print_result    
    
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall           
    
    mov rax, 60
    xor rdi, rdi
    syscall         

print_result:
    mov rcx, 10
    lea rbx, [buffer+15]
    mov byte [rbx], 0
    
.convert_loop:
    xor rdx, rdx
    div rcx
    add dl, '0'
    dec rbx
    mov [rbx], dl
    test rax, rax
    jnz .convert_loop
    
    mov rsi, rbx
    mov rdx, buffer+16
    sub rdx, rbx
    
    mov rax, 1
    mov rdi, 1
    syscall
    ret
