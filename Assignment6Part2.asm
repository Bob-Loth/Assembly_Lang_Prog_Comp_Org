; //Irvine32 template	(irvine32_template.asm)

; //include Irvine32.inc

INCLUDE Irvine32.inc

.data
choice1to5 BYTE "1. x AND y",13,10,"2. x OR y",13,10,"3. NOT x",13,10,"4. x XOR y",13,10,"5. quit",13,10, 0
enterX BYTE "Enter a 32-bit hexadecimal integer: ", 0
enterY BYTE "Enter a second 32-bit hexadecimal integer: ", 0
AND_result BYTE "Result of AND operation is ", 0
OR_result BYTE "Result of OR operation is ", 0
NOT_result BYTE "Result of NOT operation is ", 0
XOR_result BYTE "Result of XOR operation is ", 0
.code
AND_op PROC
push eax
push ebx

mov edx, offset enterX
call writeString
call readHex
call crlf
mov ebx, eax

mov edx, offset enterY
call writeString
call readHex
call crlf

AND ebx, eax
mov edx, offset AND_result
call writeString
mov eax, ebx
call writeHex
call crlf
pop ebx
pop eax
ret
AND_op ENDP
OR_op PROC
push eax
push ebx

mov edx, offset enterX
call writeString
call readHex
call crlf
mov ebx, eax

mov edx, offset enterY
call writeString
call readHex
call crlf

OR ebx, eax
mov edx, offset OR_result
call writeString
mov eax, ebx
call writeHex
call crlf
pop ebx
pop eax
ret
OR_op ENDP
XOR_op PROC
push eax
push ebx

mov edx, offset enterX
call writeString
call readHex
call crlf
mov ebx, eax

mov edx, offset enterY
call writeString
call readHex
call crlf

XOR ebx, eax
mov edx, offset XOR_result
call writeString
mov eax, ebx
call writeHex
call crlf
pop ebx
pop eax
ret
XOR_op ENDP
NOT_op PROC
push eax
mov edx, offset enterX
call writeString
call readHex
call crlf

NOT eax
mov edx, offset NOT_result
call writeString
call writeHex
call crlf
pop eax
ret
NOT_op ENDP
main PROC
	L1:
 	mov edx, offset choice1to5
  call writeString
  call readInt
  cmp eax, 1
  je op1
  cmp eax, 2
  je op2
  cmp eax, 3
  je op3
  cmp eax, 4
  je op4
  cmp eax, 5
  je quit
  op1:
  call AND_op
  jmp opdone
  op2:
  call OR_op
  jmp opdone
  op3:
  call NOT_op
  jmp opdone
  op4:
  call XOR_op
  opdone: ; goes to loop
  jmp L1
  quit: ; goes to program exit
	exit
main ENDP
END main