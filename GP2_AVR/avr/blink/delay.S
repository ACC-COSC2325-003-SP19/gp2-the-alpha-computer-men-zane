#include "config.h"
    .global      delay
    .section    .text
delay:
        ldi      r26, 44
1:
	ldi	 r27, 255
2:
	ldi	 r28, 255
3:
	dec      r28
        brne     3b
	dec      r27
        brne     2b
	dec      r26
        brne     1b
	ret

