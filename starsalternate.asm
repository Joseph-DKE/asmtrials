section .bss
	input resb 51

section .data
	fmt db "%d", 0x0
	msg db "Enter number of times to print star: ", 0x0
	len equ $-msg
	star db "*"
	num dq 0

section .text
	global _start
_start:
	call get_num
	call print_stars

	mov rax, 60
	mov rdi, 0
	syscall

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
		neg:
		ret

get_num:
	mov rsi, msg
	mov rdx, len
	call print

	mov rax, 0
	mov rdi, 0
	mov rsi, input
	mov rdx, 50
	syscall

	call text_to_num
	ret

print:
	mov rax, 1
	mov rdi, 1
	syscall
	ret

text_to_num:
	mov rbx, input
	mov rax, 0
	l:
		movzx rcx, byte [rbx]
		cmp rcx, 0xa
		je end
		imul rax, 0xa
		mov rdx, rcx
		sub rcx, 0x30
		inc rbx
		add rax, rcx
		jmp l
		end:
			mov [num], rax
			ret
