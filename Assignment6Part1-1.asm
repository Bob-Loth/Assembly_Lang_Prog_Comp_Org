; //Irvine32 template	(irvine32_template.asm)

; //include Irvine32.inc

INCLUDE Irvine32.inc
.data
str1 BYTE "Enter the encryption key: ", 0
str2 BYTE "Enter the text to be encoded: ", 0
str3 BYTE "Cipher text: ", 0
str4 BYTE "Decrypted: ", 0
 
cipher BYTE 129 dup(0)
text BYTE 129 dup(0)
cipherLength DWORD 0
textLength DWORD 0
.code



main PROC
mov edx, offset str1
call WriteString
mov edx, offset cipher
mov ecx, 128
call ReadString
mov cipherlength, eax

mov edx, offset str2
call WriteString
mov edx, offset text
mov ecx, 128
call ReadString
mov textLength, eax

mov ecx, textLength ; for length of entered text
mov esi, 0 ; i = 0
mov edi, 0 ; j = 0
encrypt: ; for number of characters in text
mov al, cipher[esi]
xor text[edi], al
;xor text[edi], al
inc esi
inc edi
cmp esi, cipherLength
jnz sameCipher ; if cipher char = last cipher char
mov esi, 0 ; reset to first character of encryption key
sameCipher:
loop encrypt

mov edx, offset str3
call WriteString
mov edx, offset text
call WriteString
call crlf

mov ecx, textLength ; for length of entered text
mov esi, 0 ; i = 0
mov edi, 0 ; j = 0
decrypt: ; for number of characters in text
mov al, cipher[esi]
xor text[edi], al
;xor text[edi], al
inc esi
inc edi
cmp esi, cipherLength
jnz sameCipher2 ; if cipher char = last cipher char
mov esi, 0 ; reset to first character of encryption key
sameCipher2:
loop decrypt
mov edx, offset str4
call WriteString
mov edx, offset text
call writeString
call crlf
	exit
main ENDP

END main

