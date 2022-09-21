section .text
	global _start
_start:
	call _dothisfirst

	mov ecx, [num]
	cmp ecx, [num1]
	jg check_third
	mov ecx, [num1]

_dothisfirst:
	;display prompt message
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, lenMsg
	int 80h

	;read and store user inputted number
	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5
	int 80h
	ret

check_third:
	;check third number
	cmp ecx, [num2]
	jg _exit
	mov ecx, [num2]

_exit:
	;store largest number into large
	mov [large], ecx
	;print next message
	mov ecx, finMsg
	mov edx, lenFinMsg
	mov ebx, 1
	mov eax, 4
	int 80h

	;print largest number
	mov ecx, large
	mov edx, 2
	mov ebx, 1
	mov eax, 4
	int 80h

	;end program
	mov eax, 1
	mov ebx, 0
	int 80h

section .data
	num1 dd '5'
	num2 dd '10'
	msg db 'Enter a number: '
	lenMsg equ $-msg
	finMsg db 'Highest number is '
	lenFinMsg equ $-finMsg

segment .bss
	num resb 5
	large resb 5
