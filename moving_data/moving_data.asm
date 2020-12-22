global _start

section .text

_start:

	; moving literals
	mov eax, 0xdeadbeef

	; memory address -> register
	mov eax, [label1]

	; memory -> register
	mov eax, label1

	; loading effective address of label1
	lea eax, [label1]

	; swapping values
	mov eax, 0xdead
	mov ebx, 0xbeef
	xchg eax, ebx

	; register -> another register
	mov eax, ebx

	; exiting the program now
	mov eax, 1
	mov ebx, 0
	int 0x80

section .data

	label1: db 0xffff

