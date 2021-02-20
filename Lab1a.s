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


// Init
.equ counter, 100
.equ raw, 0x20001000
.equ process, 0x20002000
.equ error, -1

ldr r0 ,= counter
ldr r1 ,= raw
ldr r2 ,= process

b Main


// Main
Main:
ldr r3, [r1]
add r1, r1, #4

cmp r3, #15  // Check whether an "Enter" is injected, if so, stop conversion
bne CheckType


CheckType:
cmp r3, #57  // Check whether is number or letter
ble DigitLower  // Check whether the ASCII value is smaller than the ASCII value of '0'
b CharCase  // Letter


DigitLower:
cmp r3, #48  // Check whether is within the range
bge ConvertDigit
b OutOfRange  // ASCII value falls out the range of ASCII values from '0' to '9'


ConvertDigit:
sub r3, #48
b StoreData


CharCase:
cmp r3, #70  // Check the letter whether is upper case or lower case
ble UpperCase  // less than ASCII value 70 -> upper case
b LowerCase


UpperCase:
cmp r3, #65  // Check whether the ASCII value is greater than the ASCII value of 'A', 65
bge ConvertUpper
b OutOfRange  // ASCII value falls out the range of ASCII values from 'A' to 'F'


ConvertUpper:
sub r3, #55
b StoreData


LowerCase:
cmp r3, #102  // Check whether the ASCII value is smaller than the ASCII value of 'f'
ble LowerCaseLower
b OutOfRange  // ASCII value falls out the range of ASCII values from 'a' to 'f'


LowerCaseLower:
cmp r3, #97  // Check whether the ASCII value is greater than the ASCII value of 'a'
bge ConvertLower
b OutOfRange  // ASCII value falls out the range of ASCII values from 'a' to 'f'


ConvertLower:
sub r3, #87
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
// Another approach
// cmp r1, r4
// bne Main

bge Main


/*-------Code ends here ---------------------*/


/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
/*--------------------------------------*/
