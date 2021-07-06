%include "io.inc"

section .data
Zahl DD 0x12
String DB "Die Zahl lautet: %d", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push Zahl
    push String
    
    call printf
    
    mov esp, ebp
    
    xor eax, eax
    
    ret
