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

	li $t0, 10 # array size
	sw $t0, array
	
	li $t0, 11
	sw $t0, array + 4 # numbers[0] = 11
	
	# [  word  ] [ word ] [  word  ] [ word ] [  word  ] [ word ] [  word  ] [ word ] [  word  ] [ word ] [  word  ]
	# [  10    ] [ 11   ] [        ] [      ] [    45  ] [      ] [        ] [      ] [        ] [      ] [        ]
	# numbers[3] = 45
	li $t0, 45
	sw $t0, array + 16
	
	jal _print_array # jal instruction will place the address for the next instruction into register $ra
	
	# next instruction will be here
	#
	# the thing about lw, sw, la and li
	# 
	# lw takes a word (32 bits or 4 bytes) from an address in memory into a register
	# lw $register, address_in_memory
	
	# sw takes a word from a register and save it into an address in memory
	# sw $register, address_in_memory
	
	# la takes an address and save it into a register
	# la $register, address
	
	# li takes a value (immediate) or think of a constant integer value and save it into a register
	# li $register, immediate
	
	
_exit:
	li $v0, 10 # terminate program
	syscall

_print_array: 
	li $t0, 0 # initialize loop counter
	la $t1, numbers # address to the array of numbers
	lw $t2, ($t1) # size
	__loop:
		beq $t0, $t2, __done # if ( loop_counter = size of array) then go to __done
		add $t1, $t1, 4
	
		# print value
		lw $a0, ($t1)
		li $v0, 1
		syscall
	
		la $a0, new_line
		li $v0, 4
		syscall
	
		add $t0, $t0, 1
		j __loop
		
	__done:
		jr $ra
	
# Data Segment
	.data 
	# java example:
	# numbers[0] = 11;
	# ...
	# numbers[9] = 6;

# int[] numbers = [11, 8, 23, 45, 24, 7, 19, 10, 12, 6];
# a word is 32 bits or 4 bytes. A byte is 8 bits
numbers:	.word 10, 11, 8, 23, 45, 24, 7, 19, 10, 12, 6

# int[] numbers = new int[10];
array:		.space 44

new_line:	.asciiz "\n"

# end of file
