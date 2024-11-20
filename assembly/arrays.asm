# 
# arrays.asm
#
# 
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
	# java example:
	# int[] numbers = [11, 8, 23, 45, 24, 7, 19, 10, 12, 6];
	# int[] numbers = new int[10];
	# numbers[0] = 11;
	# ...
	# numbers[9] = 6;
numbers:	.word 11, 8, 23, 45, 24, 7, 19, 10, 12, 6
size: 		.word 10


# end of file
