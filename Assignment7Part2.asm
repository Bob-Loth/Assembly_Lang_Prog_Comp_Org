; //Irvine32 template	(irvine32_template.asm)

; //include Irvine32.inc

INCLUDE Irvine32.inc
.data
packed_1a WORD 4536h
packed_1b WORD 7297h
sum_1 DWORD ?

packed_2a DWORD 67345620h
packed_2b DWORD 54496342h
sum_2 DWORD 2 DUP(?)

packed_3a QWORD 6734562000346521h
packed_3b QWORD 5449634205738261h
sum_3 DWORD 3 DUP(?)

str1 BYTE "1", 0
.code
Packed_add PROC
l1:
mov al, [esi]
adc al, [edi]
daa
jnc noCarryAdd
add byte ptr [edx + 1], 1
noCarryAdd:
add byte ptr [edx], al


inc esi
inc edi
inc edx
loop l1
ret
Packed_add ENDP
main PROC


mov sum_1, 0
mov esi,offset packed_1a
mov edi,offset packed_1b
mov edx, offset sum_1
mov ecx, sizeof word
mov ebx, 0

call Packed_add
mov eax, sum_1
call writehex
call crlf

mov esi,offset packed_2a
mov edi,offset packed_2b
mov edx, offset sum_2
mov ecx, sizeof dword
mov ebx, 0

call Packed_add
mov eax, dword ptr [sum_2 + 4]
cmp eax, 1
jz WriteCarry1
jnz writeFull1
WriteCarry1:
mov edx, offset str1
call writeString
jmp stopif1
writeFull1:
call writehex
stopif1:
mov eax, dword ptr [sum_2]
call writehex
call crlf

mov esi, offset packed_3a
mov edi, offset packed_3b
mov edx, offset sum_3
mov ecx, sizeof qword
mov ebx, 0

call Packed_add
mov eax, dword ptr[sum_3 + 8]
cmp eax, 1
jz WriteCarry
jnz writeFull
WriteCarry:
mov edx, offset str1
call writeString
jmp stopif
writeFull:
call writehex
stopif:
mov eax, dword ptr[sum_3 + 4]
call writehex
mov eax, dword ptr[sum_3]
call writehex
call crlf
 exit
main ENDP

END main

