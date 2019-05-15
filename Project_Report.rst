Group Project 2 Report
##################


Project Report
**************

	* Chosen Device Description - David Nguyen
		* Source:
                  https://www.arduino.cc/en/Main/ArduinoBoardUnoSMD
		* Basic Features - Arduino Uno SMD:
                  The Arduino Uno SMD board uses an ATmega328 microcontroller to run and operate this board. The Arduino Uno SMD board requires at least 5V to run and operate this board. The Arduino Uno SMD board requires an input voltage recommended power of 7V-12V (Limit: 6V-20V) to run and operate this board. The Arduino Uno SMD board should not exceed the input voltage recommended power limit when running and operating this board. There are 14 digital I/O pins (6 pins with PWM output) in the Arduino Uno SMD board. There are 6 analog input pins in the Arduino Uno SMD board. The Arduino Uno SMD board has 32 KB of flash memory to run and operate this board (0.5 KB used by the bootloader). The Arduino Uno SMD board has 2 KB of SRAM to run and operate this board. The Arduino Uno SMD board has 1 KB of EEPROM to run and operate this board. The Arduino Uno SMD board runs and operates at a clock speed of 16 MHz. The Arduino Uno SMD board is powered over a USB port regulated to 5V or powered over a 2.1mm center-positive plug coming from an AC-DC wall plug converter. Power may also be issued to the board through the power pins, connecting the leads of the power source to the GND and VIN pins, assuming that the supply is within the recommended 7V - 12V range.

	* Controlling the device - Zane Morley
		* Required input/output signals
                  s
	* Device demonstration - Keven Meadows
		* The code we use uses pin 13 of the arduino board and the ground next to the voltage pin. We use the wires we have to 			   line up two rows (or columns) of the component board. In the same rows we align our light parallel. The 			   code we installed onto the arduino uses toggle and delay to give signal to make our LED  light. We also use dec and 		    brne to to give ldi its register values.
		•	First wire up board (plug into pin and ground)
		•	Place LED on the board
		•	Plug in pin wire to the board
		•	Plug in ground wire to the board
		•	Reset to show off the LED


	* Project Code - Charlie Kliewer
.. code-block:: c
	
	; S.O.S. Blinky Code for AVR
	; Author: Roie R. Black
	; Date: July 14, 2015
	; Modified by: gp2-the-alpha-computer-men-zane
	
	#include "config.h"
	
		.section .data
	dummy: 	.byte 0		; dummy global variable
	
	        .section .text
	        .global     main
	        .extern     delay          
	        .org        0x0000
	
	main:
		; clear the SREG register
	        eor     r1, r1                  ; cheap zero
	        out     _(SREG), r1                ; clear flag register
	
	
	        ; set up the stack
	        ldi         r28, (RAMEND & 0x00ff)
	        ldi         r29, (RAMEND >> 8)
	        out         _(SPH), r29
	        out         _(SPL), r28
	
		; initialize the CPU clock to run at full speed
		ldi         r24, 0x80
	        sts         CLKPR, r24              ; allow access to clock setup
	        sts         CLKPR, r1               ; run at full speed
	        
	        cbi         LED_PORT, LED_PIN       ; start with the LED off
	       
	
	        ; enter the S.O.S. blink loop
	1:      rcall       toggle
	        rcall       delay
	        rcall       toggle
	        rcall       delay
	        rcall       toggle
	        rcall       delay
	        rcall       toggle
	        rcall       delay
	        rcall       toggle
	        rcall       delay
	        rcall       toggle
	        rcall       delay
		rcall       toggle
	        rcall       delay
	        rcall       delay
	        rcall       toggle
	        rcall       delay
	        rcall       toggle
	        rcall       delay
	        rcall       delay
	        rcall       toggle
	        rcall       delay
	        rcall       toggle
	        rcall       delay
	        rcall       delay
	        rcall       toggle
	        rcall       delay
	        rjmp        1b
	
	toggle:
	        in          r24, LED_PORT           ; get current bits
	        ldi         r25, (1 << LED_PIN)     ; LED is pin 5
	        eor         r24, r25                ; flip the bit
	        out         LED_PORT, r24           ; write the bits back
	        ret
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
		
Arduino IDE
***********
.. code-block:: c

	const int buzzer = 9;

	void setup() {
	  // put your setup code here, to run once:
	  pinMode(buzzer, OUTPUT);
	}

	void loop() {
	  // put your main code here, to run repeatedly:
	  tone(buzzer, 40, 500);
	  delay(1000);
	  tone(buzzer, 40, 500);
	  delay(1000);
	  tone(buzzer, 40, 500);
	  delay(1000);
	  tone(buzzer, 90, 1000);
	  delay(1500);
	  tone(buzzer, 90, 1000);
	  delay(1500);
	  tone(buzzer, 90, 1000);
	  delay(1500);
	}
