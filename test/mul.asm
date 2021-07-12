%include "io.inc"

; THIS DOES NOT WORK

section .data
Z1 DD 777777777
Z2 DD 123456789
Z3 DD 3

ERG DQ 0

SAVE DD 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    ; clear registers
    xor eax, eax    
    xor ebx, ebx    
    xor ecx, ecx    
    xor edx, edx 
    
    ; move z1, z2 to eax, ebx
    mov eax, [Z1]
    mov ebx, [Z2]
    
    ; multiply eax with ebx
    mul ebx
    ; eax: smaller side of first mul
    ; edx: bigger side of first mul
    
    ; save bigger side of first mul to variable and clear edx
    mov [SAVE], edx
    ; save: bigger side of first mul
    xor edx, edx
    
    ; move z3 to ebx
    mov ebx, [Z3]
    ; multiply eax with ebx (z3)
    mul ebx
    ; eax: smaller side of mul1 and mul2
    ; edx: bigger side of mul2
    
    ; save eax to erg
    mov [ERG], eax
    
    ; move bigger side of mul1 to eax, for mul again with mul2
    mov eax, [SAVE]
    ; and save edx (bigger side of mul2)
    mov [SAVE], edx
    ; clear edx
    xor edx, edx
    ; mul2 is still in ebx, mul
    mul ebx
    
    ; no overflow this time, move eax to erg+4
    mov [ERG+4], eax
    
    ; print ERG, bigger part is saved on the right (ERG+4)
    PRINT_DEC 4, [ERG+4]
    PRINT_DEC 4, [ERG]
    
    xor eax, eax
    ret