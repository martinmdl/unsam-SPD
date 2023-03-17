.8086
.model medium
.stack 200h
;--------------------------------------------------------------------------------------------
;DATA SEGMENT
;--------------------------------------------------------------------------------------------
.data
;--------------------------------------------------------------------------------------------
;Variables
;-------------------------------------------------------------------------------------------- 
    nombre db 10 dup(24h), 24h              ;Nombre de solo 10 caracteres.           ;Nombre de solo 10 caracteres.
    opcion db 0 , 24h
    coordX db ?
    coordY db ?
;--------------------------------------------------------------------------------------------
;Banderas
;-------------------------------------------------------------------------------------------- 
;--------------------------------------------------------------------------------------------
;Texto LOGO - LOGO
;-------------------------------------------------------------------------------------------- 

    texto0     db " $"
    texto1     db "UNSAM - Escuela de CyT.$"                             ;LIMITE DE CARACTERES ES 30 por renglon punto inlcluido
    texto2     db "$"
    texto3     db "$"
    texto4     db "$"
    textoEnter db "PULSE UNA TECLA PARA INCIAR. $"
    texto6     db " $"
    texto7     db "Construido y programado por: $"
    texto8     db "    Cris   Valen    Pipo    $"
    textoE     db "        Mati   Martin       $"
    dibujo  db 00h,00h,03h,03h,03h,03h,00h,00h,00h,00h,00h,03h,03h,03h,03h,0bh ;11*14 8 | f*C 
            db 00h,00h,03h,0Fh,0Fh,0Fh,03h,03h,00h,03h,03h,0Fh,0Fh,0Fh,03h,0bh
            db 00h,00h,03h,0Fh,0Fh,0Fh,0Fh,0Fh,03h,0Fh,0Fh,0Fh,0Fh,0Fh,03h,0bh
            db 00h,00h,03h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,03h,0bh
            db 00h,00h,03h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,03h,0bh
            db 00h,00h,03h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,03h,0bh
            db 00h,00h,03h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,03h,0bh
            db 00h,00h,03h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,03h,0bh
            db 00h,00h,03h,03h,03h,03h,0Fh,0Fh,0Fh,0Fh,0Fh,03h,03h,03h,03h,0bh
            db 00h,00h,00h,00h,00h,00h,03h,03h,0Fh,03h,03h,0bh,0bh,0bh,0bh,00h
            db 00h,00h,00h,00h,00h,00h,00h,00h,03h,0bh,0bh,00h,00h,00h,00h,00h
    datamul db 16,32,48,64,80,96,112,128,144,160,176
;--------------------------------------------------------------------------------------------
;Texto Instrucciones
;-------------------------------------------------------------------------------------------- 
    textoINS0     db "Bienvenido al simulador de SPD.$"     ;LIMITE DE CARACTERES ES 30 por renglon punto inlcluido
    textoINS1     db "En el transcurso del juego te $"   
    textoINS2     db "enfrentaras a diversos eventos$"
    textoINS3     db "en los cuales se te ofreceran$"
    textoINS4     db "opciones para lidiar con ellos$"
    textoINS5     db "Utilize el mouse para interac-$"
    textoINS6     db "tuar con dichas opciones. $"
    textoINS7     db "Ingrese un alias sin espacios$"
    textoINS8     db "Alias: $"
    textoINS9     db "Desea guardar Y/N "
    textoINSA     db "$"
    textoINSE     db "Presione una tecla para continuar.$"
;--------------------------------------------------------------------------------------------
;Texto PROLOGO
;--------------------------------------------------------------------------------------------      
    prog0 db "Eres un estudiante de la UNSAM,$"
    prog1 db "alumno de SPD. Es el 7 de septiembre$"
    prog2 db "del 2022. Son las 17:45 y a las$"
    prog3 db "18:00 empieza la clase.$"
    prog4 db "Recien llegas a la entrada de la$"
    prog5 db "universidad del lado de Miguelete$"
    prog6 db "(los aularios) y ves el Tornabus$"
    prog7 db "a lo lejos, apuras el paso para no$"
    prog8 db "perderlo, pero de repente una mujer$"
    prog9 db "te interrumpe...$"
    progE db "Presione una tecla para continuar...$"
;--------------------------------------------------------------------------------------------
;Texto JUEGO acto 0 -- ACRONUMOS: A"Numero" = Acto "numero de acto"
;--------------------------------------------------------------------------------------------
    texA00 db "Mujer (de aspecto raro):$"
    texA01 db "Hola, disculpa que te moleste$"
    texA02 db "pero estamos vendiendo$"                             ;LIMITE DE CARACTERES ES 36 por renglon punto inlcluido
    texA03 db "botellas de agua$"
    texA04 db "y recaudando lo que ganamos$"
    texA05 db "para mejorar las instalaciones$"
    texA06 db "de la universidad$"
    texA07 db "...$"
    texA08 db "...$"
    texA09 db "$"
    texA0A db "... quiere comprar?$"
    texA0E db "                   Elija una opcion.$"                          ;Plantilla
