.8086
.model small
.stack 100h

.data
    TEXT_MAIN_MENU_TITLE DB 'MENU PRINCIPAL','$' ;text with the main menu title
	TEXT_MAIN_MENU_SINGLEPLAYER DB 'NUEVA PARTIDA - N KEY','$' ;text with the singleplayer message
	TEXT_MAIN_MENU_MULTIPLAYER DB 'CARGAR PARTIDA - C KEY','$' ;text with the multiplayer message
	TEXT_MAIN_MENU_EXIT DB 'SALIR DEL JUEGO - S KEY','$' ;text with the exit game message

.code

MAIN PROC

    mov ax, @data
    mov ds, ax
		
    MOV AH,00h                   ;set the configuration to video mode
    MOV AL,13h                   ;choose the video mode
    INT 10h    					 ;execute the configuration 

    MOV AH,0Bh 					 ;set the configuration
    MOV BH,00h 					 ;to the background color
    MOV BL,00h 					 ;choose black as background color
    INT 10h    					 ;execute the configuration
    
    ;Shows the menu title
    MOV AH,02h                       ;set cursor position
    MOV BH,00h                       ;set page number
    MOV DH,04h                       ;set row 
    MOV DL,04h						 ;set column
    INT 10h							 
    
    MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
    LEA DX,TEXT_MAIN_MENU_TITLE      ;give DX a pointer 
    INT 21h                          ;print the string
    
    ;Shows the singleplayer message
    MOV AH,02h                       ;set cursor position
    MOV BH,00h                       ;set page number
    MOV DH,06h                       ;set row 
    MOV DL,04h						 ;set column
    INT 10h							 
    
    MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
    LEA DX,TEXT_MAIN_MENU_SINGLEPLAYER      ;give DX a pointer 
    INT 21h                          ;print the string
    
    ;Shows the multiplayer message
    MOV AH,02h                       ;set cursor position
    MOV BH,00h                       ;set page number
    MOV DH,08h                       ;set row 
    MOV DL,04h						 ;set column
    INT 10h							 
    
    MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
    LEA DX,TEXT_MAIN_MENU_MULTIPLAYER      ;give DX a pointer 
    INT 21h                          ;print the string
    
    ;Shows the exit message
    MOV AH,02h                       ;set cursor position
    MOV BH,00h                       ;set page number
    MOV DH,0Ah                       ;set row 
    MOV DL,04h						 ;set column
    INT 10h							 
    
    MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
    LEA DX,TEXT_MAIN_MENU_EXIT       ;give DX a pointer 
    INT 21h                          ;print the string	
    
    MAIN_MENU_WAIT_FOR_KEY:
    ;Waits for a key press
        MOV AH,00h
        INT 16h
    
    ;Check whick key was pressed
    ;CMP AL,'S'
    ;JE START_SINGLEPLAYER
    ;CMP AL,'s'
    ;JE START_SINGLEPLAYER
    ;CMP AL,'M'
    ;JE START_MULTIPLAYER
    ;CMP AL,'m'
    ;JE START_MULTIPLAYER
    ;CMP AL,'E'
    ;JE EXIT_GAME
    ;CMP AL,'e'
    ;JE EXIT_GAME
    ;JMP MAIN_MENU_WAIT_FOR_KEY

MAIN ENDP
END MAIN