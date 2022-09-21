section .text
	global _start
_start:
	mov rsi, [num1]
	cmp rsi, [num2]
	jg check_third
	mov rsi, [num2]

check_third:
	cmp rsi, [num3]
	jg _exit
	mov rsi, [num3]

_exit:
	mov [large], rsi
	mov rsi, msg
	mov rdi, 1
	mov rax, 1
	mov rdx, len
	syscall

	mov rsi, large
	mov rdx, 2
	mov rdi, 1
	mov rax, 1
	syscall

	mov rax, 60
	mov rdi, 0
	syscall

section .data
	msg db "The largest number is: ",10
	len equ $-msg
	num1 dd '47'
	num2 dd '22'
	num3 dd '31'

segment .bss
	large resb 2
