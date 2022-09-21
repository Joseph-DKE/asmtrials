extern scanf
section .data
	fmt db "%d", 0x0
	msg db "Enter number of stars: ", 0x0
	len equ $-msg
	star db "*"
	num dq 0

section .text
	global _start
_start:
	push rbp ;align the stack
	call get_num
	call print_stars

	mov rax, 60
	mov rdi, 0
	syscall

print:
	mov rax, 1
	mov rdi, 1
	syscall
	ret

get_num:
	mov rsi, msg
	mov rdx, len
	call print

	mov rdi, fmt
	lea rsi, [num]
	call scanf
	ret

print_stars:
	loop:
		mov rsi, star
		mov rdx, 1
		call print

		mov rax, [num]
		dec rax
		mov [num], rax
		cmp rax, 0
		jne loop
		ret
