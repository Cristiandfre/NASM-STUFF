;Complete the function that takes two integers (a, b, where a < b) and return an array of all integers between the input parameters, including them.

;For example:

;a = 1
;b = 4
;--> [1, 2, 3, 4]


section .text
global between

; void between(int a, int b, int *integers)
; a -> edi, b -> esi, *integers -> rdx
; assign function results to provided array
between:
    mov eax, edi ;guardamos a en eax
    mov ebx, esi ;guardamos b en ebx
    
    sub ebx, eax ;obtener los numeros que faltan en medio -> b=10 - a=5 = 5
    
    mov [rdx], eax ; guardamos el primer numero (que es a) en el array
    mov rcx , 1 ; contador para acceder al array
    loop:
    add eax, 1; incrementamos eax en 1 para obtener el siguiente numero
    mov [rdx+rcx*4], eax; guardamos ese valor en la siguiente posicion del array
    inc rcx; incrementamos el contador para acceder al array
    cmp rcx, rbx; comparamos si el contador ya llego a la cantidad de numeros que faltaban en el medio
    jle  loop ;si rcx (contador) es menor o igual que rbx (numeros que faltan en el medio) repite el loop
    
    quit:
    ret ;caso contrario sal de la funcion


