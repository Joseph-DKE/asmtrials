;creating a subroutine for printing
;counts the actual length of a string to output

section .text
	global _start
_start:
	mov rax, 0
	mov rdi, 0
	mov rsi, name
	mov rdx, 30
	syscall

	mov rax, name
	call _print

	mov rax, 60
	mov rdi, 0
	syscall

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

segment .bss
	name resb 30
