%include "io.inc"

; macro for printing an array
; argument 1 is the array address (%1),
; argument 2 the length of the array (%2)
; and argument 3 the label name so that no label will be redefined (%3)
%macro PRINT_ARRAY 3
    ; loop counters
    mov edx, 0
    mov ecx, %2
    ; label for loop to jump to
    %3:
        ; save needed registers for later, printf changes them
        push edx
        push ecx
        
        ; access the array address + edx * 4 (4 * 8 bit)
        ; and move to stack one position before string finally printed
        ; (printf takes for its arguments the previous elements on stack)
        push dword [%1 + edx * 4]
        push str0
        
        call printf
        
        ; pop twice from stack to remove the two previously pushed elements
        pop eax
        pop eax
        
        ; restore loop counters
        pop ecx
        pop edx
        
        ; increase edx by one (this has to be used since ecx counts backwards)
        inc edx
    loop %3
%endmacro

section .data
; define the arrays which will be printed
pos_zahl DD 0,0,0,0,0,0,0,0,0,0
neg_zahl DD 0,0,0,0,0,0,0,0,0,0
; printf format string
str0 DB " %d",0

section .text
global CMAIN

extern printf

CMAIN:
    mov ebp, esp; for correct debugging
    
    ; call the print array macro with
    ; the address, the length of the array and the label name for the loop
    PRINT_ARRAY pos_zahl, 10, Pos_print
    NEWLINE
    PRINT_ARRAY neg_zahl, 10, Neg_print
    
    xor eax, eax
    ret