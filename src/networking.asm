socket_rdi_rsi_rdx:
    push qword rax

    ; create the socket
    mov rax, qword 41
    syscall

    ; save the socket
    mov [socket_descriptor], qword rax

    pop qword rax

    ret

connect_rdi_rsi_rdx:
    push qword rax
    
    ; TODO
    mov rax, qword 42
    syscall

    pop qword rax

    ret