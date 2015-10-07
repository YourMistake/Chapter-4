; Exercise 2: Copy a String in Reverse Order

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
source  BYTE  "This is the source string",0
target  BYTE  SIZEOF source DUP('#')

.code
main PROC
; Point ESI to the last character in the source string:

; Point EDI to the beginning of the target string:
; We do not copy the null terminator byte.

	mov  esi,SIZEOF source	; index register set to the end?
	mov  ecx,SIZEOF source	; loop counter
L1:
	mov  al,source[esi]		; get a character from source
	mov  target[esi],al		; store it in the target
	dec  esi				; move to the previous character in the array
	loop L1					; repeat for entire string

; Your code goes here	

	mov	BYTE PTR [edi],0			; add a null byte to the target

	Invoke ExitProcess,0
main ENDP
END main