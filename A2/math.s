#By Lucas Antonsen

#Implementation of the following C code in assembly:

#   int a;
#   int b;

#   void foo() {
#       a = (((((b + 1) + 4) / 2) & b) * 2);
#   }

.pos 0x100
                 ld   $a, r0              # r0 = address a
                 ld   $b, r1			  # r1 = address b
				 ld   (r1),r2			  # r2 = 6
				 inc  r2				  # r2 = b + 1 = 7
				 ld	  $4, r3			  # r3 = 4
				 add  r2,r3				  # r3 = 11
				 shr  $1, r3			  # r3 = r3/2 = 11/2 ~= 5
				 ld   (r1),r1			  # r1 = 6
				 and  r1,r3				  # r1 and r3 = 4
				 shl  $1, r3			  # r3 = r3*2 = 8
				 st   r3, (r0)			  # a = 8
				 halt					  # halt
.pos 0x1000
a:               .long 0x294              # a = 660
b:				 .long 0x6				  # b = 6