/*Author - Wing Hoy. Last edited on Feb 26, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global Welcomeprompt
.global printf
.global cr
.extern value
.extern getstring

.text
Welcomeprompt:
/*-----------------Students write their subroutine here--------------------*/

PUSH {r5}
PUSH {r6}


.equ location, 0x20001000
ldr r6, =location
mov r11, lr

bl cr
ldr r0, =welcome
bl printf
bl cr

num_inputs:
ldr r0, =prompt1
bl printf
bl cr
bl getstring
mov r7, r0
mov r10, r0
bl value
bl cr
cmp r7, #3
blo error
cmp r7, #10
bgt error
b next

next:
ldr r0, =enter_number
bl printf
bl cr
bl getstring
mov r4, r0
cmp r4, #0
blt error2
b entry

last:
ldr r0, =enter_last_number
bl printf
bl cr
bl getstring
mov r4, r0
cmp r4, #0
blt error2
b entry

entry:
str r0, [r6]
add r6, #4
bl value
bl cr
sub r7, #1
cmp r7, #0
beq quit
cmp r7, #1
beq last
b next

error:
ldr r0, =invalid
bl printf
bl cr
b num_inputs

error2:
ldr r0, =invalid
bl printf
bl cr
b next

quit:
POP {r6}
POP {r5}
POP {r4}

mov r7, r10
PUSH {r7}

bx r11




.data
welcome:
.string "Welcome to the bubble sort program."
prompt1:
.string "Please enter the number of entries (3-10) followed by the enter key."
enter_number:
.string "Please enter a non-negative number: "
enter_last_number:
.string "Please enter the last non-negative number: "
invalid:
.string "Invalid entry, please try again: "

/*--------------------------------------*/

