%include "io.inc"

section .data
    A DD 1h
    B DD 2h
    C DD 3h
    ERG DD 0
    Zahl DD 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    
    Anfang:
        mov eax, [A]
        mov ebx, [B]
        mov ecx, [C]
        
        sub eax, ebx
        jo Overflow
        add eax, ecx
        jo Overflow
        
        mov DWORD [ERG], eax
        
        shl eax, 1
        jo Overflow
        mov [A], eax
        
        shl ebx, 1
        jo Overflow
        mov [B], ebx
        
        shl ecx, 1
        jo Overflow
        mov [C], ecx
    
    jmp Anfang
    Overflow:
    
    PRINT_STRING "A: "    
    PRINT_HEX 4,A    
    NEWLINE    
    PRINT_STRING "B: "    
    PRINT_HEX 4,B    
    NEWLINE    
    PRINT_STRING "C: "    
    PRINT_HEX 4,C    
    NEWLINE    
    PRINT_STRING "Ergebnis: "    
    PRINT_HEX 4,ERG    
    NEWLINE    
    PRINT_STRING "Zahl: "    
    PRINT_HEX 4,Zahl
    
    xor eax, eax
    ret