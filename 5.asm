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
        
        ; call external printf
        call printf
        
        ; pop twice from stack to remove the two previously pushed elements
        pop eax
        pop eax
        
        ; restore loop counters
        pop ecx
        pop edx
        
        ; increase edx by one (this has to be used since ecx counts backwards)
        inc edx
        ; decrease ecx since since jnz is being used 
        ; as the command 'loop' cannot jump more than 127 bytes
        ; https://stackoverflow.com/a/12147872/5899585
        dec ecx
    jnz %3
%endmacro


; macro to fill array with numbers (backwards)
; argument 1 is the array address (%1)
; argument 2 the length of the array (%2)
; argument 3 is the end of the counter (decreasing values; end is inclusive) (%3)
; and argument 4 the label name so that no label will be redefined (%4)
%macro FILL_ARRAY 4
    ; loop counters
    mov ecx, %2
    mov edx, %3
    
    ; loop label to jump to
    %4:
        ; move to current array address the value of edx
        mov dword [%1 + ecx * 4], edx
        ; decrease edx every looping
        dec edx
    loop %4
%endmacro


section .data
; define the arrays which will be printed
pos_nums DD 0,0,0,0,0,0,0,0,0,0
neg_nums DD 0,0,0,0,0,0,0,0,0,0
; printf format string
str0 DB " %d",0

section .text
global CMAIN

extern printf

CMAIN:
    mov ebp, esp; for correct debugging
    
    ; fill the arrays
    ; pos_nums from 1 to 10 (incl)
    FILL_ARRAY pos_nums, 10, 10, Pos_fill
    ; and neg_nums from -1 to 8 (incl)
    FILL_ARRAY neg_nums, 10, 8, Neg_fill  
    
    ; call the print array macro with
    ; the address, the length of the array and the label name for the loop
    PRINT_ARRAY pos_nums, 10, Pos_print
    NEWLINE
    PRINT_ARRAY neg_nums, 10, Neg_print
    
    xor eax, eax
    ret