From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: berlin: add SMP support
Date: Tue, 3 Jun 2014 14:31:13 +0800
Message-ID: <20140603143113.0b2aeb74@xhacker>
References: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com>
	<1401700866-24804-2-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401700866-24804-2-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine =?UTF-8?B?VMOpbmFydA==?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jimmy Xu <zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Antoine,

On Mon, 2 Jun 2014 02:21:02 -0700
Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Adds SMP support for Berlin SoCs. Secondary CPUs are reseted, then
> execute the instruction we put in the reset exception register, setti=
ng
> the pc at the address contained in the software reset address registe=
r,
> which is the physical address of the Berlin secondary startup.
>=20
> This implementation avoid using the pen lock mechanism.
>=20
> Signed-off-by: Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
>
> ---
>  arch/arm/mach-berlin/Kconfig   |  3 ++
>  arch/arm/mach-berlin/Makefile  |  3 +-
>  arch/arm/mach-berlin/headsmp.S | 30 +++++++++++++
>  arch/arm/mach-berlin/platsmp.c | 99
> ++++++++++++++++++++++++++++++++++++++++++ 4 files changed, 134
> insertions(+), 1 deletion(-) create mode 100644
> arch/arm/mach-berlin/headsmp.S create mode 100644
> arch/arm/mach-berlin/platsmp.c
>=20
> diff --git a/arch/arm/mach-berlin/Kconfig b/arch/arm/mach-berlin/Kcon=
fig
> index d3c5f14dc142..e3733692f67a 100644
> --- a/arch/arm/mach-berlin/Kconfig
> +++ b/arch/arm/mach-berlin/Kconfig
> @@ -4,6 +4,7 @@ config ARCH_BERLIN
>  	select GENERIC_IRQ_CHIP
>  	select DW_APB_ICTL
>  	select DW_APB_TIMER_OF
> +	select SMP
> =20
>  if ARCH_BERLIN
> =20
> @@ -13,6 +14,7 @@ config MACH_BERLIN_BG2
>  	bool "Marvell Armada 1500 (BG2)"
>  	select CACHE_L2X0
>  	select CPU_PJ4B
> +	select HAVE_ARM_SCU if SMP
>  	select HAVE_ARM_TWD if SMP
> =20
>  config MACH_BERLIN_BG2CD
> @@ -24,6 +26,7 @@ config MACH_BERLIN_BG2Q
>  	bool "Marvell Armada 1500 Pro (BG2-Q)"
>  	select CACHE_L2X0
>  	select CPU_V7
> +	select HAVE_ARM_SCU if SMP
>  	select HAVE_ARM_TWD if SMP
>  	select HAVE_SMP
> =20
> diff --git a/arch/arm/mach-berlin/Makefile b/arch/arm/mach-berlin/Mak=
efile
> index ab69fe956f49..c0719ecd1890 100644
> --- a/arch/arm/mach-berlin/Makefile
> +++ b/arch/arm/mach-berlin/Makefile
> @@ -1 +1,2 @@
> -obj-y +=3D berlin.o
> +obj-y			+=3D berlin.o
> +obj-$(CONFIG_SMP)	+=3D headsmp.o platsmp.o
> diff --git a/arch/arm/mach-berlin/headsmp.S b/arch/arm/mach-berlin/he=
adsmp.S
> new file mode 100644
> index 000000000000..d295b5185598
> --- /dev/null
> +++ b/arch/arm/mach-berlin/headsmp.S
> @@ -0,0 +1,30 @@
> +/*
> + * Copyright (C) 2014 Marvell Technology Group Ltd.
> + *
> + * Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/linkage.h>
> +#include <linux/init.h>
> +#include <asm/assembler.h>
> +
> +ENTRY(berlin_secondary_startup)
> + ARM_BE8(setend be)
> +	bl	v7_invalidate_l1
> +	b       secondary_startup
> +ENDPROC(berlin_secondary_startup)
> +
> +/*
> + * If the following instruction is set in the reset exception regist=
er,
> CPUs
> + * will fetch the value of the software reset address register when =
being
> + * reseted.
> + */
> +.global boot_inst
> +boot_inst:
> +	ldr	pc, [pc, #140]
> +
> +	.align
> diff --git a/arch/arm/mach-berlin/platsmp.c b/arch/arm/mach-berlin/pl=
atsmp.c
> new file mode 100644
> index 000000000000..c04c90b81ae3
> --- /dev/null
> +++ b/arch/arm/mach-berlin/platsmp.c
> @@ -0,0 +1,99 @@
> +/*
> + * Copyright (C) 2014 Marvell Technology Group Ltd.
> + *
> + * Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/delay.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +
> +#include <asm/cacheflush.h>
> +#include <asm/smp_plat.h>
> +#include <asm/smp_scu.h>
> +
> +#define CPU_RESET		0x00
> +
> +#define RESET_VECT		0x00
> +#define SW_RESET_ADDR		0x94
> +
> +extern void berlin_secondary_startup(void);
> +extern u32 boot_inst;
> +
> +static void __iomem *cpu_ctrl;
> +
> +static inline void berlin_reset_cpu(unsigned int cpu)
> +{
> +	u32 val;
> +
> +	val =3D readl(cpu_ctrl + CPU_RESET);
> +	val |=3D BIT(cpu_logical_map(cpu));
> +	writel(val, cpu_ctrl + CPU_RESET);

"writel(BIT(cpu_logical_map(cpu)), cpu_ctrl + CPU_RESET)" is enough.
we don't need to read and modify, because we writing 0 has no any effec=
t.

> +}
> +
> +static int berlin_boot_secondary(unsigned int cpu, struct task_struc=
t
> *idle) +{
> +	if (!cpu_ctrl)
> +		return -EFAULT;
> +
> +	/*
> +	 * Reset the CPU, making it to execute the instruction in the reset
> +	 * exception register.
> +	 */
> +	berlin_reset_cpu(cpu);
> +
> +	return 0;
> +}
> +
> +static void __init berlin_smp_prepare_cpus(unsigned int max_cpus)
> +{
> +	struct device_node *np;
> +	void __iomem *scu_base;
> +	void __iomem *vectors_base;
> +
> +	np =3D of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
> +	scu_base =3D of_iomap(np, 0);
> +	of_node_put(np);
> +	if (!scu_base)
> +		return;
> +
> +	np =3D of_find_compatible_node(NULL, NULL,
> "marvell,berlin-cpu-ctrl");
> +	cpu_ctrl =3D of_iomap(np, 0);
> +	of_node_put(np);
> +	if (!cpu_ctrl)
> +		goto unmap_scu;
> +
> +	vectors_base =3D ioremap(CONFIG_VECTORS_BASE, SZ_32K);
> +	if (!vectors_base)
> +		goto unmap_scu;
> +
> +	scu_enable(scu_base);
> +	flush_cache_all();
> +
> +	/*
> +	 * Write the first instruction the CPU will execute after being
> reseted
> +	 * in the reset exception register.
> +	 */
> +	writel(boot_inst, vectors_base + RESET_VECT);

Is it better to let bootloader/firmware handle this writing. Then, we c=
an
also remove the tricky boot_inst in headsmp.S.

Many thanks for this patch,
Jisheng

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
