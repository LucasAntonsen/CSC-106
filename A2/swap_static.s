#By Lucas Antonsen

#Implementation of the following C code in assembly:

#   int t;
#   int array[2];

#   void swap() {
#       t = array[0];
#       array[0] = array[1];
#       array[1] = t;
#   }

.pos 0x100
                 ld   $t, r0              # r0 = address t
				 ld   $0, r1			  # r1 = 0
				 ld   $array, r2		  # r2 = address array
				 ld   (r2,r1,4), r3		  # r3 = array[0] = 2
				 st	  r3, (r0)			  # t = 2
				 ld   $1, r4			  # r4 = 1
				 ld   (r2,r4,4), r5		  # r5 = array[1] = 3
				 st   r5, (r2,r1,4)		  # array[0] = array[1] = 3
				 st   r3, (r2,r4,4)		  # array[1] = t = 2
                 halt                     # halt
.pos 0x1000
t:               .long 0x7                # t = 7
.pos 0x2000
array:           .long 0x2                # array[0] = 2
                 .long 0x3                # array[1] = 3