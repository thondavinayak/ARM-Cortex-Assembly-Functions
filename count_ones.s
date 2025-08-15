        GLOBAL  __count_ones
        AREA    Program, CODE, READONLY

__count_ones
        MOV     R1, #0           ; Count of ones
        MOV     R2, #32          ; Number of bits
        MOV     R3, #1           ; Bit mask

loop
        ANDS    R4, R0, R3       ; Test current bit
        BEQ     skip_inc         ; If zero, skip increment
        ADD     R1, R1, #1       ; Increment count

skip_inc
        LSL     R3, R3, #1       ; Shift mask left
        SUBS    R2, R2, #1       ; Decrement bit counter
        BNE     loop             ; Repeat for all bits

        BX      LR               ; Return
        END
