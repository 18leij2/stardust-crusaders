	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"STARDUST CRUSADERS\000"
	.align	2
.LC1:
	.ascii	"Press Enter to Start\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r1, .L4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	mvn	r2, #32768
	ldr	r3, .L4+8
	ldr	r0, .L4+12
	strh	r2, [r3, #254]	@ movhi
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+20
	mov	r3, #255
	mov	r1, #76
	ldr	r2, .L4+24
	mov	r0, #66
	mov	lr, pc
	bx	r4
	mov	r1, #91
	ldr	r2, .L4+28
	mov	r3, #255
	mov	r0, #59
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+40
	ldr	r2, .L4+44
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	spacePal
	.word	DMANow
	.word	83886336
	.word	spaceBitmap
	.word	drawFullscreenImage4
	.word	drawString4
	.word	.LC0
	.word	.LC1
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	rSeed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #128
	mvn	ip, #170
	mov	r0, #2
	mov	r2, #0
	str	lr, [sp, #-4]!
	ldr	lr, .L8
	strh	lr, [r3]	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	ip, [r3, #128]	@ movhi
	ldr	r1, .L8+4
	strh	r0, [r3, #130]	@ movhi
	ldr	r0, .L8+8
	ldrh	ip, [r1, #48]
	ldr	r3, .L8+12
	ldr	r1, .L8+16
	ldr	lr, [sp], #4
	strh	ip, [r0]	@ movhi
	strh	r2, [r1]	@ movhi
	str	r2, [r3]
	b	goToStart
.L9:
	.align	2
.L8:
	.word	1044
	.word	67109120
	.word	buttons
	.word	time
	.word	oldButtons
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"wahwa\000"
	.align	2
.LC3:
	.ascii	"%d\000"
	.align	2
.LC4:
	.ascii	"Current Highscore:\000"
	.text
	.align	2
	.global	goToScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToScore, %function
goToScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r0, .L12
	ldr	r3, .L12+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L12+8
	ldr	r3, .L12+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L12+16
	ldr	r3, .L12+20
	mov	r0, r5
	ldr	r2, [r3]
	ldr	r1, .L12+24
	ldr	r3, .L12+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L12+32
	mov	r3, #255
	mov	r1, #76
	ldr	r2, .L12+36
	mov	r0, #66
	mov	lr, pc
	bx	r4
	mov	r2, r5
	mov	r1, #91
	mov	r3, #255
	mov	r0, #75
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+44
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L12+48
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LC2
	.word	mgba_printf
	.word	spaceBitmap
	.word	drawFullscreenImage4
	.word	buffer
	.word	score
	.word	.LC3
	.word	sprintf
	.word	drawString4
	.word	.LC4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToScore, .-goToScore
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L26
	ldr	r3, [r4]
	ldr	r5, .L26+4
	add	r3, r3, #1
	ldr	r2, .L26+8
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L15
	ldr	r2, .L26+12
	ldrh	r2, [r2]
	ands	r2, r2, #8
	beq	.L24
.L15:
	tst	r3, #1
	beq	.L14
	ldr	r3, .L26+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L25
.L14:
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	pop	{r4, r5, r6, lr}
	b	goToScore
.L24:
	ldr	r1, .L26+16
	ldr	r3, .L26+20
	ldr	r0, [r4]
	str	r2, [r1]
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r2, .L26+24
	ldr	r3, .L26+28
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L15
.L27:
	.align	2
.L26:
	.word	rSeed
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	time
	.word	srand
	.word	state
	.word	initGame
	.size	start, .-start
	.align	2
	.global	scoreScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	scoreScreen, %function
scoreScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L35
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L28
	ldr	r3, .L35+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L34
.L28:
	pop	{r4, lr}
	bx	lr
.L34:
	pop	{r4, lr}
	b	goToStart
.L36:
	.align	2
.L35:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	scoreScreen, .-scoreScreen
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L38
	str	r2, [r3]
	bx	lr
.L39:
	.align	2
.L38:
	.word	state
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"PAUSED\000"
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L42
	mov	r1, #2
	mov	r3, #254
	ldr	r4, .L42+4
	mov	r0, #102
	mov	lr, pc
	bx	r4
	ldr	r3, .L42+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+12
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L42+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L43:
	.align	2
.L42:
	.word	.LC5
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L56
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L45
	ldr	r2, .L56+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L54
.L45:
	tst	r3, #4
	beq	.L44
	ldr	r3, .L56+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L55
.L44:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L54:
	mov	r2, #248
	mov	r3, #8
	str	r2, [sp]
	mov	r1, #2
	mov	r2, #36
	mov	r0, #200
	ldr	r4, .L56+12
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L56+16
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L55:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	b	goToStart
.L57:
	.align	2
.L56:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	drawRect4
	.word	state
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"YOU WIN! Your score: \000"
	.align	2
.LC7:
	.ascii	"Highscore: \000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L61
	ldr	r4, .L61+4
	ldr	r2, [r3]
	ldr	r3, [r4]
	ldr	r5, .L61+8
	cmp	r2, r3
	ldr	r1, .L61+12
	ldr	r0, .L61+16
	strgt	r2, [r4]
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	ldr	r1, .L61+12
	ldr	r0, .L61+20
	mov	lr, pc
	bx	r5
	ldr	r4, .L61+24
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L61+28
	mov	lr, pc
	bx	r4
	mvn	r1, #32768
	mov	r2, #992
	ldr	r3, .L61+32
	ldr	r0, .L61+36
	strh	r1, [r3, #254]	@ movhi
	strh	r2, [r3, #252]	@ movhi
	ldr	r3, .L61+40
	mov	lr, pc
	bx	r3
	ldr	r4, .L61+44
	mov	r3, #254
	mov	r1, #76
	ldr	r2, .L61+48
	mov	r0, #66
	mov	lr, pc
	bx	r4
	mov	r3, #254
	mov	r1, #76
	ldr	r2, .L61+16
	mov	r0, #200
	mov	lr, pc
	bx	r4
	mov	r3, #255
	mov	r1, #91
	ldr	r2, .L61+52
	mov	r0, #66
	mov	lr, pc
	bx	r4
	ldr	r2, .L61+20
	mov	r1, #91
	mov	r3, #255
	mov	r0, #200
	mov	lr, pc
	bx	r4
	ldr	r3, .L61+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+60
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L61+64
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L62:
	.align	2
.L61:
	.word	score
	.word	highscore
	.word	sprintf
	.word	.LC3
	.word	buffer
	.word	highBuffer
	.word	DMANow
	.word	spacePal
	.word	83886336
	.word	spaceBitmap
	.word	drawFullscreenImage4
	.word	drawString4
	.word	.LC6
	.word	.LC7
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L70
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L63
	ldr	r3, .L70+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
.L63:
	pop	{r4, lr}
	bx	lr
.L69:
	pop	{r4, lr}
	b	goToStart
.L71:
	.align	2
.L70:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"YOU LOSE! Your score: \000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L75
	ldr	r4, .L75+4
	ldr	r2, [r3]
	ldr	r3, [r4]
	ldr	r5, .L75+8
	cmp	r2, r3
	ldr	r1, .L75+12
	ldr	r0, .L75+16
	strgt	r2, [r4]
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	ldr	r1, .L75+12
	ldr	r0, .L75+20
	mov	lr, pc
	bx	r5
	ldr	r4, .L75+24
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L75+28
	mov	lr, pc
	bx	r4
	mvn	r1, #32768
	mov	r2, #31
	ldr	r3, .L75+32
	ldr	r0, .L75+36
	strh	r1, [r3, #254]	@ movhi
	strh	r2, [r3, #252]	@ movhi
	ldr	r3, .L75+40
	mov	lr, pc
	bx	r3
	ldr	r4, .L75+44
	mov	r3, #254
	mov	r1, #76
	ldr	r2, .L75+48
	mov	r0, #66
	mov	lr, pc
	bx	r4
	mov	r3, #254
	mov	r1, #76
	ldr	r2, .L75+16
	mov	r0, #200
	mov	lr, pc
	bx	r4
	mov	r3, #255
	mov	r1, #91
	ldr	r2, .L75+52
	mov	r0, #66
	mov	lr, pc
	bx	r4
	ldr	r2, .L75+20
	mov	r1, #91
	mov	r3, #255
	mov	r0, #200
	mov	lr, pc
	bx	r4
	ldr	r3, .L75+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+60
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L75+64
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L76:
	.align	2
.L75:
	.word	score
	.word	highscore
	.word	sprintf
	.word	.LC3
	.word	buffer
	.word	highBuffer
	.word	DMANow
	.word	spacePal
	.word	83886336
	.word	spaceBitmap
	.word	drawFullscreenImage4
	.word	drawString4
	.word	.LC8
	.word	.LC7
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"SCORE: \000"
	.align	2
.LC10:
	.ascii	"time: %d\000"
	.text
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L90
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+4
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r5, .L90+8
	ldr	r4, .L90+12
	mov	r0, r1
	mov	r3, #254
	ldr	r2, .L90+16
	mov	lr, pc
	bx	r4
	ldr	r2, [r5]
	ldr	r1, .L90+20
	ldr	r3, .L90+24
	ldr	r0, .L90+28
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r2, .L90+28
	mov	r3, #254
	mov	r0, #40
	mov	lr, pc
	bx	r4
	ldr	r3, .L90+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+36
	mov	lr, pc
	bx	r3
	ldr	r4, .L90+40
	ldr	r3, .L90+44
	ldr	r1, [r4]
	ldrh	r3, [r3]
	add	r1, r1, #1
	tst	r3, #8
	str	r1, [r4]
	beq	.L78
	ldr	r3, .L90+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L87
.L78:
	add	r3, r1, r1, lsl #4
	ldr	r2, .L90+52
	add	r3, r3, r3, lsl #8
	ldr	r0, .L90+56
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r0, r2, ror #2
	bcs	.L88
.L80:
	ldr	r3, .L90+60
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L89
	pop	{r4, r5, r6, lr}
	bx	lr
.L89:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L88:
	ldr	r3, .L90+64
	ldr	r0, .L90+68
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	ldr	r1, [r4]
	ldr	r2, .L90+72
	add	r3, r3, #100
	cmp	r1, r2
	str	r3, [r5]
	ble	.L80
	bl	goToWin
	b	.L80
.L87:
	bl	goToPause
	ldr	r1, [r4]
	b	.L78
.L91:
	.align	2
.L90:
	.word	updateGame
	.word	drawGame
	.word	score
	.word	drawString4
	.word	.LC9
	.word	.LC3
	.word	sprintf
	.word	buffer
	.word	waitForVBlank
	.word	flipPage
	.word	time
	.word	oldButtons
	.word	buttons
	.word	143165576
	.word	71582788
	.word	lives
	.word	mgba_printf
	.word	.LC10
	.word	7199
	.size	game, .-game
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"Debug Log Initialized!\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L104
	mov	lr, pc
	bx	r3
	ldr	r8, .L104+4
	ldr	r0, .L104+8
	ldr	r3, .L104+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L104+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L104+20
	ldrh	r3, [r8]
	ldr	r4, .L104+24
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	ldr	r6, .L104+28
	strh	r3, [r8]	@ movhi
	ldr	fp, .L104+32
	ldr	r10, .L104+36
	ldr	r9, .L104+40
	ldr	r7, .L104+44
.L93:
	ldr	r1, [r6]
.L94:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r1, #5
	ldrls	pc, [pc, r1, asl #2]
	b	.L94
.L96:
	.word	.L100
	.word	.L99
	.word	.L98
	.word	.L97
	.word	.L95
	.word	.L95
.L95:
	mov	lr, pc
	bx	r7
.L101:
	ldrh	r3, [r8]
	b	.L93
.L97:
	ldr	r3, .L104+48
	mov	lr, pc
	bx	r3
	b	.L101
.L98:
	mov	lr, pc
	bx	r9
	b	.L101
.L99:
	mov	lr, pc
	bx	r10
	b	.L101
.L100:
	mov	lr, pc
	bx	fp
	b	.L101
.L105:
	.align	2
.L104:
	.word	mgba_open
	.word	buttons
	.word	.LC11
	.word	mgba_printf
	.word	initialize
	.word	oldButtons
	.word	67109120
	.word	state
	.word	start
	.word	scoreScreen
	.word	game
	.word	win
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	rSeed,4,4
	.comm	state,4,4
	.comm	highBuffer,41,4
	.comm	buffer,41,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