;--------------------------------------------------------------------------------------------
;Texto OPCIONES JUEGO ACTO 0 -- Acronimo: JO = juego opciones, A"numero" = numero de acto
;OP[Letra][Numero] = opcion con la letra A B o C y seguido por el numero de renglon.
;--------------------------------------------------------------------------------------------
    texJA0OPA0 db " $"                                        ;LIMITE DE CARACTERES ES 11 por renglon punto incluido
    texJA0OPA1 db "Seguis de  $"     
    texJA0OPA2 db "largo como $"
    texJA0OPA3 db "sino       $"
    texJA0OPA4 db "hubieras   $"
    texJA0OPA5 db "escuchado  $"
    texJA0OPA6 db "nada       $"
    texJA0OPA7 db 0DCh, 24h

    ;ACA HAY UN FLAG (flag agua)                                                            
    texJA0OPB1 db "Hoy te$"     
    texJA0OPB2 db "sentis$"
    texJA0OPB3 db "bondadoso y$"
    texJA0OPB4 db "compras una$"
    texJA0OPB5 db "botella$"
    texJA0OPB6 db "de agua$"
    texJA0OPB7 db 0DCh, 24h

    texJA0OPC1 db "Usas$"     
    texJA0OPC2 db "la excusa$"
    texJA0OPC3 db "maestra: $"
    texJA0OPC4 db "No tengo$"
    texJA0OPC5 db "plata$"
    texJA0OPC6 db "(si tenes)$"
    texJA0OPC7 db 0DCh, 24h
;--------------------------------------------------------------------------------------------
;Texto JUEGO acto 1
;--------------------------------------------------------------------------------------------
    texA10 db " $"
    texA11 db "Eres un estudiante de la UNSAM,     $"       ;LIMITE DE CARACTERES ES 36 por renglon punto inlcluido
    texA12 db "alumno de SPD. Son las 17:45 y a las$"
    texA13 db "18:00 empieza la clase. Estas en la $"
    texA14 db "entrada de la universidad del lado  $"
    texA15 db "de los aularios y ves al Tornabus   $"
    texA16 db "a lo lejos, apuras el paso para no  $"
    texA17 db "perderlo, pero de repente...        $"
    texA18 db " $"
    texA19 db " $"
    texA1A db " $"
    texA1E db "        Elija una opcion.(1, 2 o 3)$"                          ;Plantilla
;--------------------------------------------------------------------------------------------
;Texto OPCIONES JUEGO ACTO 1
;--------------------------------------------------------------------------------------------
    texJA1OPA0    db " $"                               ;LIMITE DE CARACTERES ES 11 por renglon punto incluido
    texJA1OPA1 db "Seguis de  $"     
    texJA1OPA2 db "largo como $"
    texJA1OPA3 db "sino       $"
    texJA1OPA4 db "hubieras   $"
    texJA1OPA5 db "escuchado  $"
    texJA1OPA6 db "nada       $"
    texJA1OPA7 db "    [1]    $"
                                                            
    texJA1OPB1 db "Seguis de  $"     
    texJA1OPB2 db "largo como $"
    texJA1OPB3 db "sino       $"
    texJA1OPB4 db "hubieras   $"
    texJA1OPB5 db "escuchado  $"
    texJA1OPB6 db "nada       $"
    texJA1OPB7 db "    [2]    $"

    texJA1OPC1 db "Seguis de $"     
    texJA1OPC2 db "largo como$"
    texJA1OPC3 db "sino      $"
    texJA1OPC4 db "hubieras  $"
    texJA1OPC5 db "escuchado $"
    texJA1OPC6 db "nada      $"
    texJA1OPC7 db "    [3]   $"

;--------------------------------------------------------------------------------------------
;CODE SEGMENT
;--------------------------------------------------------------------------------------------
.code
;--------------------------------------------------------------------------------------------
;Funciones EXTERNAS
;--------------------------------------------------------------------------------------------
    extrn ESPERA:proc
;--------------------------------------------------------------------------------------------
;Programa principal
;--------------------------------------------------------------------------------------------     
    main proc
        mov ax, @data
        mov ds, ax      
;--------------------------------------------------------------------------------------------
;Seteo del margenes principales
;--------------------------------------------------------------------------------------------
            call limpiaBuffer
            call dibCuadro  
