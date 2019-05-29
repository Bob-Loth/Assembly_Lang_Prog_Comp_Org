; //Irvine32 template	(irvine32_template.asm)

; //include Irvine32.inc

INCLUDE Irvine32.inc
.data
str1 BYTE " Letter Grade: "
.code
CalcGrade PROC
pushfd
cmp al, 60
jb Fgrade
cmp al, 70 
jb Dgrade
cmp al, 80
jb Cgrade
cmp al, 90
jb Bgrade
jmp Agrade
Bgrade: mov al, 'B'
jmp done
Cgrade: mov al, 'C'
jmp done
Dgrade: mov al, 'D'
jmp done
Fgrade: mov al, 'F'
jmp done
Agrade: mov al, 'A'
done:
popfd
ret
CalcGrade ENDP


main PROC
call randomize
mov ecx, 10
l1:
mov eax, 50
call randomRange
add eax, 50
call writeInt
call CalcGrade
mov edx, offset str1
call writeString
call writeChar
call crlf
loop l1
exit
main ENDP

END main

