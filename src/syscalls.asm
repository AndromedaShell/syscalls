section .data
    SYS_EXIT equ 60
    SYS_WRITE equ 1
    SYS_READ equ 0

    STDOUT equ 1
    STDIN equ 0

    message db 'HALO, EVERNYAN :3', 0xA
    messageLen equ $-message

section .bss
    buffer resb 32

section .text
    global _start

_start:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, message
    mov rdx, messageLen
    syscall

    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, buffer
    mov rdx, 32
    syscall

    cmp rax, 0
    jl exit_program

    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall

exit_program:
    mov rax, SYS_EXIT
    mov rdi, 1
    syscall
