	.arch armv7-a
	.eabi_attribute 28, 1
	.fpu vfpv3-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"lab4.c"
	.text
	.align	2
	.global	pi_number
	.syntax unified
	.thumb
	.thumb_func
	.type	pi_number, %function
pi_number:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	vcmpe.f64	d0, #0 // сразу проверка на 0
	push	{r3, r4, r5, lr}
	vpush.64	{d8, d9, d10, d11}
	vmrs	APSR_nzcv, FPSCR // переносим флаги из сопроцессора
	blt	.L8 // выходим при проваленной проверке
	movs	r5, #1
	movs	r4, #0
	vmov.f64	d10, #-1.0e+0 // загружаем константы до начала выполнения цикла
	vldr.64	d1, .L11
	vmov.f64	d9, #4.0e+0
	vmov.f64	d8, d0
	vmov.f64	d11, d1
.L4:
	adds	r4, r4, #1
	vmov.f64	d0, d10
	bl	pow
	vmov	s15, r4	@ int
	vcvt.f64.s32	d1, s15
	vmov	s15, r5	@ int
	adds	r5, r5, #2 // не считает каждый раз 2i+1, а прибавляет константу
	vcvt.f64.s32	d7, s15
	vcmpe.f64	d1, d8
	vmrs	APSR_nzcv, FPSCR
	vmul.f64	d0, d0, d9
	vdiv.f64	d6, d0, d7
	vadd.f64	d11, d11, d6
	bls	.L4 // i <= n
.L2:
	vmov.f64	d0, d11
	vldm	sp!, {d8-d11} // вовращаем регистры сопроцессора (то же что vpop.64 {d8-d11})
	pop	{r3, r4, r5, pc}
.L8:
	vldr.64	d11, .L11
	b	.L2
.L12:
	.align	3
.L11:
	.word	0
	.word	0
	.size	pi_number, .-pi_number
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	movw	r4, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:__stack_chk_guard
	sub	sp, sp, #44
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	ldr	r3, [r4]
	str	r3, [sp, #36]
	bl	puts
	add	r1, sp, #40
	movs	r2, #0
	movs	r3, #0
	movw	r0, #:lower16:.LC1
	strd	r2, [r1, #-32]!
	movt	r0, #:upper16:.LC1
	bl	__isoc99_scanf
	add	r1, sp, #20
	movs	r0, #4
	bl	clock_gettime
	vldr.64	d0, [sp, #8]
	bl	pi_number
	add	r1, sp, #28
	movs	r0, #4
	vmov	r2, r3, d0
	strd	r2, [sp]
	bl	clock_gettime
	ldrd	r2, [sp]
	movw	r1, #:lower16:.LC2
	movs	r0, #1
	movt	r1, #:upper16:.LC2
	bl	__printf_chk
	ldr	r0, [sp, #24]
	ldr	r2, [sp, #32]
	movw	r1, #:lower16:.LC3
	ldr	r3, [sp, #28]
	movt	r1, #:upper16:.LC3
	subs	r2, r2, r0
	ldr	r5, [sp, #20]
	vldr.64	d5, .L17
	movs	r0, #1
	subs	r3, r3, r5
	vmov	s15, r2	@ int
	vcvt.f64.s32	d6, s15
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vmla.f64	d7, d6, d5
	vmov	r2, r3, d7
	bl	__printf_chk
	ldr	r2, [sp, #36]
	ldr	r3, [r4]
	cmp	r2, r3
	bne	.L16
	movs	r0, #0
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, pc}
.L16:
	bl	__stack_chk_fail
.L18:
	.align	3
.L17:
	.word	3894859413
	.word	1041313291
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Put int the n parameter :\000"
	.space	2
.LC1:
	.ascii	"%lf\000"
.LC2:
	.ascii	"Result : %f\012\000"
	.space	3
.LC3:
	.ascii	"Time : %lf sec\012\000"
	.ident	"GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.1) 5.4.0 20160609"
	.section	.note.GNU-stack,"",%progbits






	Оптимизировано :
	1. сразу проверяется параметр -> по определенному условию сразу выходит из функции
	2. сохраняет сопроцессор вызывающей функции
	3. не загружает константы в сопроцессор каждую итерацию, а делает это один раз перед циклом
	4. меньше размер кода
	5. не считает каждую итерацию выражение с умножением, а просто меняет его на константу
	6. вообще нет обращений в память - обходится регистрами
	7. не загружает каждый раз переменную i из памяти, когда видит ее в коде (а без оптимизации
		при любом изменении i он сначала вытаскивал значение из памяти, потом менял, а потом загружал обратно)
