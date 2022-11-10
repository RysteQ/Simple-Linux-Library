; exit with an exit code of 0
exit:
    mov rax, qword 60
    xor rdi, qword rdi
    syscall

; exit with the exit code value of rdi
exit_rdi:
    mov rax, qword 60
    syscall