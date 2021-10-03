# PURPOSE: Simple program that exits and returns a status code back to the Linux kernel
# 
# INPUT: none
# 
# OUTPUT: returns a status code.
#

.section .data
.section .text
    .globl _start

_start:
# Loading the system call 1 into eax. Specifically it loads the number 1 into 
# the eax register by using immediate mode addressing. Immediate mode is denoted
# by the dollar sign.
# Without the dollar sign, we would use direct addressing, and would load the
# number located in memory address 1 into eax.
    movl $1, %eax
# Puts the number 0 into the ebx register in the same way.
    movl $0, %ebx
# int stands for interrupt.
# 0x80 is the interrupt to use.
# Linux knows what system call to use by what is placed in the eax register.
# In the case, eax holds the number 1, which is the exit system call.
# Its arguments are whatever is placed in the ebx register, in this case 0.
    int $0x80
    
