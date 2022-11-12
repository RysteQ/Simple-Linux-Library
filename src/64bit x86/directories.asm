; gets the current working directory, rdi is the string inout and rsi is the string length input, return output to rsi string
directories_get_working_directory_rdi_rsi:
    push qword rax

    mov rax, qword 79
    syscall

    pop qword rax

    ret

; create a directory with the name of (rdi)
directories_create_directory_rdi:
    push qword rax
    push qword rsi

    mov rax, qword 83
    mov rsi, qword 777
    syscall

    pop qword rsi
    pop qword rax

    ret

directories_remove_directory_rdi:
    push qword rax

    mov rax, qword 84
    syscall

    pop qword rax

    ret