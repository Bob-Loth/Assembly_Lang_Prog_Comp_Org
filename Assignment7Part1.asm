; //Irvine32 template	(irvine32_template.asm)

; //include Irvine32.inc

INCLUDE Irvine32.inc

.data
key BYTE -5, 3, 2, -3, 0, 5, 2, -4, 7, 9

str1 BYTE "Enter the text to be encoded: ", 0
str2 BYTE "Encoded text: ", 0
str3 BYTE "Decoded text: ", 0
 
text BYTE 129 dup(0)
textLength DWORD 0
.code

encrypt PROC
push esi 
push edi

mov esi, 0 ; i = 0
mov edi, 0 ; j = 0
L1:
push ecx ; use ecx register for rotation
mov cl, key[esi]
rol text[edi], cl
pop ecx ; revert ecx to use in L1
inc esi
inc edi

cmp esi, LENGTHOF key
jnz continueKey ; if keyPosition = LengthOfKey
mov esi, 0 ;reset keyPosition
continueKey: ; else don't touch it

loop L1
pop edi
pop esi
ret
encrypt ENDP

decrypt PROC
push esi
push edi

mov esi, 0
mov edi, 0
L1:
push ecx
mov cl, key[esi]
ror text[edi], cl
pop ecx 
inc esi
inc edi

cmp esi, LENGTHOF key
jnz continueKey
mov esi, 0
continueKey:

loop L1
pop edi
pop esi
ret
decrypt ENDP

main PROC

mov edx, offset str1
call WriteString
mov edx, offset text
mov ecx, 128
call readString
mov textLength, eax
call crlf

mov ecx, textLength 
call encrypt; uses text, textLength, key, esi, edi, cl
;output encoded string
mov edx, offset str2
call WriteString
mov edx, offset text
call WriteString
call crlf
call crlf

mov ecx, textLength
call decrypt; uses text, textLength, key, esi, edi, cl
;output decoded string
mov edx, offset str3
call WriteString
mov edx, offset text
call WriteString
call crlf
	exit
main ENDP
END main