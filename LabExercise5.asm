 ; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
  Array WORD 1,2,3,4
  val1 SWORD  100
  val2 SWORD  -100
.code
main proc
 movzx eax, val1
 movsx ebx, val2

;swap pos1 and pos4
 mov ax, [Array + 6]
 xchg ax, Array
 xchg [Array+6],ax

;swap pos3 and pos2
 mov ax, [Array + 4]
 xchg ax, [Array + 2]
 xchg [Array + 4],ax

	invoke ExitProcess,0
main endp
end main