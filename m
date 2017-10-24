From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v9 05/12] RISC-V: Atomic and Locking Code
Date: Tue, 24 Oct 2017 15:10:33 +0100
Message-ID: <20171024141032.GD13445@arm.com>
References: <20170927015638.19443-1-palmer@dabbelt.com>
 <20170927015638.19443-6-palmer@dabbelt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170927015638.19443-6-palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, albert-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, mmarek-IBi9RG/b67k@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, boqun.feng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Palmer,

Some late comments on this which you might want to address as you get the
chance.

On Tue, Sep 26, 2017 at 06:56:31PM -0700, Palmer Dabbelt wrote:
> This contains all the code that directly interfaces with the RISC-V
> memory model.  While this code corforms to the current RISC-V ISA
> specifications (user 2.2 and priv 1.10), the memory model is somewhat
> underspecified in those documents.  There is a working group that hopes
> to produce a formal memory model by the end of the year, but my
> understanding is that the basic definitions we're relying on here won't
> change significantly.
> 
> Reviewed-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/riscv/include/asm/atomic.h         | 375 ++++++++++++++++++++++++++++++++
>  arch/riscv/include/asm/barrier.h        |  68 ++++++
>  arch/riscv/include/asm/bitops.h         | 218 +++++++++++++++++++
>  arch/riscv/include/asm/cacheflush.h     |  39 ++++
>  arch/riscv/include/asm/cmpxchg.h        | 134 ++++++++++++
>  arch/riscv/include/asm/io.h             | 303 ++++++++++++++++++++++++++
>  arch/riscv/include/asm/spinlock.h       | 165 ++++++++++++++
>  arch/riscv/include/asm/spinlock_types.h |  33 +++
>  arch/riscv/include/asm/tlb.h            |  24 ++
>  arch/riscv/include/asm/tlbflush.h       |  64 ++++++
>  10 files changed, 1423 insertions(+)
>  create mode 100644 arch/riscv/include/asm/atomic.h
>  create mode 100644 arch/riscv/include/asm/barrier.h
>  create mode 100644 arch/riscv/include/asm/bitops.h
>  create mode 100644 arch/riscv/include/asm/cacheflush.h
>  create mode 100644 arch/riscv/include/asm/cmpxchg.h
>  create mode 100644 arch/riscv/include/asm/io.h
>  create mode 100644 arch/riscv/include/asm/spinlock.h
>  create mode 100644 arch/riscv/include/asm/spinlock_types.h
>  create mode 100644 arch/riscv/include/asm/tlb.h
>  create mode 100644 arch/riscv/include/asm/tlbflush.h
> 
> diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
> new file mode 100644
> index 000000000000..e2e37c57cbeb
> --- /dev/null
> +++ b/arch/riscv/include/asm/atomic.h
> @@ -0,0 +1,375 @@
> +/*
> + * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2017 SiFive
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public Licence
> + * as published by the Free Software Foundation; either version
> + * 2 of the Licence, or (at your option) any later version.
> + */
> +
> +#ifndef _ASM_RISCV_ATOMIC_H
> +#define _ASM_RISCV_ATOMIC_H
> +
> +#ifdef CONFIG_GENERIC_ATOMIC64
> +# include <asm-generic/atomic64.h>
> +#else
> +# if (__riscv_xlen < 64)
> +#  error "64-bit atomics require XLEN to be at least 64"
> +# endif
> +#endif
> +
> +#include <asm/cmpxchg.h>
> +#include <asm/barrier.h>
> +
> +#define ATOMIC_INIT(i)	{ (i) }
> +static __always_inline int atomic_read(const atomic_t *v)
> +{
> +	return READ_ONCE(v->counter);
> +}
> +static __always_inline void atomic_set(atomic_t *v, int i)
> +{
> +	WRITE_ONCE(v->counter, i);
> +}
> +
> +#ifndef CONFIG_GENERIC_ATOMIC64
> +#define ATOMIC64_INIT(i) { (i) }
> +static __always_inline long atomic64_read(const atomic64_t *v)
> +{
> +	return READ_ONCE(v->counter);
> +}
> +static __always_inline void atomic64_set(atomic64_t *v, long i)
> +{
> +	WRITE_ONCE(v->counter, i);
> +}
> +#endif
> +
> +/*
> + * First, the atomic ops that have no ordering constraints and therefor don't
> + * have the AQ or RL bits set.  These don't return anything, so there's only
> + * one version to worry about.
> + */
> +#define ATOMIC_OP(op, asm_op, c_op, I, asm_type, c_type, prefix)				\
> +static __always_inline void atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)		\
> +{												\
> +	__asm__ __volatile__ (									\
> +		"amo" #asm_op "." #asm_type " zero, %1, %0"					\
> +		: "+A" (v->counter)								\
> +		: "r" (I)									\
> +		: "memory");									\
> +}
> +
> +#ifdef CONFIG_GENERIC_ATOMIC64
> +#define ATOMIC_OPS(op, asm_op, c_op, I)			\
> +        ATOMIC_OP (op, asm_op, c_op, I, w,  int,   )
> +#else
> +#define ATOMIC_OPS(op, asm_op, c_op, I)			\
> +        ATOMIC_OP (op, asm_op, c_op, I, w,  int,   )	\
> +        ATOMIC_OP (op, asm_op, c_op, I, d, long, 64)
> +#endif
> +
> +ATOMIC_OPS(add, add, +,  i)
> +ATOMIC_OPS(sub, add, +, -i)
> +ATOMIC_OPS(and, and, &,  i)
> +ATOMIC_OPS( or,  or, |,  i)
> +ATOMIC_OPS(xor, xor, ^,  i)

