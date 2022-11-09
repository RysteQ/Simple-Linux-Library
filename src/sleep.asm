; sleeps for the specified amount of time in the rdx register (first 32 bits are reserved for tv_nsec and the last 32 bits for tv_sec)
sleep_rdx:
    push qword rax
    push qword rdi
    push qword rdx
    push rsi

    ; save the sleep amount (seconds and nanoseconds) to the struct
    mov [rqtp + tv_sec], dword edx
    shl rdx, 32
    mov [rqtp + tv_nsec], qword rdx

    ; sleep for the specified amount
    mov rax, qword 35
    mov rdi, rqtp
    mov rsi, rqtp
    syscall

    pop rsi
    pop qword rdx
    pop qword rdi
    pop qword rax

    ret