%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    mov eax, 3h
    mov ebx, 4h
    mul ebx
    
    PRINT_HEX 4, eax
    NEWLINE
    
    xor edx, edx
    mov eax, 3h
    mov ebx, 2h
    
    div ebx
    
    PRINT_HEX 4, eax
    NEWLINE
    PRINT_HEX 4, edx
    
    
    xor eax, eax
    ret