What is the point in the c_op parameter to these things?

> +/*
> + * Atomic ops that have ordered, relaxed, acquire, and relese variants.
> + * There's two flavors of these: the arithmatic ops have both fetch and return
> + * versions, while the logical ops only have fetch versions.
> + */
> +#define ATOMIC_FETCH_OP(op, asm_op, c_op, I, asm_or, c_or, asm_type, c_type, prefix)			\
> +static __always_inline c_type atomic##prefix##_fetch_##op##c_or(c_type i, atomic##prefix##_t *v)	\
> +{													\
> +	register c_type ret;										\
> +	__asm__ __volatile__ (										\
> +		"amo" #asm_op "." #asm_type #asm_or " %1, %2, %0"					\
> +		: "+A" (v->counter), "=r" (ret)								\
> +		: "r" (I)										\
> +		: "memory");										\
> +	return ret;											\
> +}
> +
> +#define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_or, c_or, asm_type, c_type, prefix)			\
> +static __always_inline c_type atomic##prefix##_##op##_return##c_or(c_type i, atomic##prefix##_t *v)	\
> +{													\
> +        return atomic##prefix##_fetch_##op##c_or(i, v) c_op I;						\
> +}
> +
> +#ifdef CONFIG_GENERIC_ATOMIC64
> +#define ATOMIC_OPS(op, asm_op, c_op, I, asm_or, c_or)				\
> +        ATOMIC_FETCH_OP (op, asm_op, c_op, I, asm_or, c_or, w,  int,   )	\
> +        ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_or, c_or, w,  int,   )
> +#else
> +#define ATOMIC_OPS(op, asm_op, c_op, I, asm_or, c_or)				\
> +        ATOMIC_FETCH_OP (op, asm_op, c_op, I, asm_or, c_or, w,  int,   )	\
> +        ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_or, c_or, w,  int,   )	\
> +        ATOMIC_FETCH_OP (op, asm_op, c_op, I, asm_or, c_or, d, long, 64)	\
> +        ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_or, c_or, d, long, 64)
> +#endif
> +
> +ATOMIC_OPS(add, add, +,  i,      , _relaxed)
> +ATOMIC_OPS(add, add, +,  i, .aq  , _acquire)
> +ATOMIC_OPS(add, add, +,  i, .rl  , _release)
> +ATOMIC_OPS(add, add, +,  i, .aqrl,         )

