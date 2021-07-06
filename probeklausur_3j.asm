%include "io.inc"

section .data
Zahl1 DD 0xFFF
Zahl2 DD 0xFFF

section .text

CarryFlagSet:
    PRINT_STRING "carry flag is set"
    ret
    
CarryFlatNotSet:
    PRINT_STRING "carry flag is not set"
    ret

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
        
    mov eax, [Zahl1]
    add eax, [Zahl2]
    
    
    jnc CarryFlatNotSet
    jc CarryFlagSet
    
    xor eax, eax
    ret