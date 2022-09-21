section .text
	global _start
_start:
	call get_num
	call _message
	call _printe
	call _exit

	;mov rax, text
	;call _print

	;mov rax, 60
	;syscall

_printe:
	mov rax, text
	call _print
	jmp _compare

_compare:
	mov rsi, [num]
	dec rsi
	mov [num], rsi
	mov rsi, [ num]
	cmp rsi, 0
	jne _printe

	ret

_exit:
	mov rax, 60
	syscall

_message:
	mov rdx, len
	mov rsi, msg
	mov rdi, 1
	mov rax, 1
	syscall

	ret

_print:
	push rax
	mov rbx, 0
_printloop:
	inc rax
	inc rbx
	mov cl, [rax]
	cmp cl, 0
	jne _printloop

	mov rax, 1
	mov rdi, 1
	pop rsi
	mov rdx, rbx
	syscall

	ret

extern scanf
get_num:
	mov rax, 0
	mov rdi, 0
	mov rsi, num
	mov rdx, 5
	syscall

	lea rdx, [num]
	push rdx
	lea rdx, [fmt]
	push rdx
	call scanf
	ret

section .data
	msg db 'Displaying stars', 0xa
	len equ $-msg
	text db '*'
	fmt db "%d", 0x0

section .bss
	num resb 5
