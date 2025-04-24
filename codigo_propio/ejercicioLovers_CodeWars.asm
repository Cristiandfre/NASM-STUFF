;Timmy & Sarah think they are in love, but around where they live, they will only know once they pick a flower each. If one of the flowers has an even number of petals and the other has an odd number of petals it means they are in love.
;Write a function that will take the number of petals of each flower and return true if they are in love and false if they aren't.



section .text
global lovefunc

section .text
lovefunc:              ; int lovefunc(int flower1, int flower2)
                       ; input:  edi = flower1, esi = flower2
                       ; output: al (1 for true, 0 for false)
    xor eax, eax       ;Limpamos eax    |Div utiliza estos dos registros como dividendo
    xor edx, edx       ;Limpamos edx    |edx es utilizado como la parte alta
    mov eax, edi       ;Movemos flower1 a eax para dividir (es el dividendo)
    mov ecx, 2         ;Movemos el divisor a ecx
    div ecx            ;Dividimos edx:eax entre ecx
    
    mov ebx, edx       ;div Guarda el resto en edx, asi que guardamos 
                       ;el resto de flower 1 en ebx
    
    xor edx, edx       ;Limpiamos edx 
    xor eax, eax       ;Limpiamos eax    |Div utiliza estos dos registros como dividendo
    xor edx, edx       ;Limpiamos edx    |edx es utilizado como la parte alta
    mov eax, esi       ;Repetimos el proceso para flower 2 
    div ecx
    
    mov eax, edx       ;Guardamos nuevamente el resto
                       ;Esta vez de flower 2, y lo hacemos en eax ya que no sera 
                       ;mas utilizado
                     
    cmp ebx, eax       ;Si son iguales quiere decir que no estan enamorados
    je NotInLove       ;Entonces saltamos a NotInLove
    
    mov al, 1          ;Si no hizo el salto quiere decir que estan enamorados
    
    jmp end;           ;Entonces termina la funcion
    
NotInLove:
    mov al, 0         ;Si hizo el salto entonces no estan enamorados y avanza para la
                      ;finalizacion de la funcion

end:
    ret               ;Termina la funcion
; end of lovefunc
