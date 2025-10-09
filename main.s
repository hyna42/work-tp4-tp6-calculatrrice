	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"*** CALCULATRICE ***"
.LC1:
	.string	"1 \342\206\222 Addition"
.LC2:
	.string	"2 \342\206\222 Soustraction"
.LC3:
	.string	"3 \342\206\222 Multiplication"
.LC4:
	.string	"4 \342\206\222 Division"
	.align 8
.LC5:
	.string	"Choisissez une op\303\251ration (1-4) : "
.LC6:
	.string	"%d"
.LC7:
	.string	"Entrez les deux nombres : "
.LC8:
	.string	"%f,%f"
.LC9:
	.string	"Resultat = %.2f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L2
.L3:
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
.L2:
	movl	-24(%rbp), %eax
	testl	%eax, %eax
	jle	.L3
	movl	-24(%rbp), %eax
	cmpl	$4, %eax
	jg	.L3
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rdx
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-24(%rbp), %eax
	cmpl	$4, %eax
	je	.L4
	cmpl	$4, %eax
	jg	.L5
	cmpl	$3, %eax
	je	.L6
	cmpl	$3, %eax
	jg	.L5
	cmpl	$1, %eax
	je	.L7
	cmpl	$2, %eax
	je	.L8
	jmp	.L5
.L7:
	movss	-16(%rbp), %xmm0
	movl	-20(%rbp), %eax
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	add@PLT
	movd	%xmm0, %eax
	movl	%eax, -12(%rbp)
	jmp	.L5
.L8:
	movss	-16(%rbp), %xmm0
	movl	-20(%rbp), %eax
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	sub@PLT
	movd	%xmm0, %eax
	movl	%eax, -12(%rbp)
	jmp	.L5
.L6:
	movss	-16(%rbp), %xmm0
	movl	-20(%rbp), %eax
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	mul@PLT
	movd	%xmm0, %eax
	movl	%eax, -12(%rbp)
	jmp	.L5
.L4:
	movss	-16(%rbp), %xmm0
	movl	-20(%rbp), %eax
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	diviz@PLT
	movd	%xmm0, %eax
	movl	%eax, -12(%rbp)
	nop
.L5:
	pxor	%xmm2, %xmm2
	cvtss2sd	-12(%rbp), %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.2) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
