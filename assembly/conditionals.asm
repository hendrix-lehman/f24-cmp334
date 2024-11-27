###############################################################################
#                                                                             #
#                               text segment                                  #
#                                                                             #
###############################################################################

	.text
	.globl __start
__start:

#
# DO NOT MAKE ANY CHANGES ABOVE THIS LINE
#
#--------------------------your code below this line--------------------------#

# 1. loop the string char by char.
# 2. store each char in a separate memory space
# 3. check for sentinel. in this case, ","
# 4. use the index values as indicator to which list item you are in
#    for example, if the index (user input) is 1 

	la $s0, classes # storing the data memory address in register $s0
	la $s1, myspace 
	li $s2, 2 # index or user input
	
    # li $t2, 0 # char counter
    li $t9, 0 # comma counter
__loop:
	beq $s2, $t9, __found_it
	# outer loop use comma encounters as counter

	# need to reset space address
	__loop_item:
		lb $t0, ($s0)
		beq $t0, 0x2c, __done # if ($t0 == 44) { __exit } - 44 is the decimal for "," in ASCII
	
		sb $t0, ($s1)
		add $s0, $s0, 1
		add $s1, $s1, 1
	
		j __loop_item
	
	__done:
		add $s0, $s0, 1
		add $t9, $t9, 1 # a = a + 1
		
	j __loop
			
#	lb $t0, ($s0)
#	beq $t0, 0x2c, __exit # if ($t0 == 44) { __exit } - 44 is the decimal for "," in ASCII
	
#	sb $t0, ($s1)
	
#	add $s0, $s0, 1
#	add $s1, $s1, 1
#	j __loop

	
#--------------------------your code above this line--------------------------#
#
# DO NOT MAKE ANY CHANGES BELOW THIS LINE
#
__exit:
	li $v0, 10
	syscall

__found_it:
	la $a0, foundit
	li $v0, 4
	syscall
	
	j __exit
	
###############################################################################
#                                                                             #
#                               data segment                                  #
#                                                                             #
###############################################################################
	.data

classes: 	.asciiz "cmp168,cmp334,cmp431"

foundit:	.asciiz "found it"

myspace:	.space 6