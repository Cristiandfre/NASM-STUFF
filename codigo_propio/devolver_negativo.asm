SECTION .text
global make_negative

make_negative: 
  ;xor  eax, eax  ; eax, the answer
  mov eax, edi          ; El argumento es colocado en eax
  cmp eax, 0            ; Se verifica si es negativo o positivo
  js num_negativo       ; Se ejecuta el codigo definido si es negativo  
  jmp num_noNegativo    ; Se ejecuta el codigo definido si no es negativo
  
num_negativo:
  ret

num_noNegativo:
  imul eax, eax, -1     ; Si no es negativo, se multiplica eax por -1 y se guarda en eax
  ret
