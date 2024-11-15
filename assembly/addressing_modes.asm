# 
# addressing_modes.asm
#
# 
#

# Text Segment
	.text
	.globl __start

__start:  				# execution starts here


# R-type (Register addressing)
	li $t1, 4
	# 00000000 00000000 00000000 00000100  before (register $t1)
	sll $t0, $t1, 1	
	# 00000000 00000000 00000000 00001000  after (register $t0)

	srl $t2, $t0, 1
	# 00000000 00000000 00000000 00000100  back to original value (register $t2)
	
# I-type (Immediate addressing)
	addi $t3, $t0, 1
	
	# (Base addressing)
	lw $t4, num
	
	# storing values in memory
	la $s0, num
	sw $t3, 4($s0)	
	
	# (PC-relative addressing)
	beq $t4,2 _print

_exit:
	li $v0, 10 # terminate program
	syscall

_print:
	la $a0, hello
	li $v0, 4
	syscall

# J-type (direct and pseudodirect addressing)
	# (Register direct addressing)
	la $t5, _exit
	jr $t5	
	
	# (Register "indirect" or pseudodirect addressing)	
	j _exit # this instruction will NOT be reached because jr $t5 jumps back to _exit


# Data Segment
	.data 
hello:	.asciiz "Hello, world!"	
num: 	.word 2


# end of addressing_modes.asm	


