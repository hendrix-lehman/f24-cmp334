# 
# hello.asm
#
# This program prints "Hello, world!" on the STDOUT (which is the console)
#

# Code is broken down into two segments: text and data

# Text Segment
	.text
	.globl __start

__start:  				# execution starts here

	
	la $a0, str # place the memory address of 'str'
 	 # add $a0, $zero, 5
	li $v0, 4 # li and add both accomplish the same result placing 4 into register $v0
	syscall # actual call to execute this print instruction
	
	li $t2, 1
	li $t3, 6
	add $t1, $t2, $t3
	
	add $a0, $zero, $t1
	li $v0, 1
	syscall

_exit:
	li $v0, 10 # terminate program
	syscall
# Data Segment
	.data 
str:	.asciiz "Hello, world\n"

# end of hello.asm	
