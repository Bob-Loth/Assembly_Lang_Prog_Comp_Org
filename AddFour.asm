; AddTwoSum.asm - Chapter 3 example.
; Programmer's name: Robert Loth
; Programmer's ID:   1684749
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
sum dword 0
valueA dword 2000
valueB dword -100
valueC dword 1000
valueD dword -500

ssum sdword 0
svalueA sdword 2000
svalueB sdword -100
svalueC sdword 1000
svalueD sdword -500
.code
main proc
  ;unsigned version
	mov eax, valueA
  add eax, valueB

  mov ebx, valueC
  add ebx, valueD

  mov sum, eax
  sub sum, ebx
  ;signed version
  mov eax, svalueA
  add eax, svalueB

  mov ebx, svalueC
  add ebx, svalueD

  mov ssum, eax
  sub ssum, ebx
	invoke ExitProcess,0
main endp
end main