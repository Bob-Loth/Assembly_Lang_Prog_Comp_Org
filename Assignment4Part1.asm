; AddTwoSum.asm - Chapter 3 example.
; Programmer's name: Robert Loth
; Programmer's ID:   1684749
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
bigEndian BYTE 12h, 34h, 56h, 78h
littleEndian DWORD ? ; make it 78,56,34,12 by the end.

.code
main proc
  mov al, bigEndian + 3
  mov ah, bigEndian + 2
  mov bl, bigEndian + 1
  mov bh, bigEndian

  mov BYTE PTR littleEndian, al ; step through bytes in littleEndian
  mov BYTE PTR [littleEndian + 1], ah
  mov BYTE PTR [littleEndian + 2], bl
  mov BYTE PTR [littleEndian + 3], bh
	invoke ExitProcess,0
main endp
end main