	.file	"lab3.c"
	.text
	.globl	_Z9pi_numberd
	.type	_Z9pi_numberd, @function
_Z9pi_numberd:
.LFB52:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$36, %esp
	.cfi_def_cfa_offset 48
	fldl	48(%esp)
	fstl	24(%esp)
	fldz
	fxch	%st(1)
	fucomip	%st(1), %st
	jb	.L8
	movl	$1, %esi
	fldz
	fstpl	8(%esp)
	movl	$0, %ebx
.L4:
	leal	-8(%esp), %esp
	.cfi_def_cfa_offset 56
	fstpl	(%esp)
	pushl	$-1074790400
	.cfi_def_cfa_offset 60
	pushl	$0
	.cfi_def_cfa_offset 64
	call	pow
	fmuls	.LC2
	movl	%esi, 36(%esp)
	fildl	36(%esp)
	fdivrp	%st, %st(1)
	faddl	24(%esp)
	fstpl	24(%esp)
	addl	$1, %ebx
	movl	%ebx, 36(%esp)
	fildl	36(%esp)
	addl	$2, %esi
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	fldl	24(%esp)
	fucomip	%st(1), %st
	jnb	.L4
	fstp	%st(0)
	jmp	.L2
.L8:
	fstp	%st(0)
	fldz
	fstpl	8(%esp)
.L2:
	fldl	8(%esp)
	addl	$36, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE52:
	.size	_Z9pi_numberd, .-_Z9pi_numberd
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"Put int the n parameter :"
.LC5:
	.string	"%lf"
.LC6:
	.string	"Result : %f\n"
.LC8:
	.string	"Time : %lf sec\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB53:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$64, %esp
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	pushl	$.LC4
	call	puts
	fldz
	fstpl	-40(%ebp)
	addl	$8, %esp
	leal	-40(%ebp), %eax
	pushl	%eax
	pushl	$.LC5
	call	scanf
	addl	$8, %esp
	leal	-28(%ebp), %eax
	pushl	%eax
	pushl	$4
	call	clock_gettime
	addl	$8, %esp
	pushl	-36(%ebp)
	pushl	-40(%ebp)
	call	_Z9pi_numberd
	fstpl	-48(%ebp)
	addl	$8, %esp
	leal	-20(%ebp), %eax
	pushl	%eax
	pushl	$4
	call	clock_gettime
	addl	$16, %esp
	pushl	-44(%ebp)
	pushl	-48(%ebp)
	pushl	$.LC6
	pushl	$1
	call	__printf_chk
	addl	$8, %esp
	movl	-16(%ebp), %eax
	subl	-24(%ebp), %eax
	movl	%eax, -48(%ebp)
	fildl	-48(%ebp)
	fmull	.LC7
	movl	-20(%ebp), %eax
	subl	-28(%ebp), %eax
	movl	%eax, -48(%ebp)
	fildl	-48(%ebp)
	faddp	%st, %st(1)
	fstpl	(%esp)
	pushl	$.LC8
	pushl	$1
	call	__printf_chk
	addl	$16, %esp
	movl	-12(%ebp), %edx
	xorl	%gs:20, %edx
	je	.L11
	call	__stack_chk_fail
.L11:
	movl	$0, %eax
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE53:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC2:
	.long	1082130432
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	3894859413
	.long	1041313291
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
