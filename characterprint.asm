;In this one, I used what I learnt from comparetest.asm to
;find where string two matches with string one and print
;out the string one from the point where it first matches to 
;string two to the end of the itself (string one) try changing
;wme to "is"

;I also learnt that memory in .data section is stored back to back
;so printing the string 'name' with a size of 26 would print out
;"my name is JoeHelloname" but printing it out with a size of 15 would
;print out "my name is Joe"

section .data
	name db 'my name is Joe', 0
        mental db 'Hello', 0

	wme db 'name', 0

section .text
	global _start

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx, 26
	syscall

	mov rbx, name
	mov rdi, 0

	dec rbx

	call lp

	jmp exit

lp:
	inc rbx
	mov rcx, wme

        inc rdi
	mov al, [rbx]
	mov ah, [rcx]
	cmp al, ah
	jne lp
	jmp lpp

lpp:
	inc rbx
	inc rcx
	inc rdi
	mov al, [rbx]
	mov ah, [rcx]
	cmp al, ah
	jne lqp
	jmp lpp


lqp:
	cmp ah, 0
	jne lp
	jmp loop

loop:
		dec rbx
		dec rcx
		dec rdi
		mov al, [rbx]
		mov ah, [rcx]
		cmp al, ah
		je loop

		mov rbx, name
		jmp zoqqq
zoqqq:
	inc rbx
	dec rdi
	cmp rdi, 0
	jne zoqqq
		lpl:
			mov rax, 1
			mov rdi, 1
			mov rsi, rbx
			mov rdx, 1
			syscall
			inc rbx
			mov ah, [rbx]
			cmp ah, 0
			jne lpl

		ret
exit:
	mov rax, 60
	syscall
