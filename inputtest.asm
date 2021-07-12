;This program is a test with memory... so should actually be called
;memorytest.asm haha. I get store data in the data section, get input
;then replace some of the data stored with the input.
;try inputting "hi there"

section .data
	t db 'te'
	r db 'ge'
	e db 'po'
	tes db '                endofstring'
	lentes equ $-tes

segment .bss
	name resb 2
	net resb 3
	nem resb 4

section .text

%macro input 2
	mov rax, 0
	mov rdi, 0
	mov rsi, %1
	mov rdx, %2
	syscall
%endmacro

%macro print 2
	mov rax, 1
	mov rdi, 1
	mov rsi, %1
	mov rdx, %2
	syscall
%endmacro

	global _start
_start:
;	print t, 2
;	input name, 2
;	print r, 2
;	input net, 3
;	print e, 2
	input nem, 10

	mov rsi, [nem]
	mov [tes], rsi
	print tes, lentes

	mov rax, 60
	syscall