;--------------------------------------------------------------------------------------------
;Dibujar LOGO
;--------------------------------------------------------------------------------------------
    ;Seteo dibujo
            push di                 ;profilaxis
            push bx
            xor bx,bx               ;Limpio bx
            mov dx, 23              ;cord y centramos el logo
            mov cx, 45              ;cord x
            mov di, 0               ;Inicializo el index
        dibujar:
            mov ah, 0ch             ;Int 10 dibujar pixel
            mov al, [dibujo+di]     ;Dibujo el primer color
            int 10h

            inc di                  ;Incrementamos para pasar al sig color
            inc cx                  ;avanzamos en el eje x
            xor ax,ax               ;Limpiamos AX
            mov al, datamul[bx]    ;movemos el primer valor del array para comparar el fin de linea    di: 0029 AX: 5600  
            cmp di, ax
            je incr
            jmp ultimoPix
        incr:                       ;En el caso de llegar al fin de linea, se incrementa el eje Y y se avanza al siguiente corte de linea
            inc dx
            inc bx
            mov cx, 45              ;Reiniciamos la posicion del eje X para el comienzo de la linea nueva.
        ultimoPix:                 
            cmp di, 175             ;Posicion final de corte
            jne dibujar
            pop bx
            pop di
;--------------------------------------------------------------------------------------------
;Seteo de Texto Menu principal
;--------------------------------------------------------------------------------------------
            mov ah, 02h     ;Colocar Cursor
            mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
            mov dh, 50      ;Fila
            mov dl, 00      ;Columna
            int 10h
    ;Seteamos el primer renglon            
            mov ah, 02h     ;Colocor Cursor
            mov dh, 03      ;Fila
            mov dl, 8      ;Columna
            int 10h

            lea dx, texto1 
            mov ah, 09h
            int 21h
    ;Seteamos el cuarto renglon
            
            mov ah, 02h     ;Colocor Cursor
            mov dh, 10      ;Fila
            mov dl, 06      ;Columna
            int 10h

            lea dx, texto4  
            mov ah, 09h
            int 21h

    ;Seteamos el quinto renglon
            
            mov ah, 02h     ;Colocor Cursor
            mov dh, 10      ;Fila
            mov dl, 06      ;Columna
            int 10h

            lea dx, textoEnter  
            mov ah, 09h
            int 21h
    ;Seteamos el sexto renglon
            
            mov ah, 02h     ;Colocor Cursor
            mov dh, 14      ;Fila
            mov dl, 06      ;Columna
            int 10h

            lea dx, texto6  
            mov ah, 09h
            int 21h
    ;Seteamos el septimo renglon
            
            mov ah, 02h     ;Colocor Cursor
            mov dh, 17      ;Fila
            mov dl, 06      ;Columna
            int 10h

            lea dx, texto7  
            mov ah, 09h
            int 21h

    ;Seteamos el octavo renglon
            mov ah, 02h     ;Colocor Cursor
            mov dh, 19      ;Fila
            mov dl, 06      ;Columna
            int 10h

            lea dx, texto8  
            mov ah, 09h
            int 21h
    ;Seteamos el noveno renglon
            mov ah, 02h     ;Colocor Cursor
            mov dh, 21      ;Fila
            mov dl, 06      ;Columna
            int 10h

            lea dx, textoE  
            mov ah, 09h
            int 21h

            call pausa
