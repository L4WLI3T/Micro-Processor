data segment
	input db 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 0Ah, 0Bh, 0Ch, 0Dh, 0Eh, 0Fh, 10h, 11h, 12h, 13h, 14h
	found db 00h
	search db 00h
data ends
code segment
	assume cs:code,ds:data
	start:mov ax,data
	mov CL,14h
	LEA SI,input
	up:mov ah,[SI]
	CMP ah, search
	JZ founded 
	INC SI
	DEC CL
	JNZ UP
	JMP EXIT
	founded:mov found,01h
	exit:int 03h
code ends
end start