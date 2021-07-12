%include "io.inc"

section .data
DIV_BY_TEN DD 10
RES DQ 0

FMT DB "%d%d", 0

section .text

global CMAIN

extern printf

CMAIN:
    mov ebp, esp; for correct debugging
    
    ; clear registers
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    
    ; read in action and numbers
    GET_CHAR edx
    ;  + 0x2b
    ;  - 0x2d
    ;  * 0x2a
    ;  / 0x2f
    ;  % 0x25
    GET_UDEC 4, eax
    GET_UDEC 4, ebx
    
    ; compare, jump on equals to specific tag
    cmp edx, 0x2b
    je Add0
    cmp edx, 0x2d
    je Sub0
    cmp edx, 0x2a
    je Mul0
    cmp edx, 0x2f
    je Div0
    cmp edx, 0x25
    je Mod0
    
    ; if no operator works, jump to error
    jmp Error
    
    
    ; do operations
    Add0:
        xor edx, edx
        add eax, ebx
        jmp Exit
        
    Sub0:
        xor edx, edx
        sub eax, ebx
        jmp Exit
        
    Mul0:
        xor edx, edx
        mul ebx
        jmp Exit
     
    Div0:
        xor edx, edx
        div ebx
        xor edx, edx
        
        jmp Exit
        
    Mod0:
        xor edx, edx
        div ebx
        mov eax, edx
        xor edx, edx
    
        jmp Exit
    
    Exit:
        ; move result to variable
        mov dword [RES], eax
        mov dword [RES+4], edx
    
        ; clear the counter reg
        xor ecx, ecx
        
        Horner:   
            xor edx, edx    
            mov eax, [RES+4]    
            div dword [DIV_BY_TEN]    
            mov [RES+4], eax    
            mov eax, [RES]    
            div dword [DIV_BY_TEN]    
            mov [RES], eax    
            push edx    
            inc ecx    
            mov ebx,[RES]    
            cmp ebx,0    
        jnz Horner    
            mov ebx,[RES+4]    
            cmp ebx,0    
        jnz Horner   
            
        Print_Stack:   
            pop ebx    
            PRINT_HEX 4, ebx    
        loop Print_Stack
        
        ; clear stack
        mov esp, ebp
        
        xor eax, eax
        ret
    
    
    Error:
        PRINT_STRING "unsupported operator"
        xor eax, eax
        ret
    
    