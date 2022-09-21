section .text
	global _start ;main ;declaring main

;main: ;main method (start of program)
_start: ;main method encounteres some error so use start instead
	mov edx, len ;len variable
	mov ecx, msg ;variable msg
	mov ebx, 1 ;stdout (print something to screen)
	mov eax, 4 ;syswrite (tell the system we want to write something to screen)
	int 0x80 ;call kernel

	mov eax, 1 ;sysext (end of main method)
	int 0x80 ;call kernel

section .data
msg db 'Hello, World!', 0xa
len equ $-msg
