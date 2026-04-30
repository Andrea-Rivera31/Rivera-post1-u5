org 0x100
section .data
    prompt db "Ingrese una letra: $"
    msg_ok db 0Dh, 0Ah, "Caracter recibido: $"
    msg_cod db 0Dh, 0Ah, "Codigo ASCII (hex): $"
    nl db 0Dh, 0Ah, "$"

section .text
    ; Mostrar prompt
    mov ah, 09h
    mov dx, prompt
    int 21h

    ; Leer caracter sin eco (función 07h)
    mov ah, 07h
    int 21h
    mov bl, al  ; Guardar en BL

    ; Mostrar eco
    mov ah, 09h
    mov dx, msg_ok
    int 21h
    mov ah, 02h
    mov dl, bl
    int 21h

    ; Mostrar HEX (parte alta)
    mov ah, 09h
    mov dx, msg_cod
    int 21h
    
    mov al, bl
    shr al, 4
    call print_hex_nibble
    
    ; Mostrar HEX (parte baja)
    mov al, bl
    and al, 0Fh
    call print_hex_nibble

    mov ax, 4C00h
    int 21h

print_hex_nibble:
    cmp al, 9
    jle .es_numero
    add al, 7
.es_numero:
    add al, 30h
    mov ah, 02h
    mov dl, al
    int 21h
    ret