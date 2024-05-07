# MIPS-Processor
C statements and MIPS translation
----------------------------------------------------------------------------------
int a, b, c, i, sum;
a = -20; lw $1, 0($0) // opcode: 0x23
b = 10; lw $2, 1($0)
c = 2; lw $3, 2($0)
sum = 0; addiu $4, $0, 0 // opcode: 0x9
for (i=a; i<b; i+=c) { addiu $5, $1, 0
sum += i; slt $6, $5, $2 // opcode: 0x0, func: 0x2a
} beq $6, $0, exit // opcode: 0x4, encode exit as 5
loop: addu $4, $4, $5 // opcode: 0x0, func: 0x21
addu $5, $5, $3
slt $6, $5, $2
bne $6, $0, loop // opcode: 0x5, encode loop as -3
exit:
