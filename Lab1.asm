.data
	# Defing Message and User Input
	message:	.asciiz "The Largest of the inputs is "	
	answer:		.byte
.text

	main:
	# Getting User input 1
	li $v0, 5
	syscall
	move $t0,$v0 # first number in $t0
	
	# Getting User input 2
	li $v0, 5
	syscall
	move $t1,$v0 # second number in $t1
	
	# Getting User input 3
	li $v0, 5
	syscall
	move $t2,$v0 # third number in $t2
	

	# Finding Largest of the Inputs
	# effectively these two lines do: $t1 = max($t0, $t1)
	bge $t1, $t0, CMP2
	move $t1, $t0
	
	CMP2:
	# effectively these two lines do: $t1 = max($t2, $t1)
	bge $t1, $t2, L1
	move $t1, $t2
	
	bge $t2, $t1, L1
	move $t2, $t1

	L1:
	# Print the Message
	li $v0, 4
	la $a0, message
	syscall 
	
	# Print the Result
	li $v0, 1
	move $a0, $t1
	syscall

	# Tell Program to finish running
	li $v0, 10
	syscall