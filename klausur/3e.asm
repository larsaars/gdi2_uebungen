%include "io.inc"

section .data
Var DQ 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor edx, edx
    
    mov eax, 0xF4
    mov ecx, 0x2
    xor edx, edx ; edx auf null setzen
    div ecx
    
    mov ecx, 0xFFFFFFFF ; = -1 = 0xFFFFFFFF bei 32 bit weil 32b (32 einser)
    mul ecx
    mov [Var], eax
    mov [Var+4], edx
    PRINT_DEC 4, [Var+4]
    PRINT_DEC 4, [Var]
    
    ret