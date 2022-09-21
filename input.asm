section .text
	global _start
_start:
	;display first message
	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h

	;Read and store user data
	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5
	int 80h

	;display next message
	mov eax, 4
	mov ebx, 1
	mov ecx, dispMsg
	mov edx, lenDispMsg
	int 80h

	;display inputted number
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 80h

	;end program
	mov eax, 1
	mov ebx, 0
	int 80h

section .data
	userMsg db 'Please enter a number: '
	lenUserMsg equ $-userMsg
	dispMsg db 'You have entered: '
	lenDispMsg equ $-dispMsg

segment .bss
	num resb 5
