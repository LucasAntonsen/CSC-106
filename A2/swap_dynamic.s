#By Lucas Antonsen

#Implementation of the following C code in assembly:

#   int t;
#   int* array;

#   void swap() {
#      array = malloc(2 * sizeof(int));
#      t = array[0];
#      array[0] = array[1];
#      array[1] = t;
#   }

.pos 0x100
                 ld   $t, r0              # r0 = address t
				 ld   $0, r1			  # r1 = 0
				 ld   $array, r2		  # r2 = address array
				 ld	  (r2), r2			  # r2 = address array[0] = 0x2000
				 ld   (r2,r1,4), r3		  # r3 = array[0] = -1
				 st   r3, (r0)	  		  # t = r3 = -1
				 ld   $1, r4			  # r4 = 1
				 ld   (r2,r4,4), r3		  # r3 = 2
				 st   r3, (r2,r1,4)		  # array[0] = array[1] = 2
				 ld	  (r0),r0			  # r0 = t = -1
				 st	  r0, (r2,r4,4)		  # array[1] = t = -1
                 halt                     # halt
.pos 0x1000
t:               .long 0x7                # t = 7
array:           .long 0x2000             # array = address of array[0]
.pos 0x2000
array_data:      .long 0xffffffff         # array[0] = -1
				 .long 0x2         		  # array[1] = 2