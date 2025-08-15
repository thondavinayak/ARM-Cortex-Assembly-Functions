# ARM-Cortex-Assembly-Functions
ARM Cortex Assembly Program - Count Ones and Maximum Value Finder
📌 Overview

This project contains ARM Cortex-M assembly programs developed and simulated using Keil µVision MDK.
The code demonstrates:

Counting the number of 1 bits in a binary number (__count_ones function).

Finding the maximum value from a list of numbers stored in memory.

Handling both signed and unsigned integer comparisons.

Two versions of the program are provided:

Version 1 – Signed integer comparison using BGT (signed greater-than branch).

Version 2 – Unsigned integer comparison using BLS/LS and adjusted register initialization.

🛠 Tools & Environment

IDE: Keil µVision MDK

Target: ARM Cortex-M (generic simulation)

Language: ARM Assembly (ARMv7-M instruction set)

Simulation: Keil debugger

📂 File Structure
/ARM_Count_Ones_Max
│── main_signed.s      # Main program using signed integer comparison
│── main_unsigned.s    # Main program using unsigned integer comparison
│── count_ones.s       # Subroutine to count '1' bits
│── README.md

📜 Program Flow
Main Program (__main)

Initialization

Loads the number of data items to process (R6).

Sets initial maximum value registers.

Loads the base address of the number table (TAB1).

Loop (loop1)

Loads a number from the table.

Calls __count_ones subroutine.

Compares the result with the current maximum.

Updates the maximum value if a larger count is found.

Termination

Stops when all numbers have been processed (SVC 0x01).

Count Ones Subroutine (__count_ones)

Loads the bit mask in R3.

Uses ANDS to check each bit of the number.

Increments the count in R1 for every 1 bit found.

Loops until all bits are processed (32 iterations for a 32-bit number).

Returns to the main program (BX LR).

📊 Example Data (TAB1)
Signed version
TAB1 DCD 1, 68, 2, 6, 24, 123, 720, 15

Unsigned version
TAB1 DCD 0xE123, 0x981, 0xFFFFFFFC, 0x73, 0x61B1, 0xC54, 0xD01A, 0x720, 0x4C15

🚀 How to Run in Keil µVision

Open Keil µVision.

Create a new ARM assembly project.

Add the .s files to the project.

Select a simulation target (e.g., ARM Cortex-M3).

Build the project (F7).

Start the debugger (Ctrl + F5).

Step through the program to observe register and memory changes.

📌 Notes

Signed Version:

Uses BGT (Branch if Greater Than) for signed comparisons.

Maximum values are initialized with signed integer limits.

Unsigned Version:

Uses LS/BLS for unsigned comparisons.

Maximum values are initialized to unsigned integer limits.

Bit counting works for both signed and unsigned numbers since it operates at the binary level.
