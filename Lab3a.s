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
pop {r4}
push {lr}


Maro:
.equ location, 0x20001000


WelcomeMsg:
bl cr
ldr r0, =welcome_msg
bl printf
bl cr


InputSize:
ldr r0, =size_prompt
bl printf
bl cr
bl getstring

cmp r0, #3
blt InvalidSize
cmp r0, #10
bgt InvalidSize

ldr r1, =location
mov r4, r0
sub r2, r4, #2

b InputEntries


InputEntries:
push {r1}
push {r2}

ldr r0, =entries_prompt
bl printf
bl cr
bl getstring

pop {r2}
pop {r1}

cmp r0, #0
blt InvalidEntry

str r0, [r1]
add r1, r1, #4
cmp r2, #0
sub r2, r2, #1
bge InputEntries

push {r1}

ldr r0, =last_entries_prompt
bl printf
bl cr
bl getstring

pop {r1}

str r0, [r1]
add r1, r1, #4

b Return


InvalidSize:
ldr r0, =error_msg
bl printf
bl cr
b InputSize


InvalidEntry:
ldr r0, =error_msg
bl printf
bl cr
b InputEntries


Return:
pop {r7}
push {r4}
bx r7


.data
welcome_msg:
.string "Welcome to Bubble Sort Program"

size_prompt:
.string "Please enter the number (3 min - 10 max) of entries followed by 'enter'"

entries_prompt:
.string "Please enter a number (positive only - including 0)"

last_entries_prompt:
.string "Please enter the last number (positive only - including 0)"

error_msg:
.string "Invalid entry, please enter a proper value"
/*--------------------------------------*/
