%include "io.inc"

section .data
Hallo DB "Hallo"

A DD 12h
B DD 1h
ERG DD 0h

section .text
global CMAIN
CMAIN:
    mov ebp, esp ; for correct debugging
    
    xor eax, eax
    MOV EAX, [A]
    MOV EBX, 12
    
    ADD EAX, EBX
    add eax, [B]
    mov [ERG], eax
    
    PRINT_HEX 4, [ERG]
    NEWLINE
    PRINT_STRING Hallo
    NEWLINE
    PRINT_DEC 4, EAX
    
    xor eax, eax
    ret