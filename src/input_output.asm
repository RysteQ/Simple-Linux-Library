read_input_rsi_rdx:
    push qword rax
    push qword rdi

    xor rax, qword rax
    mov rdi, qword 1
    syscall

    pop qword rdi
    pop qword rax

    ret

print_string_rsi_rdx:
    push qword rax
    push qword rdi

    mov rax, qword 1
    mov rdi, qword 1
    syscall

    pop qword rdi
    pop qword rax

    ret

print_string_rsi:
    push qword rax
    push qword rdi
    push qword rdx
    push rsi

    xor rdx, qword rdx

    print_string_rsi_count_rdx_loop:
        cmp [rsi], byte NULL_TERMINATOR
        je print_string_rsi_print

        inc rsi
        inc rdx

        jmp print_string_rsi_count_rdx_loop

    print_string_rsi_print:
        mov rax, qword 1
        mov rdi, qword 1
        pop rsi
        syscall

    pop qword rdx
    pop qword rdi
    pop qword rax

    ret

print_number_rax:
    push qword rax
    push qword rdx
    push qword rcx
    push qword r15

    mov r15, qword 10
    xor rcx, qword rcx
    xor rdx, qword rdx

    print_number_rax_loop:
        div qword r15

        ; keep track of the numbers
        push word dx
        inc qword rcx
        xor rdx, qword rdx

        cmp rax, qword 0
        jne print_number_rax_loop

    print_number_rax_retrieve_number:
        mov rsi, number_buffer

        print_number_rax_retrieve_number_loop:
            pop word dx
            dec qword rcx

            ; save the number to the buffer
            add dl, byte 48
            mov [rsi], byte dl
            inc rsi

            cmp rcx, qword 0
            jne print_number_rax_retrieve_number_loop

    print_number_rax_print_number:
        mov rsi, number_buffer
        call print_string_rsi

    pop qword r15
    pop qword rcx
    pop qword rdx
    pop qword rax

    ret