Have you checked that .aqrl is equivalent to "ordered", since there are
interpretations where that isn't the case. Specifically:

// all variables zero at start of time
P0:
WRITE_ONCE(x) = 1;
atomic_add_return(y, 1);
WRITE_ONCE(z) = 1;

P1:
READ_ONCE(z) // reads 1
smp_rmb();
READ_ONCE(x) // must not read 0

> +/*
> + * atomic_{cmp,}xchg is required to have exactly the same ordering semantics as
> + * {cmp,}xchg and the operations that return, so they need a barrier.  We just
> + * use the other implementations directly.
> + */

We also have relaxed/acquire/release versions of cmpxchg and xchg, if you
want to implement them.

> +#define ATOMIC_OP(c_t, prefix, c_or, size, asm_or)						\
> +static __always_inline c_t atomic##prefix##_cmpxchg##c_or(atomic##prefix##_t *v, c_t o, c_t n) 	\
> +{												\
> +	return __cmpxchg(&(v->counter), o, n, size, asm_or, asm_or);				\
> +}												\
> +static __always_inline c_t atomic##prefix##_xchg##c_or(atomic##prefix##_t *v, c_t n) 		\
> +{												\
> +	return __xchg(n, &(v->counter), size, asm_or);						\
> +}
> +
> +#ifdef CONFIG_GENERIC_ATOMIC64
> +#define ATOMIC_OPS(c_or, asm_or)			\
> +	ATOMIC_OP( int,   , c_or, 4, asm_or)
> +#else
> +#define ATOMIC_OPS(c_or, asm_or)			\
> +	ATOMIC_OP( int,   , c_or, 4, asm_or)		\
> +	ATOMIC_OP(long, 64, c_or, 8, asm_or)
> +#endif
> +
> +ATOMIC_OPS(        , .aqrl)
> +ATOMIC_OPS(_acquire,   .aq)
> +ATOMIC_OPS(_release,   .rl)
> +ATOMIC_OPS(_relaxed,      )
> +
> +#undef ATOMIC_OPS
> +#undef ATOMIC_OP
> +
> +static __always_inline int atomic_sub_if_positive(atomic_t *v, int offset)
> +{
> +       int prev, rc;
> +
> +	__asm__ __volatile__ (
> +		"0:\n\t"
> +		"lr.w.aqrl  %[p],  %[c]\n\t"
> +		"sub       %[rc],  %[p], %[o]\n\t"
> +		"bltz      %[rc],    1f\n\t"
> +		"sc.w.aqrl %[rc], %[rc], %[c]\n\t"
> +		"bnez      %[rc],    0b\n\t"
> +		"1:"
> +		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> +		: [o]"r" (offset)
> +		: "memory");
> +	return prev - offset;
> +}
> +
> +#define atomic_dec_if_positive(v)	atomic_sub_if_positive(v, 1)
> +
> +#ifndef CONFIG_GENERIC_ATOMIC64
> +static __always_inline long atomic64_sub_if_positive(atomic64_t *v, int offset)
> +{
> +       long prev, rc;
> +
> +	__asm__ __volatile__ (
> +		"0:\n\t"
> +		"lr.d.aqrl  %[p],  %[c]\n\t"
> +		"sub       %[rc],  %[p], %[o]\n\t"
> +		"bltz      %[rc],    1f\n\t"
> +		"sc.d.aqrl %[rc], %[rc], %[c]\n\t"
> +		"bnez      %[rc],    0b\n\t"
> +		"1:"
> +		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> +		: [o]"r" (offset)
> +		: "memory");
> +	return prev - offset;
> +}
> +
> +#define atomic64_dec_if_positive(v)	atomic64_sub_if_positive(v, 1)
> +#endif
> +
> +#endif /* _ASM_RISCV_ATOMIC_H */
> diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
> new file mode 100644
> index 000000000000..183534b7c39b
> --- /dev/null
> +++ b/arch/riscv/include/asm/barrier.h
> @@ -0,0 +1,68 @@
> +/*
> + * Based on arch/arm/include/asm/barrier.h
> + *
> + * Copyright (C) 2012 ARM Ltd.
> + * Copyright (C) 2013 Regents of the University of California
> + * Copyright (C) 2017 SiFive
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef _ASM_RISCV_BARRIER_H
> +#define _ASM_RISCV_BARRIER_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#define nop()		__asm__ __volatile__ ("nop")
> +
> +#define RISCV_FENCE(p, s) \
> +	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
> +
> +/* These barriers need to enforce ordering on both devices or memory. */
> +#define mb()		RISCV_FENCE(iorw,iorw)
> +#define rmb()		RISCV_FENCE(ir,ir)
> +#define wmb()		RISCV_FENCE(ow,ow)
> +
> +/* These barriers do not need to enforce ordering on devices, just memory. */
> +#define smp_mb()	RISCV_FENCE(rw,rw)
> +#define smp_rmb()	RISCV_FENCE(r,r)
> +#define smp_wmb()	RISCV_FENCE(w,w)
> +
> +/*
> + * These fences exist to enforce ordering around the relaxed AMOs.  The
> + * documentation defines that
> + * "
> + *     atomic_fetch_add();
> + *   is equivalent to:
> + *     smp_mb__before_atomic();
> + *     atomic_fetch_add_relaxed();
> + *     smp_mb__after_atomic();
> + * "
> + * So we emit full fences on both sides.
> + */
> +#define __smb_mb__before_atomic()	smp_mb()
> +#define __smb_mb__after_atomic()	smp_mb()

