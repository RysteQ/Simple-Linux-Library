; checks if the file can be opened with 0666o permissions
can_access_rsi:
    push qword rax
    push qword rdx

    ; move the value of zero (false)
    mov [can_access], byte 0

    ; check if the file can be accessed
    mov rax, qword 21
    mov rdx, qword 0666o
    syscall

    ; move the result to the can_access memory location
    mov [can_access], byte al

    ; retrieve previously saved values
    pop qword rdx
    pop qword rax

    ret

; open the file with the name saved in the rdi register with the rsi flags
open_file_rdi_rsi:
    push qword rax
    push qword rdx

    ; open the file
    mov rax, qword 2
    mov rdx, qword 0666o
    syscall

    ; save the file descriptor
    mov [file_descriptor], qword rax

    ; pop the previously saved value
    pop qword rdx
    pop qword rax

    ret

; write the rsi contents to the file, the rdx is needed for the length of the contents
write_file_rsi_rdx:
    push qword rax
    push qword rdi

    ; write to the file
    mov rax, qword 1
    mov rdi, qword [file_descriptor]
    syscall

    ; pop the previously saved values
    pop qword rdi
    pop qword rax

    ret

; write the rsi contents to the file
write_file_rsi:
    push qword rax
    push qword rdi
    push qword rdx
    push rsi

    xor rdi, qword rdx

    ; get the length of the string
    write_file_rsi_get_rsi_length_loop:
        inc rsi
        inc qword rdx

        cmp [rsi], byte NULL_TERMINATOR
        jne write_file_rsi_get_rsi_length_loop

    ; write to the file
    mov rax, qword 1
    mov rdi, qword [file_descriptor]
    pop rsi
    syscall

    ; pop the previously saved values
    pop qword rdx
    pop qword rdi
    pop qword rax

    ret

; read file contents to the rsi register with the maximum length of rdx
read_file_rsi_rdx:
    push qword rax
    push qword rdi

    xor rax, qword rax
    mov rdi, qword [file_descriptor]
    syscall

    ; pop the previously saved values
    pop qword rdi
    pop qword rax

    ret

; close the file
close_file:
    push qword rax
    push qword rdi

    ; close the file
    mov rax, qword 3
    mov rdi, qword [file_descriptor]
    syscall

    ; pop the previously saved values
    pop qword rdi
    pop qword rax

    ret