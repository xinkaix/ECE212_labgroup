/*Author - Wing Hoy. Last edited on Jan 18, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global TestAsmCall
.global printf
.global cr

.text
TestAsmCall:
PUSH {lr}
/*--------------------------------------*/

/*-------Students write their code here ------------*/

.equ MemStart, 0x20001000
.equ MemEnd, 0x20003000

ldr r1, =MemStart
ldr r3, =MemEnd
mov r4, #75

REPEAT:
ldr r2, [r1]
cmp r2, #0x0d
beq END
cmp r2, #65
blt ERROR
cmp r2, #122
bgt ERROR

cmp r2, #90
bgt LOWERCASE
b CONV_UPPER_TO_LOWER

LOWERCASE:
cmp r2, #97
blt ERROR
b CONV_LOWER_TO_UPPER

CONV_UPPER_TO_LOWER:
add r2, #32
b STORE

CONV_LOWER_TO_UPPER:
sub r2, #32
b STORE

ERROR:
mov r2, #42
b STORE

STORE:
str r2, [r3]
add r1, #0x04
add r3, #0x04
sub r4, #1
cmp r4, #0
beq END
b REPEAT

END:
























/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
/*--------------------------------------*/
