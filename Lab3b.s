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


Init:
pop {r4}
push {lr}
mov r1, r0
mov r2, #0
mov r6, #0
mov r7, r4
sub r7, r7, #1


Iterate:
mov r3, #0
ldr r3, [r1]
ldr r5, [r1, #4]
cmp r3, r5
bgt Swap
b Inner


Swap:
str r3, [r1, #4]
str r5, [r1]
mov r3, #0
mov r5, #0


Inner:
add r1, r1, #4
add r2, r2, #1
sub r3, r7, r6
cmp r2, r3
blt Iterate


Outer:
mov r2, #0
mov r1, r0
add r6, r6, #1
cmp r6, r7
blt Iterate
b Return


Return:
pop {r7}
push {r4}
bx r7


.data
/*--------------------------------------*/
