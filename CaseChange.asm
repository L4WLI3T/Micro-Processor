data segment 
	input db "Hello World2000"
data ends
extra segment
	output db ?
extra ends
code segment
	assume cs:code,ds:data,es:extra
	start:
		mov ax,data
		mov ds,ax
		mov es,ax
			CLD 
			LEA DI,output
			LEA SI,input
			UP: LODSB
			CMP AL,'$'
			JZ EXIT
			CMP AL,41h
			JB COMMON
			CMP AL,5Ah
			JBE LOWER
			CMP AL,61h
			JB COMMON
			CMP AL,7Ah
			JA COMMON
			SUB AL,20h
			JMP COMMON
		LOWER:ADD AL,20h
		COMMON:STOSB
			   JMP UP
		EXIT:int 03h
code ends
end start