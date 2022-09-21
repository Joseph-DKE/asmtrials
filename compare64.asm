section .bss
	num resb 2
	large resb 2

section .data
	num1 dq '12'
	num2 dq '29'
	msg db 'Enter a number: '
	lenMsg equ $-msg
	finMsg db 'The highest number is: '
	lenFinMsg equ $-finMsg

section .text
	global _start
_start:
	call _dothisfirst

	mov rsi, [num]
	cmp rsi, [num1]
	jg check_third
	mov rsi, [num1]

check_third:
	cmp rsi, [num2]
	jg _exit
	mov rsi, [num2]

_exit:
	mov [large], rsi
	mov rsi, finMsg
	mov rdx,lenFinMsg
	mov rdi, 1
	mov rax, 1
	syscall

	mov rsi, large
	mov rdx, 2
	mov rdi, 1
	mov rax, 1
	syscall

	mov rax, 60
	mov rdi, 0
	syscall

_dothisfirst:
	;display prompt message
	mov rax, 1
	mov rdi, 1
	mov rsi, msg
	mov rdx, lenMsg
	syscall

	;read and input user number
	mov rax, 0
	mov rdi, 0
	mov rsi, num
	mov rdx, 5
	syscall
	ret
