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
	mov rax, 1          ;sys_write
	mov rdi, 1          ;standard output
	mov rsi, name       ;text to print
	mov rdx, 26         ;length
	syscall             ;kernel call

	mov rbx, name       ;put name into rbx
	mov rdi, 0          ;set counter to 0

	dec rbx             ;move to before first character in rbx

	call lp             ;call label lp

	jmp exit            ;jump to exit

lp:                         ;compare each character in rbx with the first character in rcx till there is a match
	inc rbx             ;move to next character in rbx
	mov rcx, wme        ;sset rcx to first character in wme

        inc rdi             ;increment counter by 1
	mov al, [rbx]       ;move current character in rbx to al
	mov ah, [rcx]       ;move current character in rcx to ah
	cmp al, ah          ;compare ah and al (current character in rcx and current character in rbx)
	jne lp              ;jump if not equal to lp label
	jmp lpp             ;else jump to lpp label

lpp:                        ;comparing character by character after thre is a match found in lp label
	inc rbx             ;move to next character in rbx
	inc rcx             ;move to next character in rcx
	inc rdi             ;increment counter by 1
	mov al, [rbx]       ;move ccurrent character in rbx into al
	mov ah, [rcx]       ;move current character in rcx into ah
	cmp al, ah          ;compare al and ah
	jne lqp             ;jump if not equal to lqp label
	jmp lpp             ;else jump to lpp label


lqp:                        ;check if we are at the end of the rcx string
	cmp ah, 0           ;compare ah to 0
	jne lp              ;jump if not equal to lp
	jmp loop            ;else jump to loop

loop:                       ;setting rbx to beginning of match with rcx
	dec rbx	 	    ;move to previous ccharacter in rbx
	dec rcx 	    ;move to previous character in rcx
	dec rdi 	    ;decrease counter by 1
	mov al, [rbx]       ;move current character in rbx into al
	mov ah, [rcx]       ;move current character in rcx into ah
	cmp al, ah          ;compare al and ah
	je loop             ;if equal, jump to loop

	mov rbx, name       ;else move name into rbx (set rbx to first character in name)
	jmp zoqqq           ;jump to zoqqq label

zoqqq:                      ;setting rbx to first character in match with rcx for printing (this step is not actually necessary so
			        ;you can skip this and jump to lpl label
	inc rbx             ;move to next character in rbx
	dec rdi             ;decrease counter by 1
	cmp rdi, 0          ;compare counter with 0
	jne zoqqq           ;loop if not equal (jump to zoqqq label)

	jmp lpl             ;else jump to lpl label
	
lpl: 		            ;print loop (printing rbx character by charactre till end of string)
	mov rax, 1          ;sys_write
	mov rdi, 1          ;standard output
	mov rsi, rbx        ;text to print (string in rbx)
	mov rdx, 1          ;length of string to print (one space for one character at a time)
	syscall             ;kernel call
	inc rbx             ;move to next character in rbx
	mov ah, [rbx]       ;move current character in rbx into ah
	cmp ah, 0           ;compare ah to 0 (end character)
	jne lpl             ;loop if not equal (jump to lpl label)

	jmp exit            ;else jump to exit

exit:
	mov rax, 60         ;sys_exit
	syscall             ;kernel call
