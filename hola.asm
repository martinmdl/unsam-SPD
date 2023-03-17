.8086
.model small 
.stack 100h

.data
	hola db "HOLA MUNDO", 0dh, 0ah, 24h

.code
	main proc
		mov ax, @data
		mov ds, ax

		mov ah, 9
		lea dx, hola
		int 21h

		mov ax, 4c00h
		int 21h
	main endp
end main