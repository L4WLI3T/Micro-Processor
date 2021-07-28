data segment
src db 01h,02h,03h,04h,05h,06h,07h,08h,09h,0ah
data ends
code segment
assume cs:code, ds:data
start: mov ax,data
mov ds,ax
lea si,src
mov di,7000h
mov cl,0ah
up: mov al,[si]
mov [di],al
inc si
inc di
dec cl
jnz up
int 03h
code ends
end start