; sources: slae, ia32 manual, nasm manual

global _start

section .text

_start:

	mov eax, var1
	mov ebx, var2
	mov ecx, var3

section .data

	; for ia32, we have the following datatypes:
	; byte: 8 bits
	; word: 16 bits
	; double word: 32 bits
	; quad word: 64 bits
	; double quad word: 128 bits

	; both signed and unsigned datatypes are supported

	; we are using nasm. here,
	; mov eax, label_i
	; moves in the address of label_i in to register eax
	; mov eax, [label_i]
	; moves the value stored in label_i into register eax

	; db or define bytes allows us to store one or more numbers and strings
	var1:	db	0x01, 'a', 'hello', 2, '$'

	; dw or define word allows 1 word
	var2:	dw	0xabcd

	; note that 0xa will be stored as 0x0a 0x00 (little endian...)
	; little endian formats store the least significant byte
	; the lowest memory address and vice versa
	var3:	dw	0xa

	; 0xaabbccdd will be stored as 0xdd 0xcc 0xbb 0xaa
	var4:	dd	0xaabbccdd

	; 8 byte constant or double precision constant
	var5:	dq	1.2e20

	; extended precision float
	var6:	dt	1.2e20

; bss is for uninitialised data
section .bss

	; we can use
	; resb n for reserving n bytes of memory
	var7:	resb	64

	; resw n for reserving n words
	var8:	resw	64
