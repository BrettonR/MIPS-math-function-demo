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
	jal get_function
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

#############################################################
# updated main file : satis 4:02


# driver file: main.asm
# this file runs the program menu
# and calls the required functions

.data
menu_options: .asciiz "\n\nEnter a number: \n 1) Display the stored function \n 2) Enter a new function and delete the currently stored function \n 3) Evaluate the stored function for an input \n 0) exit \n Enter a number: "
poly_degree: .asciiz "Enter the degree of the polynomial\n"

display_test: .asciiz "This is display." 

enter_test: .asciiz "Enter a function." 

evaluate_test: .asciiz "This is evaluate test."

invalid_test: .asciiz "input error. " 

empty_function: .asciiz "There is no function currently stored." 


#############################
# evaluate sub menu 
# enter a number

# prompts: 
# 1. eval function for x 
# enter a value for x. 
# read the x value 
# call the function with the x value as the input and 0 for the deri. input 
# read return value from function.
# display the return value. (" the stored function is : ...." )



# 2. eval derivative for x value
# which dev. would you like to eval. 
# get deri. from user 
## please enter a value for x. 
# read the x value 
# call the eval_function with the x value as the input and the deriv. of the desired user 
# read return value from function.
# display the return value. (" the stored function is : ...." )

		
# 3. exit and return to main menu 
 
   

.text
main:

 	li $s0, 0 # 0 rep. no function in the program 
 		
menu: 
	li $v0, 4
	la $a0, menu_options
	syscall
	
	li $v0, 5 
	syscall 	# user's input goes into $v0 
	move $t0, $v0 	# move input from $v0 to $t0 
	
	beq $t0, 1, display
	beq $t0, 2, enter 
	beq $t0, 3, evaluate
	beq $t0, 0, exit
	bge $t0, 4, error

	#beq $t0, 5, exit 
#######################################################################################	
	# display the function to the user 
	display: # 1 
	
	beqz $s0, noFunction
	
	# function jal 
	li $v0, 4
	la $a0, display_test
	syscall
	
	# branch back to the menu 
	b menu 
	
	noFunction:
	li $v0, 4
	la $a0, empty_function
	syscall
	# branch back to main 
	b menu 
	
	enter: 
	li $v0, 4
	la $a0, enter_test 
	syscall
	
	
	
	b menu
#######################################################################################
	evaluate: # 2 
	
	# checks to see if there is a function to evaulate or not 
	beqz $s0, noFunction
	
	# jal to the function 
	
	eval_Menu: 
		
	li $v0, 4
	la $a0, 
	syscall
	
	b menu
#######################################################################################
	error: # 0 
	li $v0, 4
	la $a0, invalid_test
	syscall
		
	b menu
	
	#sub menu for
		# prompt user 
			# woul du like t
	

	 #invalid_test
	
	
	# jump and link to the display function: 
	
	# jal display_function 
		# la $a0, display test 
	
	 
	 # if there is nothing in the array then display nothing there 
	 
	 # jump back to prompt menu again 
	
	 
exit: 
# termiate program 
li $v0,10
syscall

	
	
	

