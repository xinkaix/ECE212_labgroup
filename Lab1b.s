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

.equ counter, 100
.equ raw, 0x20001000
.equ process, 0x20003000
.equ error, -1

ldr r0 ,= counter
ldr r1 ,= raw
ldr r2 ,= process

b Main

Main:
ldr r3, [r1]
add r1, r1, #4

cmp r3, #15
bne isUpper


isUpper:
cmp r3, #90
ble CheckUpper
b isLower


isLower:
cmp r3, #122
ble CheckLower
b OutOfRange


CheckLower:
cmp r3, #97
bge toUpper
b OutOfRange


CheckUpper:
cmp r3, #65
bge toLower
b OutOfRange


toLower:
add r3, r3, #32
b StoreData


toUpper:
sub r3, r3, #32
b StoreData


OutOfRange:
ldr r3 ,= error
b StoreData


StoreData:
str r3, [r2]
add r2, r2, #4
b CheckCounter

CheckCounter:
sub r0, #1
cmp r0, #0
bge Main


/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
/*--------------------------------------*/
