; //Irvine32 template	(irvine32_template.asm)

; //include Irvine32.inc

INCLUDE Irvine32.inc
L = 100
.data

randString BYTE L DUP(' ') ; if not full prints whitespace

.code
CreateRandomString PROC
  push eax;
  push ecx
  dec eax ; 99
  call RandomRange ; 0-99
  inc eax          ; 1-100
  mov ecx, eax
  L2:
    mov eax, 26     ; range
    call RandomRange ; 0-26
    add eax, 65      ; 65 = 'A', so now is A-Z
    mov [esi], eax   ; do next value next loop
    call WriteChar        ; write character
  loop L2      
  call Crlf ; endl
  pop ecx;
  pop eax
  ret
CreateRandomString ENDP

main PROC
  call Randomize ; srand
  mov ecx, 20
  mov esi, OFFSET randString
  mov eax, L
  L1:
    call CreateRandomString
  loop L1
	exit
main ENDP

END main

