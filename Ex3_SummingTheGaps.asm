; Exercise 1: Summing the gaps between array elements

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
dwarray dword  0,2,5,9,10
count EQU (LENGTHOF dwarray)
total dword 0

.code
main proc
	mov, esi OFFSET dwarray
    
    mov ecx, count
	L1:
        mov eax, [esi]  ;move the first val into eax register
        inc esi         ;inc to get the next value, and also for the next loop
        mov ebx, [esi]  ;move that value into ebx register
        
        sub ebx, eax    ;get the difference of the two values
        add total, ebx  ;add the difference to the running total      
        Loop L1
        
	invoke ExitProcess,0
main endp
end main