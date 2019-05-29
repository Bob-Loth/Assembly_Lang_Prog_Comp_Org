; //Irvine32 template	(irvine32_template.asm)

; //include Irvine32.inc

INCLUDE Irvine32.inc

.data
op1 QWORD 0A2B2A40674981234h
op2 QWORD 08010870000234502h
str1 BYTE "The difference is ", 0

.code
EX_SUB PROC
shr ecx, 1
mov edx, [esi + ecx]
mov eax, [esi]
sub eax, [edi]
sbb edx, [edi + ecx]

ret
EX_SUB ENDP
main PROC

mov esi, offset op1
mov edi, offset op2
mov ecx, sizeof op1 ; bytes of operand
call EX_SUB

push edx
push eax
mov edx, offset str1
call writeString
pop eax
pop edx
mov ebx, eax
mov eax, edx
call writeHex
mov eax, ebx
call writeHex
	exit
main ENDP
END main