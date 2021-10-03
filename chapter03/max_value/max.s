# Purpose: Finds a maximum from a list of numbers

.section .data
    data_items:
        .long 3,67,34,222,45,75,54,35,44,33,22,11,66,0

.section .text
    .globl _start

_start:
# Move the value of 0 into the index register
    movl $0, %edi
# Read 4 bytes from the value of the index register
# Move this value into the eax register
    movl data_items(,%edi,4), %eax
# This is the biggest value since we haven't started the
# loop
    movl %eax,%ebx

# We fall into here without having to start it
start_loop:
# We don't really have a loop, we're just iterating
# through memory until we hit a 0.
# Compare the value in the eax register to 0
    cmpl $0, %eax
# If equal, go to loop exit
    je loop_exit
# Increment the value in the index register
    incl %edi
# Read the next 4 bytes from the data_items
# Put it into the eax register.
    movl data_items(,%edi,4), %eax
# Compare the value in ebx (the maximum)
# to the value in eax (the current)
    cmpl %ebx, %eax
# If eax < ebx, it's not the max, so go on 
# to the next value
    jle start_loop
# Otherwise it's the biggest we have found so far,
# so put it into the ebx register
    movl %eax, %ebx
# On to the next value
    jmp start_loop

loop_exit:
# Load the number 1 into eax, which is the number for the exit
# system call
    movl $1, %eax
# Interrupt with a system call
    int $0x80
