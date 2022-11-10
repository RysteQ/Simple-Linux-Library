; kills the process with the pid specified in the rdi registed
process_kill_process_rdi:
    push qword rax
    push qword rsi

    ; kill the process
    mov rax, qword 62
    mov rsi, qword 1
    syscall

    ; retrieve previously saved values
    pop qword rsi
    pop qword rax

    ret