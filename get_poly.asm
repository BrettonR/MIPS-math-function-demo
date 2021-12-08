# file for global function get_poly which gets a polynomial function from the user

.data
poly_degree: .asciiz "Enter the degree of the polynomial\n"
poly_message: .asciiz "Enter the coefficients of the polynomial starting with the highest degree.\n"
x_power: .asciiz "Enter the coefficient for the term x^"
newline: .asciiz "\n"

.text


# fake main function to test the get_function (polynomial) as a stand-alone mips program
#
# inputs required: none
#
# needs to return:
#		- the user-entered integer
#		- the address of the array

main:

## Call the get_function
# 1) Allocate stack space
#	0($sp) = 4 bytes to return the polynomial size
# 	4($sp) = 4 bytes to return the memory address of array
#	8($sp) = 4 bytes to preserve $ra
addiu $sp, $sp, -12

# 2) Write return address register and input values (none) to the stack
sw $ra, 8($sp)

# 3) Call the function
jal get_poly

# 4) Read the return values (polynomial degree and memory address of array), 
#	and restore the return address register from the stack

# restore return address register
lw $ra, 8($sp) 

# read memory address of array from stack and store in $s1
lw $s1, 4($sp)	# or maybe this should be la $s1, 4($sp)

# read polynomial degree from stack and store in $s0
lw $s0, 0($sp)

# 5) Deallocate stack space
addiu $sp, $sp, 12

# terminate program
li $v0, 10
syscall


#### TEST of get_poly ####

#.globl  get_poly
# this gets a math function from the user
# the math function is a polynomial stored in an array
# the user specifies the degree of the polynmial
# we have to store an integer for the degree of the polynomial and an array of n size
get_poly:

## Function Requirement Step 1) Read arguments off of the stack. No input arguments are needed

## Function Requirement Step 2) Business Logic
##				- Prompt user for the degree of their polynomial and get the user input
##				- Allocate memory for an array to store the coefficients for their polynomial
##				- Use a loop to get each coefficient input from the user and save it to the array

# print out prompt for polynomial degree
la $a0, poly_degree
li $v0, 4
syscall

# get user-input for the degree of the polynomial
li $v0, 5
syscall

move $t0, $v0	# move the user-input in $t0 where we will keep this value to reference and return on the stack
mul $t1, $t0, 4 # mutiply the user input in $t1 by 4 for number of bytes to allocate and store in $t1

# print out $t1 to test
#la $a0, ($t1)
#li $v0, 1
#syscall

# allocate heap memory for array of user-specified size to store polynomial
la $a0, ($t1)
li $v0, 9
syscall

        # alternative way to allocate space 
        #sll $a0 $v0 2 #number of bytes now in $a0
        #li  $v0 9
        #syscall 

# load adress of array into $t1
la $t1, ($v0)


# print out prompt for polynomial coefficients
la $a0, poly_message
li $v0, 4
syscall



move $t2, $t0	# put the degree of the polynomial into $t2 for loop counter


# $t0 = polynomial degree (which we do not change so we can reference it)
# $t1 = memory address of array (that we need to populate with user inputs)
# $t2 = counter for loop (that we will decrement to zero and branch if less than zero)
# $t3 = resgister to use for temporary values
#
# loop to get each coefficient from the user
poly_loop:
	# since we need x^0 coefficient too, use bltz to branch after the iteration for 0
	bltz $t2, exit_poly_loop

	# print out prompt for each coefficient
	# text portion of prompt
	la $a0, x_power
	li $v0, 4
	syscall
	# current power of x
	la $a0, ($t2)
	li $v0, 1
	syscall
	# newline for formatting
	la $a0, newline
	li $v0, 4
	syscall
	
	# get the coefficient for the current power of x
	li $v0, 5
	syscall
	
	
	# print out entered coefficient for testing	
	#move $t3, $v0	# move coefficient value from $v0 into $t3
	#la $a0, ($t3)
	#li $v0, 1
	#syscall

	# store coefficient value from $v0 into the current array element
	sw $v0, 0($t1)
	
	# test to print integer entered in array
	#lw $a0, 0($t1)
	#li $v0, 1
	#syscall

	# move to next element in the array
	addiu $t1, $t1, 4

	# decrement counter
	addi $t2, $t2, -1


	#b exit_poly_loop  # remove this line one the branch bltz is working

	b poly_loop

exit_poly_loop:

# write outputs to the stack
# 	- degree of polynomial
# 	- memory address of array

# save degree of polynomial to the stack
sw $t0, 0($sp)

# save memory address of array to the stack
sw $t1, 4($sp)


## Function Requirement Step 3 - Return to caller
jr $ra

#### END TEST of get_function ####


# terminate testing program
li $v0, 10
syscall


# end of stand-alone program 