; tested on 32bit Ubuntu lts 12.04

global _start

; text section of the program
; This section is supposed to have hold instructions

section .text

; _start is the assembly equivalent of the main() of java or C
_start:
	; we'll use systemcalls to print to the screen
	; unistd_32.h contains a list of systemcall numbers
	; for ia32, the unistd_32.h file is at /usr/include/i386-linux-gnu/asm/
        ; systemcall for printing to screen is 4
	; we'll use the write(2) wrapper over systemcall 4
	; write(2) takes a file descriptor, a buffer and the length of the buffer
	; stdin is mapped to fd 0, stdout to fd 1 and stderr to fd 2
	; we raise interrupt 0x80 to invoke the systemcalls

	; the eax register must contain the systemcall number
	; return value of the systemcalls is generally put back into the eax register
	mov eax, 0x4

	; ebx has 1 to imply that we want to write to stdout
	mov ebx, 0x1

	; referring to the string by its label
	mov ecx, message

	; storing the length of the string in edx
	mov edx, mlen

	; issuing the systemcall using interrupt 0x80
	int 0x80


	; we'll exit the program now
	; exiting is systemcall 1
	; we'll use the _exit(2) wrapper for this
	; _exit(2) takes a systemcall number and an exit status code
	mov eax, 0x1
	mov ebx, 0x0
	int 0x80


; data section of the program
; This is supposed to hold the initialised data values

section .data

        message: db "Hello assembly!"
	mlen	equ	$-message

