; networking.asm
struc sock_addr
    .sa_family: resw 1
    .sa_data: resb 14
endstruc