;--------------------------------------------------------------------------------------------
;Instrucciones
;--------------------------------------------------------------------------------------------
        rend:
            call limpiaBuffer
            call dibCuadro
    ;Seteo el texo de las instrucciones
                mov ah, 02h             ;Colocar Cursor
                mov bh, 00              ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 50              ;Fila
                mov dl, 00              ;Columna
                int 10h
        ;Seteamos el primer renglon            
                mov ah, 02h             ;Colocor Cursor
                mov dh, 03              ;Fila
                mov dl, 6               ;Columna
                int 10h

                lea dx, textoINS0       
                mov ah, 09h
                int 21h
        ;Seteamos el segundo renglon
                
                mov ah, 02h             ;Colocor Cursor
                mov dh, 04              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS1       
                mov ah, 09h
                int 21h

        ;Seteamos el tercer renglon
                
                mov ah, 02h             ;Colocor Cursor
                mov dh, 05              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS2       
                mov ah, 09h
                int 21h
        ;Seteamos el cuarto renglon
                
                mov ah, 02h             ;Colocor Cursor
                mov dh, 06              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS3       
                mov ah, 09h
                int 21h
        ;Seteamos el quinto renglon
                
                mov ah, 02h             ;Colocor Cursor
                mov dh, 07              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS4       
                mov ah, 09h
                int 21h
        ;Seteamos el sexto renglon
                
                mov ah, 02h             ;Colocor Cursor
                mov dh, 08              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS5       
                mov ah, 09h
                int 21h
        ;Seteamos el septimo renglon
                
                mov ah, 02h             ;Colocor Cursor
                mov dh, 09              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS6       
                mov ah, 09h
                int 21h
        ;Seteamos el septimo renglon
                
                mov ah, 02h             ;Colocor Cursor
                mov dh, 12              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS7       
                mov ah, 09h
                int 21h        

        ;Seteamos el octavo renglon 
                mov ah, 02h             ;Colocor Cursor
                mov dh, 14              ;Fila
                mov dl, 06              ;Columna
                int 10h

                lea dx, textoINS8       
                mov ah, 09h
                int 21h

                push bx
                push cx
                push dx

                xor cx,cx
                xor bx,bx
                mov cl, 7
        ;Carga de nombre
            carga:
                mov ah, 1
                int 21h
                mov dl, al
                cmp al, 0dh             ; Detecto si un nombre es vacio
                je estaVacio
                cmp al, 20h             ; Detecto el uso de espacio, no permitido
                je reinicio
                cmp al, 08h             ; Detecto que tipeó backspace
                je irParaAtras
                mov nombre[bx], al
                inc bx
                loop carga 
                jmp finCarga
            estaVacio:
                cmp bx,0
                je cargaDeCero
                jmp finCarga
            irParaAtras:
                mov dl,20h              ; como el cursor retrocedió, imprimo un espacio sobre la letra que estaba
                mov ah,2
                int 21h

                mov dl,08h              ; Imprimo un "backspace" para que vuelva de nuevo para atrás el crusor
                mov ah,2
                int 21h
            
                cmp bx,0                ; me fijo si el índice está en la posición 0
                je cargaDeCero          ; Si está en la 0, reinicio la posicion
                mov nombre[bx], 24h     ; Pisamos el valor
                dec bx                  ; Decrementamos para no romper la variable nombre
                mov nombre[bx], 24h     ; y volvemos a pisar
                inc cx                  ; incrementamos cx para recuperar el loop
                jmp carga
            cargaDeCero:
                mov ah, 02h     
                mov dh, 14      
                mov dl, 13      
                int 10h
                jmp carga
            reinicio:
                pisar:
                    mov nombre[bx], 24h
                    inc bx
                    loop pisar
                jmp rend
            finCarga:
                 
        ;Seteamos el octavo renglon
                mov ah, 02h     
                mov dh, 16      
                mov dl, 06      
                int 10h

                lea dx, textoINS9  ;Pregunta si guardar el nombre
                mov ah, 09h
                int 21h

            ;Verificamos si desea guardar.
            preguntar:    
                mov ah, 1
                int 21h
                cmp al, "Y"
                je guarda
                cmp al, "y"
                je guarda
                cmp al, "N"
                je noGuarda
                cmp al, "n"
                je noGuarda

            ;Evitamos que aparezca la letra ingresada
                mov dl,08h     
                mov ah,2
                int 21h

                mov dl,20h
                mov ah,2
                int 21h

            ;Para evitar romper el cuadro, reiniciamos la posicion
                mov ah, 0ch
                mov ah, 02h     
                mov dh, 16      
                mov dl, 24      
                int 10h

                jmp preguntar
            noGuarda:                               ;Si no guarda, renderiza de nuevo y limpia la variable nombre.
                xor bx, bx
                xor cx, cx
                mov cx, 7
                pisa:
                    mov nombre[bx], 24h
                    inc bx
                    loop pisa
                jmp rend
            guarda:

        ;Seteamos el noveno renglon
                mov ah, 02h     
                mov dh, 16      
                mov dl, 03      
                int 10h

                lea dx, textoINSE  ;Carga direccion nombre
                mov ah, 09h
                int 21h
          
                pop dx
                pop cx
                pop bx

                call pausa
;--------------------------------------------------------------------------------------------
;PROLOGO
;--------------------------------------------------------------------------------------------
    ;Limpio la pantallas
            call limpiaBuffer
    ;Seteo cuadro de texto
            call dibCuadroCentrado
    ;Seteo de texto.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocupa los 64kb
                mov dh, 50      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 02      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog0  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                mov ah, 02h     ;Colocor Cursor
                mov dh, 03      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog1 
                mov ah, 09h
                int 21h

        ;Seteamos el tercer renglon
                
                mov ah, 02h     ;Colocor Cursor
                mov dh, 04      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog2  
                mov ah, 09h
                int 21h

        ;Seteamos el cuarto renglon
                
                mov ah, 02h     ;Colocor Cursor
                mov dh, 05      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog3  
                mov ah, 09h
                int 21h

        ;Seteamos el quinto renglon
                
                mov ah, 02h     ;Colocor Cursor
                mov dh, 06      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog4  
                mov ah, 09h
                int 21h
        ;Seteamos el sexto renglon
                
                mov ah, 02h     ;Colocor Cursor
                mov dh, 07      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog5  
                mov ah, 09h
                int 21h
        ;Seteamos el septimo renglon
                
                mov ah, 02h     ;Colocor Cursor
                mov dh, 08      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog6  
                mov ah, 09h
                int 21h

        ;Seteamos el octavo renglon
                mov ah, 02h     ;Colocor Cursor
                mov dh, 09      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog7  
                mov ah, 09h
                int 21h
        ;Seteamos el noveno renglon
                mov ah, 02h     ;Colocor Cursor
                mov dh, 10      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog8  
                mov ah, 09h
                int 21h
        ;Seteamos el decimo renglon
                mov ah, 02h     ;Colocor Cursor
                mov dh, 11      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, prog9  
                mov ah, 09h
                int 21h

        ;Seteamos el renglon de salida.
                mov ah, 02h     ;Colocor Cursor
                mov dh, 13      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, progE  
                mov ah, 09h
                int 21h
            call pausa
            call limpiaBuffer
