section .bss

; sleep.asm
struc timespec
    tv_sec: resd 1
    tv_nsec: resq 1
endstruc

; networking.asm
struc sock_addr
    sa_family: resw 1
    sa_data: resb 14
endstruc