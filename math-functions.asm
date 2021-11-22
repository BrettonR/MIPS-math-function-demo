# math-functions

.text

# print-function
.globl  print_function
print_function:
	b exit_print
exit_print:
jr $ra

.globl  get-function
get_function:
	b exit_get
exit_get:
jr $ra

.globl  evaluate_function
evaluate_function:
	b exit_evaluate
exit_evaluate:
jr $ra

.globl  integrate_function
integrate_function:
	b exit_integrate
exit_integrate:
jr $ra

.globl  zero_function
zero_function:
	b exit_integrate
exit_integrate:
jr $ra

