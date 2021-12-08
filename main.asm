# driver file: main.asm
# this file runs the program menu
# and calls the required functions

.data
menu_options: .asciiz "1) Display the stored function/n2) Enter a new function and delete the currently stored functionn\3) Evaluate the stored function for an input\n4) "
poly_degree: .asciiz "Enter the degree of the polynomial\n"
poly_message: .asciiz "Enter the coefficients of the polynomial starting with the highest degree.\n"

.text
main:

	#li $v0, 4
	#la $a0, poly_degree
	#syscall

	# function calls for debugging
	# Call the get_function method to get a function from a user
	# 1). allocate stack space
	# 	- return address register $ra
	#	- space for the array (we don't know the array size yet; will be created dynamically in the function)
	# 	- space for the degree of the polynomial (an integer)
	
	# 2). save important registers to the stack
	
	# 3). Call the function
	#jal get_function
	# 4.) Read return values and outputs
	
	# 5.) deallocate stack space
	
	
	# Call the print_function method to get a function from a user
	# 1). allocate stack space
	# 	- return address register $ra
	#	- space for the array (we don't know the array size yet; will be created dynamically in the function)
	# 	- space for the degree of the polynomial (an integer)
	
	# 2). save important registers to the stack
	
	# 3). Call the function
	#jal print_function
	# 4.) Read return values and outputs
	
	# 5.) deallocate stack space



li $v0, 10
syscall