Now I'm confused, because you're also spitting out .aqrl for those afaict.
Do you really need full barriers *and* .aqrl, or am I misunderstanding
something here?

> +
> +/*
> + * These barriers prevent accesses performed outside a spinlock from being moved
> + * inside a spinlock.  Since RISC-V sets the aq/rl bits on our spinlock only
> + * enforce release consistency, we need full fences here.
> + */
> +#define smb_mb__before_spinlock()	smp_mb()

We killed this macro, so you don't need to define it.

> +#define smb_mb__after_spinlock()	smp_mb()
> +
> +#include <asm-generic/barrier.h>
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* _ASM_RISCV_BARRIER_H */
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> new file mode 100644
> index 000000000000..7c281ef1d583
> --- /dev/null
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -0,0 +1,218 @@
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + *
> + *   This program is free software; you can redistribute it and/or
> + *   modify it under the terms of the GNU General Public License
> + *   as published by the Free Software Foundation, version 2.
> + *
> + *   This program is distributed in the hope that it will be useful,
> + *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *   GNU General Public License for more details.
> + */
> +
> +#ifndef _ASM_RISCV_BITOPS_H
> +#define _ASM_RISCV_BITOPS_H
> +
> +#ifndef _LINUX_BITOPS_H
> +#error "Only <linux/bitops.h> can be included directly"
> +#endif /* _LINUX_BITOPS_H */
> +
> +#include <linux/compiler.h>
> +#include <linux/irqflags.h>
> +#include <asm/barrier.h>
> +#include <asm/bitsperlong.h>
> +
> +#ifndef smp_mb__before_clear_bit
> +#define smp_mb__before_clear_bit()  smp_mb()
> +#define smp_mb__after_clear_bit()   smp_mb()
> +#endif /* smp_mb__before_clear_bit */
> +
> +#include <asm-generic/bitops/__ffs.h>
> +#include <asm-generic/bitops/ffz.h>
> +#include <asm-generic/bitops/fls.h>
> +#include <asm-generic/bitops/__fls.h>
> +#include <asm-generic/bitops/fls64.h>
> +#include <asm-generic/bitops/find.h>
> +#include <asm-generic/bitops/sched.h>
> +#include <asm-generic/bitops/ffs.h>
> +
> +#include <asm-generic/bitops/hweight.h>
> +
> +#if (BITS_PER_LONG == 64)
> +#define __AMO(op)	"amo" #op ".d"
> +#elif (BITS_PER_LONG == 32)
> +#define __AMO(op)	"amo" #op ".w"
> +#else
> +#error "Unexpected BITS_PER_LONG"
> +#endif
> +
> +#define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
> +({								\
> +	unsigned long __res, __mask;				\
> +	__mask = BIT_MASK(nr);					\
> +	__asm__ __volatile__ (					\
> +		__AMO(op) #ord " %0, %2, %1"			\
> +		: "=r" (__res), "+A" (addr[BIT_WORD(nr)])	\
> +		: "r" (mod(__mask))				\
> +		: "memory");					\
> +	((__res & __mask) != 0);				\
> +})

