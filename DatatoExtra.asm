extra segment
src db 01h,02h,03h,04h,05h,06h,07h,08h,09h,0Ah
extra ends
extra segment
dest db ? 
extra ends 
code segment
assume cs:code, ds:data, es:extra 
start: mov ax,extra 
mov ds,ax
mov ax,extra 
mov es,ax 
lea si,src
lea di,dest
mov cl,0ah 
up:mov al,[si]
mov es:[di],al 
inc si
inc di
dec cl 
jnz up 
int 03h
code ends
 end start
