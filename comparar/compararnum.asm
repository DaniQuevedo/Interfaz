section .data
    msg_menor db "El numero en  el registro eax es menor que ebx", 0xA
    len_menor equ $ - msg_menor

    msg_igual db "El numero en el registro eax es igual a ebx", 0xA
    len_igual equ $ - msg_igual

    msg_mayor db "El numero en el registro eax es mayor que ebx", 0xA
    len_mayor equ $ - msg_mayor

section .text
    global _start

_start:
    mov eax, 10
    mov ebx, 20

    cmp eax, ebx
    jl menor
    jg mayor

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_igual
    mov edx, len_igual
    int 0x80
    jmp salir

menor:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_menor
    mov edx, len_menor
    int 0x80
    jmp salir

mayor:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_mayor
    mov edx, len_mayor
    int 0x80

salir:
    mov eax, 1
    xor ebx, ebx
    int 0x80
