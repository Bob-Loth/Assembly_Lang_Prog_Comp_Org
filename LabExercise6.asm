; //Irvine32 template	(irvine32_template.asm)

; //include Irvine32.inc

INCLUDE Irvine32.inc

.data
buf byte 51 DUP(0)


.code
main PROC
	mov edx, offset buf

mov esi, 0
mov ecx, SizeOf buf
call ReadString ; number of characters entered goes into eax
mov ecx, eax
L1: movzx ebx, buf[esi]
    push ebx ; push contents of eax onto stack
    inc esi
loop L1
mov ecx, eax
mov esi, 0
L2: pop ebx ; get contents of stack, move to eax
    mov buf[esi], bl
    inc esi

loop L2
	exit
main ENDP

END main