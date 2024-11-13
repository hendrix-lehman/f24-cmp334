# 
# user_adder.asm
#
# This program ask user for two numbers to add and print out the result
#

# Text Segment
	.text
	.globl __start

__start:  				# execution starts here

	# ask for first number
	la $a0, prompt
	li $v0, 4
	syscall
	
	# read user input
	li $v0, 5  # register $v0 will contain the integer read
	syscall
	
	# save integer read in register $s0
	add $s0, $zero, $v0
	
	# ask for second number
	la $a0, prompt
	li $v0, 4
	syscall	
	
	# read user input
	li $v0, 5  # register $v0 will contain the integer read
	syscall
	
	# save integer read in register $s0
	add $s1, $zero, $v0
	
	# show result
	la $a0, result
	li $v0, 4
	syscall
	
	# adding input and printing sum
	add $a0, $s0, $s1
	li $v0, 1
	syscall

_exit:
	li $v0, 10 # terminate program
	syscall
# Data Segment
	.data 
prompt: 	.asciiz "Please enter number to add: "
result: 	.asciiz "Sum is : "

# end of user_adder.asm	
