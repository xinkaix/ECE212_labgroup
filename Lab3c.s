/*Author - Wing Hoy. Last edited on Feb 26, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global Display
.global printf
.global cr
.extern value
.extern getstring

.text
Display:
/*-----------------Students write their subroutine here--------------------*/
POP {r2}
POP {r3}

PUSH {r4}
PUSH {r5}
PUSH {r6}

mov r7, r2
mov r10, r2

mov r6, r3
mov r9, r3


mov r11, lr

ldr r0, =num_entries
bl printf
mov r0, r7
bl value
bl cr

ldr r0, =result
bl printf
bl cr

repeat:
ldr r0, [r6]
add r6, #4
bl value
bl cr
sub r7, #1
cmp r7, #0
beq end
b repeat

end:
ldr r0, =program_end
bl printf
bl cr

POP {r6}
POP {r5}
POP {r4}

mov r1, r9
PUSH {r1}
mov r1, r10
PUSH {r1}

bx r11



.data
num_entries:
.string "The number of entries is "
result:
.string "Sorted from smallest to biggest, the numbers are:"
program_end:
.string "Program ended."
/*--------------------------------------*/
