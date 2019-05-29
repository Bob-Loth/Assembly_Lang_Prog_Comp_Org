; //Irvine32 template	(irvine32_template.asm)

; //include Irvine32.inc

INCLUDE Irvine32.inc

.data
str1 BYTE "Please enter lower number: ", 0
str2 BYTE "Please enter higher number: ", 0

lowBound DWORD 0
highBound DWORD 0

.code
BetterRandomRange PROC
   
   push ebx ; save ebx
	 neg ebx ; 
   add eax, ebx ; calculate random range for 0 to high - low
   call RandomRange
   sub eax, ebx ; then add low to the result
   pop ebx
   
	 ret 
BetterRandomRange ENDP


main PROC

mov ecx, 30
mov edx, OFFSET str1

call WriteString ; uses edx
call ReadInt ; uses eax
mov ebx, eax

mov edx, OFFSET str2
call WriteString
call ReadInt

L1:
push eax ; place push/pop outside procedure to use writeInt correctly
call BetterRandomRange ; ebx = low, eax = high
call WriteInt
pop eax ; restore eax only after the random value has been written
call Crlf
loop L1
	exit
main ENDP

END main

