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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAsteroids.part.0, %function
updateAsteroids.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #9
	push	{r4, r5, r6, lr}
	ldr	r5, .L10
	ldr	r3, [r5]
	sub	sp, sp, #16
	add	r3, r3, #13
	ldr	r6, [r5, #28]
	str	r3, [sp]
	ldr	lr, [r5, #4]
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	mov	r4, r0
	ldm	r0, {r0, r1}
	str	r6, [sp, #12]
	str	lr, [sp, #4]
	str	ip, [sp, #8]
	ldr	r6, .L10+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L2
	ldr	r3, [r5, #36]
	cmp	r3, #0
	bne	.L2
	mov	r2, #67108864
	mov	r0, #22016
	ldr	r3, [r5, #32]
	ldr	ip, .L10+8
	ldr	r1, .L10+12
	sub	r3, r3, #1
	str	r3, [r5, #32]
	str	r3, [ip]
	strh	r0, [r2, #120]	@ movhi
	strh	r1, [r2, #124]	@ movhi
.L2:
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #28]
	add	r3, r2, r3
	cmp	r3, #156
	movgt	r3, #0
	addle	r2, r2, #3
	strgt	r3, [r4, #32]
	strle	r2, [r4, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	player
	.word	collision
	.word	lives
	.word	-30970
	.size	updateAsteroids.part.0, .-updateAsteroids.part.0
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, lr}
	mov	ip, #36
	mov	r4, #100
	mov	lr, #123
	mov	r6, #1
	mov	r5, #2
	mov	r1, #10
	ldr	r0, .L18
	str	r3, [r0]
	ldr	r0, .L18+4
	str	r3, [r0]
	ldr	r0, .L18+8
	mov	r2, r3
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	str	r3, [r0, #36]
	str	r3, [r0, #40]
	str	r3, [r0, #44]
	ldr	r3, .L18+12
	str	r6, [r0, #32]
	str	r5, [r0, #48]
	str	r4, [r0]
	str	r4, [r0, #8]
	str	lr, [r0, #4]
	str	lr, [r0, #12]
	str	ip, [r0, #24]
	str	ip, [r0, #28]
	add	r0, r3, #1200
.L13:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #32]
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L13
	mov	lr, #1
	ldr	ip, .L18+16
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L18+20
	ldr	r4, .L18+24
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L18+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L18+32
	rsb	r0, r3, #83886080
	add	r0, r0, #492
	add	ip, r3, #20
.L14:
	add	r2, r0, r3
	ldrh	r1, [r3, #2]!
	cmp	r3, ip
	strh	r1, [r2]	@ movhi
	bne	.L14
	pop	{r4, r5, r6, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	score
	.word	dodgeTime
	.word	player
	.word	asteroids
	.word	lives
	.word	shipProtoPal
	.word	DMANow
	.word	dodgePal
	.word	.LANCHOR0-2
	.size	initGame, .-initGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	ip, #100
	mov	r4, #1
	mov	lr, #2
	mov	r0, #123
	mov	r1, #36
	ldr	r3, .L22
	str	r4, [r3, #32]
	str	lr, [r3, #48]
	str	ip, [r3]
	str	ip, [r3, #8]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initAsteroids
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAsteroids, %function
initAsteroids:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #10
	ldr	r3, .L28
	add	r0, r3, #1200
.L25:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #32]
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L25
	bx	lr
.L29:
	.align	2
.L28:
	.word	asteroids
	.size	initAsteroids, .-initAsteroids
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L63
	ldr	r0, [r3, #40]
	ldr	r2, .L63+4
	ldr	r1, [r3, #32]
	cmp	r0, #0
	str	r1, [r2]
	ldr	r2, .L63+8
	beq	.L31
	ldr	r1, [r2]
	cmp	r1, #179
	ble	.L62
.L31:
	mov	r1, #0
	str	r1, [r3, #40]
	str	r1, [r2]
.L33:
	ldr	r0, .L63+12
	ldrh	r1, [r0]
	tst	r1, #32
	bne	.L34
	ldr	r2, [r3]
	ldr	ip, [r3, #48]
	subs	r2, r2, ip
	strpl	r2, [r3]
.L34:
	tst	r1, #16
	bne	.L35
	ldr	ip, [r3]
	ldr	r2, [r3, #24]
	add	r2, ip, r2
	cmp	r2, #238
	ldrle	r2, [r3, #48]
	addle	ip, r2, ip
	strle	ip, [r3]
.L35:
	ldr	ip, .L63+16
	ldrh	r2, [ip]
	tst	r2, #512
	beq	.L36
	tst	r1, #512
	bne	.L36
.L37:
	ldr	r1, [r3, #40]
	cmp	r1, #0
	bne	.L56
	push	{r4, lr}
	mov	r2, #67108864
	mov	r4, #20992
	mov	r1, #1
	mov	lr, #4
	strh	r4, [r2, #104]	@ movhi
	ldr	r4, .L63+20
	strh	r4, [r2, #108]	@ movhi
	ldrh	r2, [ip]
	tst	r2, #2
	str	r1, [r3, #40]
	str	r1, [r3, #36]
	str	lr, [r3, #48]
	beq	.L30
	ldrh	r2, [r0]
	tst	r2, #2
	moveq	r2, #1
	streq	r2, [r3, #36]
.L30:
	pop	{r4, lr}
	bx	lr
.L36:
	tst	r2, #256
	beq	.L56
	tst	r1, #256
	beq	.L37
.L56:
	tst	r2, #2
	bxeq	lr
	ldrh	r2, [r0]
	tst	r2, #2
	moveq	r2, #1
	streq	r2, [r3, #36]
	bx	lr
.L62:
	cmp	r1, #59
	movgt	ip, #0
	movgt	r0, #2
	add	r1, r1, #1
	strgt	ip, [r3, #36]
	strgt	r0, [r3, #48]
	str	r1, [r2]
	b	.L33
.L64:
	.align	2
.L63:
	.word	player
	.word	lives
	.word	dodgeTime
	.word	buttons
	.word	oldButtons
	.word	-31613
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateAsteroids
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAsteroids, %function
updateAsteroids:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateAsteroids.part.0
	.size	updateAsteroids, .-updateAsteroids
	.align	2
	.global	newAsteroid
	.syntax unified
	.arm
	.fpu softvfp
	.type	newAsteroid, %function
newAsteroid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L73
	mov	r4, #0
	mov	r3, r6
	b	.L70
.L68:
	add	r4, r4, #1
	cmp	r4, #30
	add	r3, r3, #40
	beq	.L67
.L70:
	ldr	r5, [r3, #32]
	cmp	r5, #0
	bne	.L68
	ldr	r3, .L73+4
	mov	lr, pc
	bx	r3
	mov	lr, #230
	ldr	r3, .L73+8
	smull	r1, r2, r3, r0
	mov	ip, #11
	mov	r1, #1
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	mul	r3, lr, r3
	add	r4, r4, r4, lsl #2
	sub	r0, r0, r3
	add	r3, r6, r4, lsl #3
	str	r0, [r6, r4, lsl #3]
	str	r5, [r3, #36]
	str	ip, [r3, #4]
	str	r1, [r3, #32]
.L67:
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	asteroids
	.word	rand
	.word	1195121335
	.size	newAsteroid, .-newAsteroid
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L106
	bl	updatePlayer
	add	r5, r4, #1200
	b	.L77
.L76:
	add	r4, r4, #40
	cmp	r5, r4
	beq	.L102
.L77:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L76
	mov	r0, r4
	add	r4, r4, #40
	bl	updateAsteroids.part.0
	cmp	r5, r4
	bne	.L77
.L102:
	ldr	r3, .L106+4
	ldr	r3, [r3]
	cmp	r3, #600
	bge	.L78
	ldr	r2, .L106+8
	ldr	r1, .L106+12
	mla	r3, r1, r3, r2
	cmp	r2, r3, ror #1
	bcs	.L103
.L75:
	pop	{r4, r5, r6, lr}
	bx	lr
.L78:
	sub	r2, r3, #600
	cmp	r2, #600
	bcs	.L82
	ldr	r2, .L106+16
	ldr	r1, .L106+20
	mla	r3, r1, r3, r2
	ldr	r2, .L106+24
	cmp	r3, r2
	bhi	.L75
.L84:
	bl	newAsteroid
	bl	newAsteroid
	ldr	r3, .L106+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+32
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r0, r3
	beq	.L75
.L88:
	bl	newAsteroid
	b	.L101
.L82:
	sub	r2, r3, #1200
	cmp	r2, #600
	bcc	.L104
	sub	r2, r3, #1792
	sub	r2, r2, #8
	cmp	r2, #600
	bcs	.L85
	ldr	r2, .L106+8
	ldr	r1, .L106+12
	mla	r3, r1, r3, r2
	ldr	r2, .L106+36
	cmp	r3, r2
	bhi	.L75
	bl	newAsteroid
	bl	newAsteroid
	ldr	r3, .L106+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+32
	smull	r1, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r0, r3
	beq	.L75
	b	.L101
.L103:
	bl	newAsteroid
	ldr	r3, .L106+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+32
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r0, r3
	beq	.L75
.L101:
	pop	{r4, r5, r6, lr}
	b	newAsteroid
.L104:
	add	r3, r3, r3, lsl #4
	ldr	r2, .L106+40
	add	r3, r3, r3, lsl #8
	ldr	r1, .L106+44
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r1, r2, ror #2
	bcc	.L75
	b	.L84
.L85:
	sub	r2, r3, #2400
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	cmp	r2, #600
	add	r3, r3, r3, lsl #16
	ldr	r2, .L106+40
	bcc	.L105
	ldr	r1, .L106+48
	sub	r2, r2, r3
	cmp	r2, r1
	bcs	.L75
.L89:
	bl	newAsteroid
	ldr	r3, .L106+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+32
	smull	r1, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r0, r3
	beq	.L75
	b	.L88
.L105:
	sub	r3, r2, r3
	cmp	r2, r3, ror #1
	bcc	.L75
	b	.L89
.L107:
	.align	2
.L106:
	.word	asteroids
	.word	time
	.word	47721858
	.word	-1527099483
	.word	28633115
	.word	-1775253149
	.word	57266230
	.word	rand
	.word	1431655766
	.word	95443716
	.word	143165576
	.word	71582788
	.word	286331153
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L112
	push	{r4, lr}
	ldr	r2, [r3, #36]
	cmp	r2, #0
	ldrne	ip, .L112+4
	ldreq	ip, .L112+8
	sub	sp, sp, #8
	add	r2, r3, #24
	ldm	r3, {r0, r1}
	ldr	r4, .L112+12
	ldm	r2, {r2, r3}
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L113:
	.align	2
.L112:
	.word	player
	.word	dodgeBitmap
	.word	shipProtoBitmap
	.word	drawImage4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	mov	r3, #248
	push	{r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #8
	mov	r0, r1
	mov	r2, #240
	str	r3, [sp]
	ldr	r6, .L123
	mov	r3, #11
	mov	lr, pc
	bx	r6
	mov	r0, #0
	mov	r3, #150
	mov	r2, #240
	mov	r1, #11
	str	r0, [sp]
	mov	lr, pc
	bx	r6
	ldr	r3, .L123+4
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L121
.L115:
	ldr	r4, .L123+8
	bl	drawPlayer
	mov	r7, #1
	mov	r8, #255
	add	r5, r4, #1200
	b	.L118
.L116:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	streq	r7, [r4, #36]
	add	r4, r4, #40
	cmp	r4, r5
	beq	.L122
.L118:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L116
	str	r8, [sp]
	add	r2, r4, #24
	ldm	r4, {r0, r1}
	ldm	r2, {r2, r3}
	add	r4, r4, #40
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L118
.L122:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L121:
	mov	r2, #247
	mov	r3, #5
	str	r2, [sp]
	mov	r1, #3
	mov	r2, r3
	mov	r0, #227
	mov	lr, pc
	bx	r6
	b	.L115
.L124:
	.align	2
.L123:
	.word	drawRect4
	.word	player
	.word	asteroids
	.size	drawGame, .-drawGame
	.align	2
	.global	drawAsteroids
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAsteroids, %function
drawAsteroids:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bne	.L132
	ldr	r3, [r0, #36]
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r0, #36]
	bx	lr
.L132:
	mov	r2, #255
	push	{r4, lr}
	sub	sp, sp, #8
	ldr	r3, [r0, #28]
	str	r2, [sp]
	ldr	r4, .L133
	ldr	r2, [r0, #24]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L134:
	.align	2
.L133:
	.word	drawRect4
	.size	drawAsteroids, .-drawAsteroids
	.global	colors
	.comm	highscore,4,4
	.comm	lives,4,4
	.comm	dodgeTime,4,4
	.comm	damageTime,4,4
	.comm	time,4,4
	.comm	score,4,4
	.comm	asteroids,1200,4
	.comm	player,52,4
	.comm	NOTES,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	colors, %object
	.size	colors, 20
colors:
	.short	0
	.short	32767
	.short	15855
	.short	31
	.short	992
	.short	31744
	.short	32736
	.short	31775
	.short	1023
	.short	2322
	.ident	"GCC: (devkitARM release 53) 9.1.0"
