.global _start
.align 2

_start: 
	mov	x6, #10	// print_base
	mov	x3, #1386
	mov	x4, #3213
	cmp	x3, x4
	bge	algorithm_right
	b	algorithm_left

algorithm_left:
	udiv	x5, x4, x3
	msub	x4, x5, x3, x4
	cmp	x3, #0
	beq	check
	b	algorithm_right

algorithm_right:
	udiv	x5, x3, x4
	msub	x3, x5, x4, x3
	cmp	x4, #0
	beq	check
	b	algorithm_left

print_success:
	mov	x7, #16
	mov	x0, #1
	mov	x1, sp
	add	x4, x4, #1
	add	x1, x1, x4
	sub	x2, x7, x4
	mov	x16, #4
	svc	#0x80
	b	exit

check:
	add	x5, x3, x4
	mov	x1, x5
	sub	sp, sp, #16
	mov	x4, #15
	mov	x5, #10
	strb	w5, [sp, x4]
	sub	x4, x4, #1
	bl	digitize
	b	print_success

digitize:
	udiv	x2, x1, x6
	msub	x3, x2, x6, x1
	mov	x1, x2
	add	x2, sp, x5
	add	x5, x3, #48
	strb	w5, [sp, x4]
	sub	x4, x4, #1
	cmp	x1, #0
	bne	digitize
	ret

exit:
	mov	x16, #1
	svc	#0x80

