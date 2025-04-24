;Opposite number (NASM)

SECTION .text
global opposite

opposite:
  mov eax, edi
  sub eax, eax ; value - value = 0
  sub eax, edi ; 0 - value = -value
  ret
