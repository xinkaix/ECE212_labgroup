/*Author - Wing Hoy. Last edited on Feb 26, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global Sort
.global printf
.global cr
.extern value
.extern getstring

.text
Sort:
/*-----------------Students write their subroutine here--------------------*/

POP {r7}

PUSH {r4}
PUSH {r5}
PUSH {r6}

mov r11, lr

mov r3, r7
mov r2, r7

sort:
ldr r4, [r0]
ldr r5, [r0, #4]
cmp r4, r5
bgt swap
add r0, #4
sub r7, #1
cmp r7, #1
beq next
b sort

swap:
mov r8, r4
mov r4, r5
mov r5, r8
str r4, [r0]
str r5, [r0, #4]
add r0, #4
sub r7, #1
cmp r7, #1
beq next
b sort

next:
sub r3, #1
cmp r3, #1
beq end
mov r7, r2
ldr r0, =0x20001000
b sort

end:

POP {r6}
POP {r5}
POP {r4}

PUSH {r2}

bx r11






































.data
/*--------------------------------------*/
