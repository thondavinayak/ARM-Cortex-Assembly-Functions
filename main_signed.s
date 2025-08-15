        GLOBAL  __main
        EXTERN  __count_ones

        AREA    Program, CODE, READONLY

__main
        MOV     R6, #8           ; Number of data items
        MOV     R7, #0           ; Max count of ones (initial)
        LDR     R8, =TAB1        ; Pointer to table

loop1
        LDR     R0, [R8], #4     ; Load next number into R0
        BL      __count_ones     ; Count ones -> result in R1
        CMP     R7, R1           ; Compare with current max
        BGT     totol            ; If current max > new count, skip update
        MOV     R7, R1           ; Update max count
        MOV     R5, R0           ; Store number with max ones

totol
        SUBS    R6, R6, #1       ; Decrement counter
        BNE     loop1            ; Repeat until done

        SVC     0x01             ; Exit

        ALIGN
TAB1    DCD     1, 68, 2, 6, 24, 123, 720, 15
        END