;--------------------------------------------------------------------------------------------
;ACTO 0
;--------------------------------------------------------------------------------------------
    ;Seteo Cuadro Texto(TAMAÑO MEDIANO)
            call dibCuadroTexto
    ;Seteo de texto.
                mov ah, 02h     ;Colocor Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 50      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 02      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texA00  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                mov ah, 02h     ;Colocor Cursor
                mov dh, 03      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texA01  
                mov ah, 09h
                int 21h

        ;Seteamos el tercer renglon
                
                mov ah, 02h     ;Colocor Cursor
                mov dh, 04      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texA02  
                mov ah, 09h
                int 21h

        ;Seteamos el cuarto renglon
                
                mov ah, 02h     ;Colocor Cursor
                mov dh, 05      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texA03  
                mov ah, 09h
                int 21h

        ;Seteamos el quinto renglon
                
                mov ah, 02h     ;Colocor Cursor
                mov dh, 06      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texA04  
                mov ah, 09h
                int 21h
        ;Seteamos el sexto renglon
                
                mov ah, 02h     ;Colocor Cursor
                mov dh, 07      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texA05  
                mov ah, 09h
                int 21h
        ;Seteamos el septimo renglon
                
                mov ah, 02h     ;Colocor Cursor
                mov dh, 08      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texA06  
                mov ah, 09h
                int 21h

        ;Seteamos el octavo renglon
                mov ah, 02h     ;Colocor Cursor
                mov dh, 09      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texA07  
                mov ah, 09h
                int 21h
        ;Seteamos el noveno renglon
                mov ah, 02h     ;Colocor Cursor
                mov dh, 10      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texA08  
                mov ah, 09h
                int 21h
        ;Seteamos el decimo renglon
                mov ah, 02h     ;Colocor Cursor
                mov dh, 11      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texA0A  
                mov ah, 09h
                int 21h

        ;Seteamos el renglon de salida.
                mov ah, 02h     ;Colocar Cursor
                mov dh, 13      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texA0E  
                mov ah, 09h
                int 21h

                xor ax, ax
                mov ah, 1       ;3
                push ax
                call ESPERA
    ;Seteo del margenes cuadro opcion izq
            call opcionIZQ
    ;Seteo de opciones A.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 00      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 16      ;Fila
                mov dl, 02      ;Columna
                int 10h

                lea dx, texJA0OPA1  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 17      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJA0OPA2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el tercer renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 18      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJA0OPA3  
                 mov ah, 09h
                 int 21h

        ;Seteamos el cuarto renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 19      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJA0OPA4  
                 mov ah, 09h
                 int 21h

        ;Seteamos el quinto renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 20      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJA0OPA5  
                 mov ah, 09h
                 int 21h
        ;Seteamos el sexto renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 21      ;Fila
                 mov dl, 02      ;Columna
                 int 10h

                 lea dx, texJA0OPA6  
                 mov ah, 09h
                 int 21h
        ;Seteamos el septimo renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 23      ;Fila
                 mov dl, 7      ;Columna
                 int 10h

                 lea dx, texJA0OPA7  
                 mov ah, 09h
                 int 21h

                xor ax, ax
                mov ah, 1       ;2
                push ax
                call ESPERA
    ;Seteo del margenes cuadro opcion cen
            call opcionCEN
    ;Seteo de opciones B.
                mov ah, 02h     ;Colocar Cursor
                mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                mov dh, 00      ;Fila
                mov dl, 00      ;Columna
                int 10h

        ;Seteamos el primer renglon

                mov dh, 16      ;Fila
                mov dl, 15      ;Columna
                int 10h

                lea dx, texJA0OPB1  
                mov ah, 09h
                int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 17      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJA0OPB2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el tercer renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 18      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJA0OPB3  
                 mov ah, 09h
                 int 21h

        ;Seteamos el cuarto renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 19      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJA0OPB4  
                 mov ah, 09h
                 int 21h

        ;Seteamos el quinto renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 20      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJA0OPB5  
                 mov ah, 09h
                 int 21h
        ;Seteamos el sexto renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 21      ;Fila
                 mov dl, 15      ;Columna
                 int 10h

                 lea dx, texJA0OPB6  
                 mov ah, 09h
                 int 21h
        ;Seteamos el septimo renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 23      ;Fila
                 mov dl, 15+5      ;Columna
                 int 10h

                 lea dx, texJA0OPB7  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 1       ;2
                 push ax
                 call ESPERA
    ;Seteo del margenes cuadro opcion der
            call opcionDER
    ;Seteo de opciones C.
                 mov ah, 02h     ;Colocar Cursor
                 mov bh, 00      ;PAGINA 0 no necesaria para 320x200 pues ocuopa los 64kb
                 mov dh, 00      ;Fila
                 mov dl, 00      ;Columna
                 int 10h

        ;Seteamos el primer renglon

                 mov dh, 16      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJA0OPC1  
                 mov ah, 09h
                 int 21h

        ;Seteamos el segundo renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 17      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJA0OPC2  
                 mov ah, 09h
                 int 21h

        ;Seteamos el tercer renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 18      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJA0OPC3  
                 mov ah, 09h
                 int 21h

        ;Seteamos el cuarto renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 19      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJA0OPC4  
                 mov ah, 09h
                 int 21h

        ;Seteamos el quinto renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 20      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJA0OPC5  
                 mov ah, 09h
                 int 21h
        ;Seteamos el sexto renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 21      ;Fila
                 mov dl, 28      ;Columna
                 int 10h

                 lea dx, texJA0OPC6  
                 mov ah, 09h
                 int 21h
        ;Seteamos el septimo renglon
                
                 mov ah, 02h     ;Colocor Cursor
                 mov dh, 23      ;Fila
                 mov dl, 28+5      ;Columna
                 int 10h

                 lea dx, texJA0OPC7  
                 mov ah, 09h
                 int 21h

                 xor ax, ax
                 mov ah, 1       ;2
                 push ax
                 call ESPERA
            ;LLamo a la interaccion el mouse
                 call mouse
            ;Recupero la opcion elegida
                 mov opcion, bl


    call pausa    ;PAUSA
