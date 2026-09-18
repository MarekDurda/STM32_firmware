	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"firmware.c"
	.text
	.align	2
	.global	start
	.syntax unified
	.arm
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	ldr	r3, .L3
	str	r3, [fp, #-8]
	ldr	r3, .L3+4
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	orr	r2, r3, #4
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	orr	r2, r3, #67108864
	ldr	r3, [fp, #-12]
	str	r2, [r3]
.L2:
	ldr	r3, [fp, #-12]
	add	r3, r3, #20
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #20
	eor	r2, r2, #8192
	str	r2, [r3]
	b	.L2
.L4:
	.align	2
.L3:
	.word	1073887280
	.word	1073874944
	.size	start, .-start
	.global	STACK
	.bss
	.align	2
	.type	STACK, %object
	.size	STACK, 1024
STACK:
	.space	1024
	.global	vectors
	.section	.vectors,"aw"
	.align	2
	.type	vectors, %object
	.size	vectors, 8
vectors:
	.word	STACK+1024
	.word	start
	.ident	"GCC: (GNU) 13.3.0"
