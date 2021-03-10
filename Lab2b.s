/*Author - Wing Hoy. Last edited on Feb 12, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global TestAsmCall
.global printf
.global cr

.text
TestAsmCall:
PUSH {lr}
/*--------------------------------------*/

/*-------Students write their code here ------------*/

// Macro
.equ Size, 0x20001000
.equ PtrX, 0x20001004
.equ PtrY, 0x20001008
.equ Stack, 0x2000100C
.equ Final, 0x20001010


// Initialize
ldr r0, =Size
ldr r1, =PtrX
ldr r2, =PtrY
ldr r3, =Stack
ldr r4, =Final
ldr r5, =0
ldr r6, =0
ldr r7, =0

ldr r0, [r0]
ldr r1, [r1]  // X points
ldr r2, [r2]  // Y points
ldr r3, [r3]
ldr r4, [r4]


Main:
// Input two X data points
ldr r5, [r1]
add r1, r1, #4
ldr r6, [r1]

// Delta X
sub r5, r6, r5
ldr r6, =0

// Input two Y data points
ldr r6, [r2]
add r2, r2, #4
ldr r7, [r2]

// Sum two Y data points
add r6, r6, r7
ldr r7 ,=0

// Check Condition
cmp r5, #1
beq Sum

cmp r5, #2
beq ShiftOne
b ShiftTwo


ShiftOne:
lsl r6, r6, #1
b Sum


ShiftTwo:
lsl r6, r6, #2
b Sum


Sum:
ldr r5, =0
ldr r5, [r4]

add r5, r5, r6

str r5, [r4]
ldr r5, =0
ldr r6, =0

sub r0, r0, #1
cmp r0, #1
beq HalfSum
b Main


HalfSum:
ldr r5, [r4]
asr r5, #1
str r5, [r4]
ldr r5, =0
b END


END:


/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
/*--------------------------------------*/
