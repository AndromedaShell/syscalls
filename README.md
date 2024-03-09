# 👹 syscalls 

- **Simple syscalls written in asm ‼️**

# ❓ How it works

```here is a brief explanation :```

``` we have three sections : .data / .bss and .text ```

# 🔴 .data section

```.data Section

This section is used for declaring initialized data or constants

    SYS_EXIT equ 60: defines the system call number for exiting a program
    SYS_WRITE equ 1: defines the system call number for writing to a file descriptor
    SYS_READ equ 0: defines the system call number for reading from a file descriptor
    STDOUT equ 1: defines the file descriptor for standard output
    STDIN equ 0: defines the file descriptor for standard input
    message db 'HALO, EVERNYAN :3', 0xA: declares a null-terminated string to be printed to the standard output.
    messageLen equ $-message: calculates the length of the message
```

# 🔵 .bss section 

```we use this section to declare uninitialized data```

``buffer resb 32: reserves 32 bytes of space for a buffer to store input from the user``

# 🟣 .text section

``` This section contains the code that will be executed :3 ```

`` global _start: makes the _start label visible to the linker, marking it as the entry point of the program ``


# ⁉️ But how does it all work 

```The program starts by moving the system call number for writing (SYS_WRITE) into the rax register, the file descriptor for standard output (STDOUT) into rdi, the address of the message into rsi, and the length of the message into rdx, It then performs a system call to write the message to the standard output```

```Next, it moves the system call number for reading (SYS_READ) into rax, the file descriptor for standard input (STDIN) into rdi, the address of the buffer into rsi, and the size of the buffer into rdx, then performs a system call to read up to 32 bytes of input from the user into the buffer.```

```After reading, it compares the number of bytes read (rax) to 0. If the number of bytes read is less than 0 (which indicates an error), it jumps to the exit_program label, if no error occurrs, it moves the system call number for exiting (SYS_EXIT) into rax, clears rdi (sets the exit status to 0), and performs a system call to exit the program.```

```     If an error occurrs during reading, it moves the system call number for exiting into rax, sets rdi to 1 (which also indicates an error ^^), and performs a system call to exit the program with the error code.```

# 💤 Conclusion

- **The program demonstrates basic input/output operations in assembly using linux syscalls. It's a good starting point for understanding how to interact with the operating system at a low level.**
