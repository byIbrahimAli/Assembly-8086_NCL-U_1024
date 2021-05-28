# Objective / Purpose
- Demonstrate appropriate use of
  - Multiplexing
  - Procedures
  - Interrupt routines
  - Compact code to avoid running out of memory
  - ...
  - Understanding of Assembly (8086 architecture)

# The Problem / Situation
-  Demonstrate your understanding of Assembly (8086 architecture) by:
  - completing all exercises
  - producing a double-digit counter from 0 to 99 that loops around

## Exercises:
1. Write a program that subtracts using `SUB`
1. Write a program that multiplies using `MUL`
1. Write a program that divides using `DIV`
1. Write a program that divides by zero
1. Work out what hexadecimal numbers will activate the correct traffic lights. Modify the program to step the lights through a realistic sequence, assuming the two sets of lights are at the opposite sides of a narrow bridge.
1. Display `H`, `E`, `L`, `L`, `O` on a memory mapped display
1. Rewrite the example program to count backwards using `DEC BL`
1. Rewrite the example program to count in threes using `ADD BL,3`
1. Rewrite the program to count 1 2 4 8 16 using `MUL BL,2`. What happens when the count overflows?
1. Count in `BL 0 1 1 2 3 5 8 13 21 34 55 89` overflow. Here each number is the sum of the previous two. You will need to use two registers and at least one memory location for temporary storage of numbers (do not use `PUSH/POP`). Remember that the result will overflow when it goes above 127. You may recognise this as the Fibonacci series, a number sequence first described by Leonardo Fibonacci of Pisa.
1. Input characters and display each character at the top left position of the VDU by copying them all to address `[C0]`
1. Use `BL` to point to address `[C0]` and increment `BL` after each key press in order to see the text as you type it
1. Store all the text you type in RAM (not the VDU RAM) when you type it in. When you press Enter, display the stored text on the VDU display by copying it to the VDU RAM.
1. Re-do your traffic lights program and use this procedure to set up realistic time delays between light changes
1. Write a procedure that doubles a number. Pass the single parameter into the procedure using a register. Use the same register to return the result.
1. Modify the traffic lights data table so there is an overlap with both sets of lights on red
1. Write a program which calls three procedures. The first should continue to read characters from the keyboard and store in RAM until Enter is pressed. The second should convert any upper case characters in the stored text to lower case. The third should display the complete line of text on the VDU display.

# Demos of my Work
https://1drv.ms/u/s!AofLs1CtKB68iKknsUzEcbn9eYTiFA?e=f2mtJu
