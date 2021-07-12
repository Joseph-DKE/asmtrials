;This program compares two strings 
;character by character to see if they match

section .data
	str1 db '1234', 0
	str2 db '1234', 0
	equale db 'Equal'
	lenequale equ $-equale
	notequal db 'Not Equal'
	lennotequal equ $-notequal

section .text

%macro print 2
	mov rax, 1
	mov rdi, 1
	mov rsi, %1
	mov rdx, %2
	syscall
%endmacro

	global _start
_start:
	mov rbx, str1
	mov rcx, str2
	dec rbx
	dec rcx
	jmp loop
loop:
	inc rbx
	inc rcx
	mov ah, [rbx]
	mov al, [rcx]
	cmp al, ah
	jne _notequal
	cmp ah, 0
	jne loop
	jmp _same

_notequal:
	print notequal, lennotequal

	jmp _exit

_same:
	print equale, lenequale

	jmp _exit

_exit:
	mov rax, 60
	syscall