This looks broken to me -- the value-returning test bitops need to be fully
ordered.

> +#ifndef _ASM_RISCV_CMPXCHG_H
> +#define _ASM_RISCV_CMPXCHG_H
> +
> +#include <linux/bug.h>
> +
> +#include <asm/barrier.h>
> +
> +#define __xchg(new, ptr, size, asm_or)				\
> +({								\
> +	__typeof__(ptr) __ptr = (ptr);				\
> +	__typeof__(new) __new = (new);				\
> +	__typeof__(*(ptr)) __ret;				\
> +	switch (size) {						\
> +	case 4:							\
> +		__asm__ __volatile__ (				\
> +			"amoswap.w" #asm_or " %0, %2, %1"	\
> +			: "=r" (__ret), "+A" (*__ptr)		\
> +			: "r" (__new)				\
> +			: "memory");				\
> +		break;						\
> +	case 8:							\
> +		__asm__ __volatile__ (				\
> +			"amoswap.d" #asm_or " %0, %2, %1"	\
> +			: "=r" (__ret), "+A" (*__ptr)		\
> +			: "r" (__new)				\
> +			: "memory");				\
> +		break;						\
> +	default:						\
> +		BUILD_BUG();					\
> +	}							\
> +	__ret;							\
> +})
> +
> +#define xchg(ptr, x)    (__xchg((x), (ptr), sizeof(*(ptr)), .aqrl))
> +
> +#define xchg32(ptr, x)				\
> +({						\
> +	BUILD_BUG_ON(sizeof(*(ptr)) != 4);	\
> +	xchg((ptr), (x));			\
> +})
> +
> +#define xchg64(ptr, x)				\
> +({						\
> +	BUILD_BUG_ON(sizeof(*(ptr)) != 8);	\
> +	xchg((ptr), (x));			\
> +})
> +
> +/*
> + * Atomic compare and exchange.  Compare OLD with MEM, if identical,
> + * store NEW in MEM.  Return the initial value in MEM.  Success is
> + * indicated by comparing RETURN with OLD.
> + */
> +#define __cmpxchg(ptr, old, new, size, lrb, scb)			\
> +({									\
> +	__typeof__(ptr) __ptr = (ptr);					\
> +	__typeof__(*(ptr)) __old = (old);				\
> +	__typeof__(*(ptr)) __new = (new);				\
> +	__typeof__(*(ptr)) __ret;					\
> +	register unsigned int __rc;					\
> +	switch (size) {							\
> +	case 4:								\
> +		__asm__ __volatile__ (					\
> +		"0:"							\
> +			"lr.w" #scb " %0, %2\n"				\
> +			"bne         %0, %z3, 1f\n"			\
> +			"sc.w" #lrb " %1, %z4, %2\n"			\
> +			"bnez        %1, 0b\n"				\

You don't have an AMO for these?

> +		"1:"							\
> +			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
> +			: "rJ" (__old), "rJ" (__new)			\
> +			: "memory");					\
> +		break;							\
> +	case 8:								\
> +		__asm__ __volatile__ (					\
> +		"0:"							\
> +			"lr.d" #scb " %0, %2\n"				\
> +			"bne         %0, %z3, 1f\n"			\
> +			"sc.d" #lrb " %1, %z4, %2\n"			\
> +			"bnez        %1, 0b\n"				\
> +		"1:"							\
> +			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
> +			: "rJ" (__old), "rJ" (__new)			\
> +			: "memory");					\
> +		break;							\
> +	default:							\
> +		BUILD_BUG();						\
> +	}								\
> +	__ret;								\
> +})

