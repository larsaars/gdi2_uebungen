%include "io.inc"

section .data
Zahl DD 12345

section .text

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    mov eax, [Zahl]
    Schleife:
        xor edx, edx
        mov ecx, 2
        div ecx
        mov ecx, eax
        PRINT_DEC 4, edx
        NEWLINE
        
        ; macro NEWLINE is too big for short jump -> jnz for long jump -> zero division flag has to be set
        cmp ecx, 0
    jnz Schleife
    ret