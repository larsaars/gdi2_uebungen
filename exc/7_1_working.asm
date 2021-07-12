%include "io.inc"
section .data
ERG DQ 0
ZAHL DD 429496729
MUL1 DD 22
MUL2 DD 8
Teil1 DD 0
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here

    mov edx, 0

    ; multiplizieren:
    mov eax, [ZAHL]
    mul DWORD [MUL1]
    mov [Teil1], edx
    mov edx, 0

    mul DWORD [MUL2]
    mov [ERG+4], eax
    mov [ERG], edx
    mov eax, [MUL2]
    mul DWORD [Teil1]
    mov ecx, [ERG]
    add eax, ecx
    mov [ERG], eax


    PRINT_HEX 4, [ERG]
    PRINT_HEX 4, [ERG+4]


    xor eax, eax
    ret