[...]

> +#ifndef _ASM_RISCV_SPINLOCK_H
> +#define _ASM_RISCV_SPINLOCK_H
> +
> +#include <linux/kernel.h>
> +#include <asm/current.h>
> +
> +/*
> + * Simple spin lock operations.  These provide no fairness guarantees.
> + */
> +
> +/* FIXME: Replace this with a ticket lock, like MIPS. */
> +
> +#define arch_spin_lock_flags(lock, flags) arch_spin_lock(lock)
> +#define arch_spin_is_locked(x)	((x)->lock != 0)

Missing READ_ONCE.

> +
> +static inline void arch_spin_unlock(arch_spinlock_t *lock)
> +{
> +	__asm__ __volatile__ (
> +		"amoswap.w.rl x0, x0, %0"
> +		: "=A" (lock->lock)
> +		:: "memory");
> +}
> +
> +static inline int arch_spin_trylock(arch_spinlock_t *lock)
> +{
> +	int tmp = 1, busy;
> +
> +	__asm__ __volatile__ (
> +		"amoswap.w.aq %0, %2, %1"
> +		: "=r" (busy), "+A" (lock->lock)
> +		: "r" (tmp)
> +		: "memory");
> +
> +	return !busy;
> +}
> +
> +static inline void arch_spin_lock(arch_spinlock_t *lock)
> +{
> +	while (1) {
> +		if (arch_spin_is_locked(lock))
> +			continue;
> +
> +		if (arch_spin_trylock(lock))
> +			break;
> +	}
> +}
> +
> +static inline void arch_spin_unlock_wait(arch_spinlock_t *lock)
> +{
> +	smp_rmb();
> +	do {
> +		cpu_relax();
> +	} while (arch_spin_is_locked(lock));
> +	smp_acquire__after_ctrl_dep();
> +}

We killed this one too, so please drop it.

> +/***********************************************************/
> +
> +static inline int arch_read_can_lock(arch_rwlock_t *lock)
> +{
> +	return lock->lock >= 0;
> +}
> +
> +static inline int arch_write_can_lock(arch_rwlock_t *lock)
> +{
> +	return lock->lock == 0;
> +}
> +
> +static inline void arch_read_lock(arch_rwlock_t *lock)
> +{
> +	int tmp;
> +
> +	__asm__ __volatile__(
> +		"1:	lr.w	%1, %0\n"
> +		"	bltz	%1, 1b\n"
> +		"	addi	%1, %1, 1\n"
> +		"	sc.w.aq	%1, %1, %0\n"
> +		"	bnez	%1, 1b\n"
> +		: "+A" (lock->lock), "=&r" (tmp)
> +		:: "memory");
> +}
> +
> +static inline void arch_write_lock(arch_rwlock_t *lock)
> +{
> +	int tmp;
> +
> +	__asm__ __volatile__(
> +		"1:	lr.w	%1, %0\n"
> +		"	bnez	%1, 1b\n"
> +		"	li	%1, -1\n"
> +		"	sc.w.aq	%1, %1, %0\n"
> +		"	bnez	%1, 1b\n"
> +		: "+A" (lock->lock), "=&r" (tmp)
> +		:: "memory");
> +}

I think you have the same starvation issues as we have on arm64 here. I
strongly recommend moving over to qrwlock :)

> +#ifndef _ASM_RISCV_TLBFLUSH_H
> +#define _ASM_RISCV_TLBFLUSH_H
> +
> +#ifdef CONFIG_MMU
> +
> +/* Flush entire local TLB */
> +static inline void local_flush_tlb_all(void)
> +{
> +	__asm__ __volatile__ ("sfence.vma" : : : "memory");
> +}
> +
> +/* Flush one page from local TLB */
> +static inline void local_flush_tlb_page(unsigned long addr)
> +{
> +	__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
> +}

Is this serialised against prior updates to the page table (set_pte) and
also against subsequent instruction fetch?

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
