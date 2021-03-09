/*Author - Wing Hoy. Last edited on Feb12, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global TestAsmCall
.global printf
.global cr

.text
TestAsmCall:
PUSH {lr}
/*--------------------------------------*/

/*-------Students write their code here ------------*/

.equ ArraySize, 0x20001000
.equ Destination1, 0x2000100C //Destination1 stores where the result of register indirect with offset method to be stored
.equ Destination2, 0x20001010 //Destination2 stores where the result of indexed register indirect to be stored
.equ Destination3, 0x20001014 //DEstination3 stores where the result of the post indexed method to be stored
.equ String1, 0x20001004
.equ String2, 0x20001008

/*Loads the size of the array into R4
* Loads the destination of where to store the result of register indirect with offset method to R7
* Load the starting position of String1 and String2 to R1 and R2
* Initiate the counter R0 as 1, and offset R3 as 0
*/
ldr R4, =ArraySize
ldr R4, [R4]
ldr R7, =Destination1
ldr R7, [R7]
ldr R1, =String1
ldr R1, [R1]
ldr R2, =String2
ldr R2, [R2]
mov R0, #1
mov R3, #0

/*Loop to execute the register indirect with offset method*/
OFFSET:
//no offset
ldr R5, [R1] //load the first element from string 1 to R5 from the location pointed by R1
ldr R6, [R2] //load the first element from string 2 to R6 from the location pointed by R2
add R5, R6 //Addition
str R5, [R7] //stores the result to the destination pointed by R7

//4 bytes offset
ldr R5, [R1, #4] //load the second element from string 1 to R5 from the location pointed by R1+4
ldr R6, [R2, #4] //load the second element from string 2 to R5 from the location pointed by R2+4
add R5, R6 //Addition
str R5, [R7, #4] //stores the result to the destination pointed by R7+4

//8 bytes offset
ldr R5, [R1, #8] //load the third element from string 1 to R5 from the location pointed by R1+8
ldr R6, [R2, #8] //load the third element from string 2 to R5 from the location pointed by R2+8
add R5, R6 //Addition
str R5, [R7, #8] //stores the result to the destination pointed by R7+8

//Branch to the next method after three calculations
b DESTINATION2

//redefine the destination address for the second method
DESTINATION2:
ldr R7, =Destination2
ldr R7, [R7]
b INDEXED

//Loop to execute the indexed register indirect method
INDEXED:
ldr R5, [R1, R3] //Loads the string 1 element from R1+offset (R3)
ldr R6, [R2, R3] //Loads the string 2 element from R2+offset (R3)
add R5, R6 //addition
str R5, [R7, R3] //stores the result to the destination pointed by R7+offset (R3)
sub R4, #1 //subtract 1 from the size of the array (number of iterations)
cmp R4, #0 //see if it reaches the end of the array
beq DESTINATION3 //branch to the next method if the end of the array is reached
mov R3, #4
mul R3, R0, R3 //calculate the new offset value (4 bytes * counter)
add R0, #1 //increment the counter
b INDEXED //return to loop

//redefine the destination, the starting location of strings, and the size of the array
DESTINATION3:
ldr R7, =Destination3
ldr R7, [R7]
ldr R1, =String1
ldr R1, [R1]
ldr R2, =String2
ldr R2, [R2]
ldr R4, =ArraySize
ldr R4, [R4]

b POSTINDEX

//Loop to execute the post-incrementing method
POSTINDEX:
ldr R5, [R1] //load the string 1 element from R1 to R5
add R1, #4 //increment R1 by 4 bytes
ldr R6, [R2] //load the string 2 element from R2 to R6
add R2, #4 //increment R2 by 4 bytes
add R5, R6 //addition
str R5, [R7] //stores the result to the destination pointed by R7
add R7, #4 //increment R7 by 4 bytes
sub R4, #1 //subtract 1 from the size of the array (number of iterations)
cmp R4, #0
beq END //End the program if the end of the array is reached
b POSTINDEX //return to loop


END:


/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
/*--------------------------------------*/
