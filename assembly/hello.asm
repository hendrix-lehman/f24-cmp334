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
 	# add $v0, $zero, 4
	li $v0, 4 # li and add both accomplish the same result placing 4 into register $v0
	syscall # actual call to execute this print instruction

# Data Segment
	.data 
str:	.asciiz "Hello, worl\n"

# end of hello.asm	