;--------------------------------------------------------------------------------------------
;ACTO 1
;--------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------
;ACTO 2
;--------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------
;ACTO 3
;--------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------
;END GAME
;--------------------------------------------------------------------------------------------
;Finalizo el programa
    mov ax, 4c00h
    int 21h

main endp

;Activa una pausa.
    pausa proc NEAR
            mov ah, 10h         ;activa una pausa (EXTERNA)
            int 16h
            ret
    pausa endp
;Funcion que dibuja cuadro grande
    dibCuadro proc NEAR
        ;Seteo margen, esquina sup izq
                mov cx, 10      ;CX = Coord X
                mov dx, 10      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibY:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 190     ;Posicion final
                jne dibY

        ;Seteo ESTO DIBUJA LA ESQUINA inf izq
                mov cx, 10      ;cord X
                mov dx, 190     ;cord Y

        ;Seteo margen inferior
            dibX:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h     ;Color MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 310     ;Posicion 1
                jne dibX

        ;Seteo VUELVO A LA ESQUINA sup izq
                mov cx, 10     ;cord x
                mov dx, 10     ;cord y

        ;Seteo margen Superior
            dibX2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h     ;COLOR CYAN
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 310     ;Posicion 1
                jne dibX2

        ;Seteo ESQUINA sup der
                mov cx, 310     ;cord x
                mov dx, 10     ;cord y
                
        ;Seteo margen derecho
            dibY2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h     ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 191     ;Posicion 1
                jne dibY2

        ;Seteo margen, esquina sup der
                mov cx, 9       ;CX = Coord X
                mov dx, 9       ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibaY:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 189     ;Posicion final
                jne dibaY

        ;Seteo ESQUINA inf izq
                mov cx, 9       ;cord X
                mov dx, 189     ;cord Y

        ;Seteo margen inferior
            dibaX:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;Color MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 309     ;Posicion 1
                jne dibaX

        ;Seteo SQUINA sup izq
                mov cx, 9       ;cord x
                mov dx, 9       ;cord y

        ;Seteo margen Superior
            dibaX2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;COLOR CYAN
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 309     ;Posicion 1
                jne dibaX2

        ;Seteo ESQUINA sup der
                mov cx, 309     ;cord x
                mov dx, 09      ;cord y
                
        ;Seteo margen derecho
            dibaY2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 190     ;Posicion 1
                jne dibaY2
                ret
    dibCuadro endp
;Limpia la pantalla(CAUSA FLICKERING)
    limpiaBuffer proc NEAR 
            mov ah, 00h         ;Peticion para habilitar VGA
            mov al, 13h         ;320 x 200  VGA
            int 10h
            
            mov ah, 0bh         ;Paleta de colores 256
            mov bx, 0000h       ;Negro
            int 10h             ;Setea background
            ret
    limpiaBuffer endp
