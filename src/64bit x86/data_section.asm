section .data

; input_output.asm
number_buffer: times 20 db 0

; files.asm
file_descriptor: dq 0
can_access: db 0

; networking.asm
socket_descriptor: dq 0

; sleep.asm
rqtp:
    istruc timespec
        at tv_sec, dd 0
        at tv_nsec, dq 0
    iend