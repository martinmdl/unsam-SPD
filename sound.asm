.8086
.model small
.stack 100h

.data

.code

public play

play proc
    push ax
    push cx
    push bx

    mov al, 182
    out 43h, al
    mov ax, 9121            ;frecuencia de la nota

    out 42h, al
    mov al, ah
    out 42h, al

    in al, 61h
    or al, 00000011b
    out 61h, al

    mov bx, 1000            ;pausa

    pause1:
        mov cx, 65535       ;duracion

    pause2:
        dec cx
        jne pause2
        dec bx
        jne pause1

        in al, 61h
        and al, 11111100b
        out 61h, al
        
    pop bx
    pop cx
    pop ax

    ret
play endp
end