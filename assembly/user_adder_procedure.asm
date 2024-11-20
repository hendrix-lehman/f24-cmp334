# 
# user_adder.asm
#
# This program ask user for two numbers to add and print out the result
#

# Text Segment
	.text
	.globl __start

__start:  				# execution starts here

	jal  get_integer
	# save integer read in register $s0
	add $s0, $zero, $v0

	jal get_integer
	# save integer read in register $s0
	add $s1, $zero, $v0
	
	jal show_result

_exit:
	li $v0, 10 # terminate program
	syscall

get_integer: # expect resutl to be in register $v0
	la $a0, prompt
	li $v0, 4
	syscall
	
	# read user input
	li $v0, 5  # register $v0 will contain the integer read
	syscall
	
	jr $ra
	
show_result:
	# show result
	la $a0, result
	li $v0, 4
	syscall
	
	# adding input and printing sum
	add $a0, $s0, $s1
	li $v0, 1
	syscall
	
	jr $ra	
	
# Data Segment
	.data 
prompt: 	.asciiz "Please enter number to add: "
result: 	.asciiz "Sum is : "

# end of user_adder.asm	
