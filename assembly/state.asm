# 
# state.asm
#
#
# Text Segment
	.text
	.globl __start
__start:  				# execution starts here


	
	
_exit:
	li $v0, 10 # terminate program
	syscall
	
# Data Segment
	.data 

# end of file
