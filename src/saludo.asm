org 0x100
section .data
    msg db "Laboratorio 5 DOSBox y Ensamblador", 0Dh, 0Ah
        db "Estudiante: Rivera", 0Dh, 0Ah
        db "Unidad 5 Arquitectura de Computadores", 0Dh, 0Ah, "$"

section .text
    mov ah, 09h
    mov dx, msg
    int 21h

    ; Terminar programa
    mov ax, 4C00h
    int 21h