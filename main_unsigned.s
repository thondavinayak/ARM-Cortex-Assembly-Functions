        GLOBAL  __main
        EXTERN  __count_ones

        AREA    Program, CODE, READONLY

__main
        MOV     R6, #8           ; Number of data items
        MOV     R7, #0xFFFF      ; Unsigned max limit (start high to compare LS)
        LDR     R8, =TAB1        ; Pointer to table

loop1
        LDR     R0, [R8], #4     ; Load next number
        MOV     R5, #0           ; Clear R5 before calling subroutine
        BL      __count_ones     ; Count ones -> result in R1
        CMP     R7, R0           ; Compare unsigned
        BLS     totol            ; Branch if lower or same (unsigned)
        MOV     R7, R0           ; Update max value
        MOV     R5, R0           ; Store number with max ones

totol
        SUBS    R6, R6, #1       ; Decrement counter
        BNE     loop1

        SVC     0x01             ; Exit

        ALIGN
TAB1    DCD     0xE123, 0x981, 0xFFFFFFFC, 0x73, 0x61B1, 0xC54, 0xD01A, 0x720, 0x4C15
        END
