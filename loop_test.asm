%include "io.inc"

section .text
global CMAIN
CMAIN:

    jmp After_Loop


    Before_Loop:

    mov ecx, 15
    Loop_Tag:
    
        push ecx
        PRINT_DEC 4, ecx
        NEWLINE
        pop ecx
        
        dec ecx
    jnz Loop_Tag  ; jnz jumps when the zero flag is not set; the zero flag will get set if an add, sub, inc or dec command leads to a variable being zero
    ; so basically decreasing ecx will let jnz jump until 'dec ecx' leads to ecx being zero; this is why this works
    
    jmp After_After_Other_Instructions
    
    After_Loop:
    PRINT_STRING "do stuff"
    NEWLINE
    PRINT_STRING "then execute loop"
    NEWLINE
    
    jmp Before_Loop
    
    After_After_Other_Instructions:
    PRINT_STRING "then do other stuff"
    NEWLINE
    
    xor eax, eax
    ret