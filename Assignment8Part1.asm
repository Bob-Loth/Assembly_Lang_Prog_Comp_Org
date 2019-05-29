; //Irvine32 template	(irvine32_template.asm)

; //include Irvine32.inc

INCLUDE Irvine32.inc

.data
GCDResult DWORD 0
str1 BYTE "The GCD of ", 0
andstr BYTE " and ", 0
isstr BYTE " is ", 0
num1 DWORD 35,72,31,128,121
num2 DWORD 15,18,17,640,0
.code
GCD PROC
enter 8,0
mov eax, [ebp + 8]
mov ebx, [ebp + 12]
cmp ebx, 0
jz GCDFound1
cmp eax, ebx
jae AGrThB
xchg eax, ebx
AGrThB:
cmp ebx, 0
jz GCDFound1
mov edx, 0 ; div uses edx:eax as dividend
div ebx
cmp edx, 0
jz GCDFound2
mov [ebp-4], ebx
mov [ebp-8], edx

call GCD
GCDFound2:
mov GCDResult, ebx
jmp done
GCDFound1:
mov GCDResult, eax
done:
leave
ret
GCD ENDP


main PROC
mov ecx, 5
mov esi, offset num1
mov edi, offset num2
L1:

push [esi]
push [edi]
call GCD
mov edx, offset str1
call writestring
mov eax, [esi]
call writedec
mov edx, offset andstr
call writestring
mov eax, [edi]
call writedec
mov edx, offset isstr
call writestring
mov eax,  GCDResult
call writedec
call crlf

add esi, 4
add edi, 4
loop L1

	exit
main ENDP
END main