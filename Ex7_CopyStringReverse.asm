; Exercise 2: Copy a String in Reverse Order
; Erik Vanlandingham

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

	mov  esi,0					; index register set to the end?
   ;mov, esi OFFSET source		; or is this what we need to do?
	mov  ecx,SIZEOF source		; loop counter, could I not just use ecx as my index for the string?
L1:
	mov  al,source[ecx]			; get a character from source
	mov  target[esi],al			; store it in the target
	inc  esi					; move to the previous character in the array
	loop L1						; repeat for entire string

	mov  al,source[ecx]
	mov	target[esi],al			; add the last character

	Invoke ExitProcess,0
main ENDP
END main