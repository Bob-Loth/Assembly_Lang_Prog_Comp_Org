; AddTwoSum.asm - Chapter 3 example.
; Programmer's name: Robert Loth
; Programmer's ID:   1684749
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
Array DWORD 5, 10, 15, 20, 25, 30, 35, 40, 45, 50
.code
main proc
  mov esi, OFFSET Array ; startptr
  mov edi, OFFSET Array ; endptr
  add edi, [SIZEOF Array - TYPE Array] ; end = size - 1 element
  mov ecx, LENGTHOF Array ; 10 at the moment, if changed to LENGTHOF Array / 2, 
  ;would only reverse, and not revert change

loop1:
  mov eax, [esi]
  xchg eax, [edi]
  mov [esi], eax
  add esi, TYPE Array ; increment start
  sub edi, TYPE Array ; decrement end
loop loop1

	invoke ExitProcess,0
main endp
end main