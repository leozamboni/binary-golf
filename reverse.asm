; string revert - 24/10/22
; make reverse
SECTION .data         
  str:  db "Hello World",10 ; the string, 10=cr
  len:  equ $-str           ; "$" means "here"

SECTION .text          
  global main                 ; make label available to linker as invoked by gcc
  global _start               ; make label available to linker w/ default entry

main:                             
_start:           
  mov   ebx,1                 ; arg1: where to write, screen
  mov   ecx,str               ; arg2: pointer to string
  mov   edx,1                 ; arg3: length of string to print

  mov   ebp,len               ; loop index
  add   ecx,ebp               ; add string length bytes to str

  l1:
    mov   eax,4               ; write command to int 80 hex
    int   0x80                ; interrupt 80 hex, call kernel

    cmp   ebp,0               ; check if index is equal to 0
    je    continue            ; then break loop

    dec   ebp                 ; decrement loop index            
  loop l1                     ; string print loop

  continue:
  mov   ebx,0                 ; exit code, 0=normal
  mov   eax,1                 ; exit command to kernel
  int   0x80                  ; interrupt 80 hex, call kernel