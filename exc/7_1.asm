%include "io.inc"

; FUNKTIONIERT NICHT WARUM AUCH IMMER
; denk mal das ist zu unwichtig
; hab mich jetzt ewig damit beschäftigt aber kein plan

section .data    
ERG DQ 0    
Z1 DD 429496729    
Z2 DD 22    
Z3 DD 8    
   
SAVE DD 0

section .text

global CMAIN
CMAIN:    
    mov ebp, esp; for correct debugging    
    ;write your code here    
    xor eax, eax    
    xor ebx, ebx    
    xor ecx, ecx    
    xor edx, edx    
    
    ; multiply 
    mov eax, [Z1]    
    mul dword [Z2]    
    mov [SAVE], edx    
    xor edx, edx    
    mul dword [Z3]    
    mov [ERG], eax    
    mov eax, [SAVE]    
    mov [SAVE], edx    
    xor edx, edx    
    mul dword [Z2]    
    add eax, [SAVE]   
    mov [ERG+4], eax
    
    xor eax, eax    
    ret
