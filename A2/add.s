#By Lucas Antonsen

#Implementation of the following C code in assembly:

#   int a;
#   int b;

#   void foo() {
#       a = a + b;
#   }

.pos 0x100
                 ld   $a, r0              # r0 = address a
                 ld   (r0), r1            # r1 = value of address a
                 ld   $b, r2              # r2 = address of b
                 ld   (r2), r2            # r2 = value at address b
				 add  r1, r2			  # r2 = r1 + r2
				 st   r2, (r0)			  # r0 = a = r2
                 halt                     # halt
.pos 0x1000
a:               .long 0x294              # a = 660
b:				 .long 0x6				  # b = 6