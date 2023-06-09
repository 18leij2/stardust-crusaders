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
	.file	"mode4.c"
	.text
	.align	2
	.global	setPixel4
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	ldr	ip, [r3]
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	ldrh	r3, [ip, r1]
	tst	r0, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r1]	@ movhi
	bx	lr
.L6:
	.align	2
.L5:
	.word	videoBuffer
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #28
	ldrb	ip, [sp, #64]	@ zero_extendqisi2
	ldrb	lr, [sp, #64]	@ zero_extendqisi2
	subs	r7, r3, #0
	orr	ip, ip, lr, lsl #8
	strh	ip, [sp, #22]	@ movhi
	ble	.L7
	mov	r6, r2
	sub	r3, r2, #2
	sub	fp, r2, #1
	asr	r3, r3, #1
	orr	r3, r3, #16777216
	asr	ip, fp, #1
	str	r3, [sp, #4]
	asr	r2, r2, #1
	orr	r3, ip, #16777216
	str	r3, [sp, #8]
	orr	r3, r2, #16777216
	str	r3, [sp, #12]
	rsb	r1, r1, r1, lsl #4
	add	r3, r0, r6
	mov	r5, #0
	ldr	r9, .L28
	str	r3, [sp]
	add	r4, r0, r1, lsl #4
	and	r8, r0, #1
	and	r10, r6, #1
	b	.L20
.L9:
	ldr	r2, [r9]
	add	r1, r4, r4, lsr #31
	bic	r1, r1, #1
	ldrb	r0, [sp, #64]	@ zero_extendqisi2
	ldrh	r3, [r2, r1]
	cmp	r10, #0
	and	r3, r3, #255
	beq	.L13
	orr	r3, r3, r0, lsl #8
	cmp	r6, #1
	strh	r3, [r2, r1]	@ movhi
	ble	.L12
	add	r3, r4, #1
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	add	r2, r2, r3
	mov	r0, #3
	ldr	r3, [sp, #8]
	ldr	ip, .L28+4
	add	r1, sp, #22
	mov	lr, pc
	bx	ip
.L12:
	add	r5, r5, #1
	cmp	r7, r5
	add	r4, r4, #240
	beq	.L7
.L20:
	cmp	r8, #0
	bne	.L9
	cmp	r10, #0
	bne	.L10
	cmp	r6, #0
	ble	.L12
	ldr	r2, [r9]
	add	r3, r4, r4, lsr #31
	bic	r3, r3, #1
	add	r2, r2, r3
	mov	r0, #3
	ldr	r3, [sp, #12]
	ldr	ip, .L28+4
	add	r1, sp, #22
	add	r5, r5, #1
	mov	lr, pc
	bx	ip
	cmp	r7, r5
	add	r4, r4, #240
	bne	.L20
.L7:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L13:
	orr	r3, r3, r0, lsl #8
	cmp	r6, #2
	strh	r3, [r2, r1]	@ movhi
	bgt	.L26
.L23:
	add	r3, r4, fp
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	ldr	ip, [sp]
	ldrb	r1, [sp, #64]	@ zero_extendqisi2
	ldrh	r0, [r2, r3]
	tst	ip, #1
	and	r1, r1, #255
	andeq	r0, r0, #255
	andne	r0, r0, #65280
	add	r3, r2, r3
	orreq	r0, r0, r1, lsl #8
	orrne	r0, r0, r1
	strh	r0, [r3]	@ movhi
	b	.L12
.L10:
	cmp	r6, #1
	ldr	r2, [r9]
	bgt	.L27
.L15:
	add	r3, r4, fp
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	ldr	ip, [sp]
	ldrb	r1, [sp, #64]	@ zero_extendqisi2
	ldrh	r0, [r2, r3]
	tst	ip, #1
	and	r1, r1, #255
	andeq	r0, r0, #255
	andne	r0, r0, #65280
	add	r2, r2, r3
	orreq	r0, r0, r1, lsl #8
	orrne	r0, r0, r1
	strh	r0, [r2]	@ movhi
	b	.L12
.L26:
	add	r3, r4, #1
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	add	r2, r2, r3
	mov	r0, #3
	ldr	r3, [sp, #4]
	ldr	ip, .L28+4
	add	r1, sp, #22
	mov	lr, pc
	bx	ip
	ldr	r2, [r9]
	b	.L23
.L27:
	add	r3, r4, r4, lsr #31
	bic	r3, r3, #1
	add	r2, r2, r3
	mov	r0, #3
	ldr	r3, [sp, #8]
	ldr	ip, .L28+4
	add	r1, sp, #22
	mov	lr, pc
	bx	ip
	ldr	r2, [r9]
	b	.L15
.L29:
	.align	2
.L28:
	.word	videoBuffer
	.word	DMANow
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #16
	strb	r0, [sp, #7]
	ldr	r2, .L32
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	mov	r0, #3
	orr	ip, ip, r3, lsl #8
	ldr	r2, [r2]
	ldr	r3, .L32+4
	ldr	r4, .L32+8
	add	r1, sp, #14
	strh	ip, [sp, #14]	@ movhi
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	videoBuffer
	.word	16796416
	.word	DMANow
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	r6, r1, r3
	add	r2, r2, r2, lsr #31
	rsb	r6, r6, r6, lsl #4
	rsb	r1, r1, r1, lsl #4
	ldr	r5, [sp, #32]
	ldr	r9, .L42
	ldr	r8, .L42+4
	add	r6, r0, r6, lsl #4
	add	r4, r0, r1, lsl #4
	asr	r10, r2, #1
	bic	r7, r2, #1
.L36:
	ldr	r3, [r9]
	add	r2, r4, r4, lsr #31
	bic	r2, r2, #1
	mov	r1, r5
	add	r2, r3, r2
	mov	r0, #3
	mov	r3, r10
	add	r4, r4, #240
	mov	lr, pc
	bx	r8
	cmp	r6, r4
	add	r5, r5, r7
	bne	.L36
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	videoBuffer
	.word	DMANow
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L46
	mov	r1, r0
	ldr	r2, [r3]
	ldr	r4, .L46+4
	mov	r3, #19200
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	videoBuffer
	.word	DMANow
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L51
	moveq	r2, #100663296
	ldr	r1, .L51+4
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	bx	lr
.L52:
	.align	2
.L51:
	.word	100704256
	.word	videoBuffer
	.size	flipPage, .-flipPage
	.align	2
	.global	drawChar4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar4, %function
drawChar4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L65
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	lr, .L65+4
	rsb	r1, r1, r1, lsl #4
	add	r2, r2, r2, lsl #1
	lsl	r6, r3, #24
	ldr	r4, [ip]
	lsl	r8, r1, #4
	add	lr, lr, r2, lsl #4
	add	r9, r0, #6
	asr	r6, r6, #16
	and	r7, r3, #255
.L54:
	sub	r2, lr, #48
	add	r1, r8, r0
	and	r5, r0, #1
.L58:
	ldrb	ip, [r2]	@ zero_extendqisi2
	add	r3, r1, r1, lsr #31
	cmp	ip, #0
	bic	r3, r3, #1
	beq	.L55
	ldrh	r10, [r4, r3]
	and	ip, r10, #255
	cmp	r5, #0
	orr	ip, r6, ip
	lsl	ip, ip, #16
	andeq	ip, r10, #65280
	lsrne	ip, ip, #16
	orreq	ip, ip, r7
	strh	ip, [r4, r3]	@ movhi
.L55:
	add	r2, r2, #6
	cmp	r2, lr
	add	r1, r1, #240
	bne	.L58
	add	r0, r0, #1
	cmp	r0, r9
	add	lr, r2, #1
	bne	.L54
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	videoBuffer
	.word	fontdata_6x8+48
	.size	drawChar4, .-drawChar4
	.align	2
	.global	drawString4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString4, %function
drawString4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L67
	mov	r4, r0
	mov	r7, r1
	mov	r6, r3
.L69:
	mov	r0, r4
	mov	r3, r6
	mov	r1, r7
	bl	drawChar4
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L69
.L67:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawString4, .-drawString4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
