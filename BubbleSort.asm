Data segment
array db 01h,02h,03h,04h,05h,06h,07h,08h,09h,0Ah
largest db 00h
count db 09h
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
lea si,array
up: mov al,[si]
mov bl,[si+1]
cmp al,bl
jc larg
mov [si+1],al
mov [si],bl
larg: inc si
dec count
jnz up
mov largest,bl
int 03h
code ends
end start