data segment
string db "hello$"
count db 00h
pal db 00h
data ends
extra segment
rev db ?
extra ends
code segment
assume cs:code,ds:data,es:extra
start: mov ax,data
mov ds,ax
mov ax,extra
mov es,ax
lea si,string
cld
up:lodsb
cmp al,'$'
jz reverse
inc count
jmp up
reverse: dec si
dec si
mov cl,count
lea di,rev
continue1: std
lodsb
cld
stosb
dec count
jnz continue1
lea si,string
lea di,rev
repz cmpsb
cmp cl,00h
jnz exit
mov pal,01h
exit: int 03h
code ends
end start