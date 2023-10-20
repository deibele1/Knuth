.global _start
.align 2

_start: 
	mov	x3, #119
	mov	x4, #153
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
	mov	x0, #1
	adr	x1, success
	mov	x2, #11
	mov	x16, #4
	svc	#0x80
	b	exit

print_failure:
	mov	x0, #1
	adr	x1, failure
	mov	x2, #12
	mov	x16, #4
	svc	#0x80
	b	exit

check:
	add	x5, x3, x4
	cmp	x5, #17
	bne	print_failure
	beq	print_success

exit:
	mov	x16, #1
	svc	#0x80
	
	


success:	.ascii "It worked!\n"	
failure:	.ascii "it failed\n"
