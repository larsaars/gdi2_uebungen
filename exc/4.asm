%include "io.inc"

section .data
PROD DQ 0
MULTA DD 0ABCDEFh
MULTB DD 0FFFFFFFFh

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov ebx, [MULTB]
    mov ecx, [MULTA]
    mov eax, 0
    
    Ziel:
        add eax, ebx
    loop Ziel
    
    mov [PROD], eax
    
    PRINT_HEX 4, [PROD+4]
    PRINT_HEX 4, [PROD]
    
    xor eax, eax
    ret
    
    
; 255h * 255h = 057039h
; 0ffffh * 0ffffh = 0fffe0001h
; 10002h * 0ffffh = 0fffeh
; 0ABCDEFh * 0ABCDEFh = 0c2f2a521h
; 0ABCDEFh * 0FFFFFFFF = 0ff543211h
