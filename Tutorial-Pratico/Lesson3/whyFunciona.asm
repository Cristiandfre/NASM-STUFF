SECTION .data
msg db 'Hello, brave new world!', 0Ah ;Cadena original

SECTION .text
 global _start

_start:
 mov esi, msg ;Apunta al inicio de la memoria msg
 mov ecx, 32  ;Numero de bytes alrededor de la cadena para inspeccionar por que cmp funciona
 
inspect_memory:
 mov al, byte [esi]  ;Cargar el byte actual en AL
 call print_hex      ; Llamar a la rutina para imprimir el byte en formato hexadecimal
 inc esi             ; Pasar al siguiente byte
 loop inspect_memory ; Repetir hasta que ECX llegue a 0

 mov eax, 1
 xor ebx, ebx
 int 0x80


; Rutina para imprimir un byte en formato hexadecimal
print_hex:
    push    eax
    push    ecx

    mov     ecx, 2            ; Dos caracteres hexadecimales por byte
    mov     ebx, 16           ; Base hexadecimal

hex_loop:
    rol     al, 4             ; Mover el nibble más significativo al nibble menos significativo
    and     al, 0x0F          ; Aislar el nibble menos significativo
    cmp     al, 10            ; Determinar si es un número o letra
    jl      is_digit
    add     al, 'A' - 10      ; Convertir a letra hexadecimal (A-F)
    jmp     write_char

is_digit:
    add     al, '0'           ; Convertir a dígito (0-9)

write_char:
    mov     [esp-1], al       ; Escribir el carácter en el stack
    mov     eax, 4
    mov     ebx, 1
    lea     ecx, [esp-1]      ; Dirección del carácter en el stack
    mov     edx, 1
    int     0x80
    loop    hex_loop

    pop     ecx
    pop     eax
    ret
