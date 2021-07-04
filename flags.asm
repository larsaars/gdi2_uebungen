%include "io.inc"

section .data
A DD 12h
B DD 1h
ERG DD 0h

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    xor eax, eax
    MOV EAX, [A]
    MOV EBX, 12
    
    ADD EAX, EBX
    add eax, [B]
    mov [ERG], eax
    
    mov eax, 10001011b
    push eax
    popf
    
    ret