;Funcion que dibuja un cuadro de texto centrado en aclaraciones, no interactivo
    dibCuadroCentrado proc NEAR
        ;Seteo margen, esquina sup izq
                mov cx, 10      ;CX = Coord X
                mov dx, 10      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibCTCY:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 115     ;Posicion final
                jne dibCTCY

        ;Seteo ESQUINA inf izq
                mov cx, 10      ;cord X
                mov dx, 115     ;cord Y

        ;Seteo margen inferior
            dibCTCX:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 310     ;Posicion 1
                jne dibCTCX

        ;Seteo ESQUINA sup izq
                mov cx, 10      ;cord x
                mov dx, 10      ;cord y

        ;Seteo margen Superior
            dibCTCX2:   
                mov ah, 0ch      ;Int 10 dibujar pixel
                mov al, 0003h    ;COLOR MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 310     ;Posicion 1
                jne dibCTCX2

        ;Seteo ESQUINA sup der
                mov cx, 310     ;cord x
                mov dx, 10      ;cord y
                
        ;Seteo margen derecho
            dibCTCY2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 116     ;Posicion 1
                jne dibCTCY2
                ret
    dibCuadroCentrado endp    
;Funcion que dibuja un cuadro de texto mediano.
    dibCuadroTexto proc NEAR
        ;Seteo margen, esquina sup izq
                mov cx, 10      ;CX = Coord X
                mov dx, 10      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibCTY:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 115     ;Posicion final
                jne dibCTY

        ;Seteo ESQUINA inf izq
                mov cx, 10      ;cord X
                mov dx, 115     ;cord Y

        ;Seteo margen inferior
            dibCTX:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;Color CYAN
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 310     ;Posicion 1
                jne dibCTX

        ;Seteo ESQUINA sup izq
                mov cx, 10      ;cord x
                mov dx, 10      ;cord y

        ;Seteo margen Superior
            dibCTX2:   
                mov ah, 0ch      ;Int 10 dibujar pixel
                mov al, 0005h    ;COLOR MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 310     ;Posicion 1
                jne dibCTX2

        ;Seteo ESQUINA sup der
                mov cx, 310     ;cord x
                mov dx, 10      ;cord y
                
        ;Seteo margen derecho
            dibCTY2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 116     ;Posicion 1
                jne dibCTY2
                ret
    dibCuadroTexto endp
;Funcion que grafica la opcion izquierda
    opcionIZQ proc NEAR
        ;Seteo margen, esquina sup izq
                    mov cx, 10      ;CX = Coord X
                    mov dx, 125      ;DX = Coord Y 320   64k
            ;Seteo margen izq
                dibOPY:
                    mov ah, 0ch     ;Int 10 dibujar pixel
                    mov al, 0005h   ;Color MAGENTA
                    int 10h

                    inc dx          ;Incrementa por el eje y
                    cmp dx, 190     ;Posicion final
                    jne dibOPY

            ;Seteo esquina inf izq
                    mov cx, 10      ;cord X
                    mov dx, 190     ;cord Y

            ;Seteo margen inferior
                dibOPX:   
                    mov ah, 0ch     ;Int 10 dibujar pixel
                    mov al, 0005h     ;Color MAGENTA
                    int 10h

                    inc cx          ;Incrementa por el eje x
                    cmp cx, 106     ;Posicion 1
                    jne dibOPX

            ;Seteo VUELVO esquina sup izq
                    mov cx, 10     ;cord x
                    mov dx, 125     ;cord y

            ;Seteo margen Superior
                dibOPX2:   
                    mov ah, 0ch     ;Int 10 dibujar pixel
                    mov al, 0005h     ;color MAGENTA
                    int 10h

                    inc cx          ;Incrementa por el eje x
                    cmp cx, 106     ;Posicion 1
                    jne dibOPX2

            ;Seteo esquina sup der
                    mov cx, 106     ;cord x
                    mov dx, 125     ;cord y
                    
            ;Seteo margen derecho
                dibOPY2:   
                    mov ah, 0ch     ;Int 10 dibujar pixel
                    mov al, 0005h     ;Color MAGENTA
                    int 10h

                    inc dx          ;Incrementa por el eje y
                    cmp dx, 191     ;Posicion 1
                    jne dibOPY2
                    ret
    opcionIZQ endp
;Funcion que grafica la opcion central
    opcionCEN proc NEAR
        ;Seteo margen, esquina sup izq
                mov cx, 112      ;CX = Coord X
                mov dx, 125      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibOPCY:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h   ;color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 190     ;Posicion final
                jne dibOPCY

        ;Seteo esquina inf izq
                mov cx, 112      ;cord X
                mov dx, 190     ;cord Y

        ;Seteo margen inferior
            dibOPCX:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h     ;Color CYAN
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 208     ;Posicion 1
                jne dibOPCX

        ;Seteo esquina sup izq
                mov cx, 112     ;cord x
                mov dx, 125     ;cord y

        ;Seteo margen Superior
            dibOPCX2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h     ;COLOR CYAN
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 208     ;Posicion 1
                jne dibOPCX2

        ;Seteo esquina sup der
                mov cx, 208     ;cord x
                mov dx, 125     ;cord y
                
        ;Seteo margen derecho
            dibOPCY2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0003h     ;Color CYAN
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 191     ;Posicion 1
                jne dibOPCY2
                ret
    opcionCEN endp
