; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov	eax,9	;assignment
	mov	ebx,6
  mov ecx,5
  mov edx,8 
  
  add eax,ebx ;order of operations
  add ecx,edx
  sub eax,ecx
  
	invoke ExitProcess,0
main endp
end main