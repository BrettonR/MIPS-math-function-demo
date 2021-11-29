# driver file: main.asm
# this file runs the program menu
# and calls the required functions

.data
menu_options: .asciiz "1) Display the stored function/n2) Enter a new function and delete the currently stored functionn\3) Evaluate the stored function for an input\n4) "

.text
main:




li $v0, 10
syscall