;Funcion que grafica la opcion derecha
    opcionDER proc NEAR
        ;Seteo margen, esquina sup izq
                mov cx, 214     ;CX = Coord X
                mov dx, 125      ;DX = Coord Y 320   64k
        ;Seteo margen izq
            dibOPDY:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h   ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 190     ;Posicion final
                jne dibOPDY

        ;Seteo esquina inf izq
                mov cx, 214      ;cord X
                mov dx, 190     ;cord Y

        ;Seteo margen inferior
            dibOPDX:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h     ;Color MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje x
                cmp cx, 310     ;Posicion 1
                jne dibOPDX

        ;Seteo esquina sup izq
                mov cx, 214     ;cord x
                mov dx, 125     ;cord y

        ;Seteo margen Superior
            dibOPDX2:   
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h     ;COLOR MAGENTA
                int 10h

                inc cx          ;Incrementa por el eje y
                cmp cx, 310     ;Posicion 1
                jne dibOPDX2

        ;Seteo esquina sup der
                mov cx, 310     ;cord x
                mov dx, 125     ;cord y
                
        ;Seteo margen derecho
            dibOPDY2:
                mov ah, 0ch     ;Int 10 dibujar pixel
                mov al, 0005h     ;Color MAGENTA
                int 10h

                inc dx          ;Incrementa por el eje y
                cmp dx, 191     ;Posicion 1
                jne dibOPDY2
                ret
    opcionDER endp 
;Funcion que controla el mouse, devuelve la opcion legida por medio de BL
    mouse proc NEAR
    mov ah,02h
    mov bh,00  ;seteo en la primera fila
    mov dl,79d ;seteo en la ultima columna
    mov dh,00h
    int 10h
    ;imprimimos el caracter de la X ahi 
    mov ah,02h
    mov dl,'X'
    int 21h
   
    ; Activamos el handler del mouse
    mov ax,00h
    int 33h
    ; lo hacemos visible e indicamos esta etiqueta que nos sera de utilidad
    consultar:

    mov ax,01h
    int 33h
    ; Con esta funcion obtenemos el clic con el que se hizo y las coordenadas en pixeles
    ; de donde anda el cursor
    mov ax,03h
    int 33h
    
    cmp bx,1    ; si se presiono clic izquierdo
    je izquierda ; ve a una etiqueta que se llama izquierda 
    cmp bx,2    ; si no compara ahora a ver si no es clic derecho
    jmp consultar   ; si si es vuelve a consultar porque solo se debe validar con clic izquierdo
    
     izquierda:
        ; el valor de las lineas horizontales se van del registro cx a ax para dividirlos
        ; primero posicionamos el cursor en pantalla en las coordenadas (0,79)
        mov ax,cx
        mov bl,8    ; en bl se guarda el valor dde 8 porque para hacer la conversion es necesario
        div bl      ; se conoce como mickey el valor obtenido
        mov coordX,al   ; cuardamos el valor de la division en coordX
        
        mov ax,dx       ; aplicamos el mismo proceso 
        mov bl,8
        div bl
        mov coordY,al   ; se guarda en coordY
        
        cmp coordY, 23  ; Ahora comprobamos que este en ese rango en este caso en la fila 23
        je comprobar_vertical_opcion1   ; si es correcto ve a comprobar que este en la vertical igual
        cmp coordY, 0 ; comparo la coordenada y con la fila 0
        je cierre
        jmp consultar


        ;etiqueta para cerrar con "X" (tiene un rango de 3 valores en el eje x)
    cierre:
            cmp coordX, 78
            je finMouse
            cmp coordX, 77
            je finMouse
            cmp coordX, 76
            je finMouse
            jmp consultar
        
        ;etiquetas para clickear las opciones de las cajas (tiene un rango de 3 valores en el eje x)
    comprobar_vertical_opcion1:
            cmp coordX, 14  ; 4FH = 79D 
            je salidaIZQ
            cmp coordX, 15
            je salidaIZQ       ; si es verdad sal del programa
            cmp coordX, 16
            je salidaIZQ
    comprobar_vertical_opcion2:
            cmp coordX, 39
            je salidaCEN
            cmp coordX, 40
            je salidaCEN       
            cmp coordX, 41
            je salidaCEN
    comprobar_vertical_opcion3:
            cmp coordX, 65
            je salidaDER
            cmp coordX, 66
            je salidaDER       
            cmp coordX, 67
            je salidaDER
            jmp consultar
            
    salidaIZQ:
        mov bl, 1
        jmp finMouse
    salidaCEN:
        mov bl, 2
        jmp finMouse
    salidaDER:
        mov bl, 3
        jmp finMouse
    finMouse:
    mov ax,02h
    int 33h
    ret
    mouse endp
end