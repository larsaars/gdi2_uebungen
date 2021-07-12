%include "io.inc"

section .data
Zahl1 DD 0xFFF
Zahl2 DD 0xFFF
Fl DD 0x0

section .text

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
      
    mov eax, [Zahl1]
    add eax, [Zahl2]
    
    jc CarryFlagSet
    
    PRINT_STRING "carry flag not set"
    
    xor eax, eax
    ret
    
CarryFlagSet:
    PRINT_STRING "carry flag set"
    xor eax, eax
    ret