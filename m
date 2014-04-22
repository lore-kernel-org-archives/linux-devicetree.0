From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] arm: exynos: Add MCPM call-back functions
Date: Tue, 22 Apr 2014 21:21:24 +0200
Message-ID: <5356C134.8070707@linaro.org>
References: <1397239311-27717-6-git-send-email-a.kesavan@samsung.com> <1398147435-3122-1-git-send-email-a.kesavan@samsung.com> <535650AE.90501@linaro.org> <alpine.LFD.2.11.1404221129150.980@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.11.1404221129150.980-fMhRO7WWcppj+hNMo8g0rg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Dave.Martin-5wv7dgnIgG8@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/22/2014 05:40 PM, Nicolas Pitre wrote:
> On Tue, 22 Apr 2014, Daniel Lezcano wrote:
>
>> On 04/22/2014 08:17 AM, Abhilash Kesavan wrote:
>>> Add machine-dependent MCPM call-backs for Exynos5420. These are use=
d
>>> to power up/down the secondary CPUs during boot, shutdown, s2r and
>>> switching.
>>>
>>> Signed-off-by: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Signed-off-by: Inderpal Singh <inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>>    arch/arm/mach-exynos/Kconfig       |    8 +
>>>    arch/arm/mach-exynos/Makefile      |    2 +
>>>    arch/arm/mach-exynos/mcpm-exynos.c |  345
>>>    ++++++++++++++++++++++++++++++++++++
>>>    arch/arm/mach-exynos/regs-pmu.h    |    2 +
>>>    4 files changed, 357 insertions(+)
>>>    create mode 100644 arch/arm/mach-exynos/mcpm-exynos.c
>>>
>>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kc=
onfig
>>> index fc8bf18..1602abc 100644
>>> --- a/arch/arm/mach-exynos/Kconfig
>>> +++ b/arch/arm/mach-exynos/Kconfig
>>> @@ -110,4 +110,12 @@ config SOC_EXYNOS5440
>>>
>>>    endmenu
>>>
>>> +config EXYNOS5420_MCPM
>>> +	bool "Exynos5420 Multi-Cluster PM support"
>>> +	depends on MCPM && SOC_EXYNOS5420
>>> +	select ARM_CCI
>>> +	help
>>> +	  This is needed to provide CPU and cluster power management
>>> +	  on Exynos5420 implementing big.LITTLE.
>>> +
>>>    endif
>>> diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/M=
akefile
>>> index a656dbe..01bc9b9 100644
>>> --- a/arch/arm/mach-exynos/Makefile
>>> +++ b/arch/arm/mach-exynos/Makefile
>>> @@ -29,3 +29,5 @@ obj-$(CONFIG_ARCH_EXYNOS)	+=3D firmware.o
>>>
>>>    plus_sec :=3D $(call as-instr,.arch_extension sec,+sec)
>>>    AFLAGS_exynos-smc.o		:=3D-Wa,-march=3Darmv7-a$(plus_sec)
>>> +
>>> +obj-$(CONFIG_EXYNOS5420_MCPM)	+=3D mcpm-exynos.o
>>> diff --git a/arch/arm/mach-exynos/mcpm-exynos.c
>>> b/arch/arm/mach-exynos/mcpm-exynos.c
>>> new file mode 100644
>>> index 0000000..49b9031
>>> --- /dev/null
>>> +++ b/arch/arm/mach-exynos/mcpm-exynos.c
>>> @@ -0,0 +1,345 @@
>>> +/*
>>> + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
>>> + *		http://www.samsung.com
>>> + *
>>> + * arch/arm/mach-exynos/mcpm-exynos.c
>>> + *
>>> + * Based on arch/arm/mach-vexpress/dcscb.c
>>> + *
>>> + * This program is free software; you can redistribute it and/or m=
odify
>>> + * it under the terms of the GNU General Public License version 2 =
as
>>> + * published by the Free Software Foundation.
>>> + */
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <linux/io.h>
>>> +#include <linux/spinlock.h>
>>> +#include <linux/uaccess.h>
>>> +#include <linux/miscdevice.h>
>>> +#include <linux/fs.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/arm-cci.h>
>>> +
>>> +#include <asm/mcpm.h>
>>> +#include <asm/cputype.h>
>>> +#include <asm/cp15.h>
>>> +
>>> +#include <plat/cpu.h>
>>> +#include "regs-pmu.h"
>>> +
>>> +#define EXYNOS5420_CPUS_PER_CLUSTER	4
>>> +#define EXYNOS5420_NR_CLUSTERS		2
>>> +
>>> +/* Secondary CPU entry point */
>>> +#define REG_ENTRY_ADDR		(S5P_VA_SYSRAM_NS + 0x1C)
>>> +
>>> +#define EXYNOS_CORE_LOCAL_PWR_EN		0x3
>>> +#define EXYNOS_CORE_LOCAL_PWR_DIS		0x0
>>>
>>> +#define EXYNOS_ARM_COMMON_CONFIGURATION		S5P_PMUREG(0x2500)
>>> +#define EXYNOS_ARM_L2_CONFIGURATION		S5P_PMUREG(0x2600)
>>> +
>>> +#define EXYNOS_ARM_CORE_CONFIGURATION(_nr)	\
>>> +			(S5P_ARM_CORE0_CONFIGURATION + ((_nr) * 0x80))
>>> +#define EXYNOS_ARM_CORE_STATUS(_nr)		\
>>> +			(S5P_ARM_CORE0_STATUS + ((_nr) * 0x80))
>>> +
>>> +#define EXYNOS_COMMON_CONFIGURATION(_nr)	\
>>> +			(EXYNOS_ARM_COMMON_CONFIGURATION + ((_nr) * 0x80))
>>> +#define EXYNOS_COMMON_STATUS(_nr)		\
>>> +			(EXYNOS_COMMON_CONFIGURATION(_nr) + 0x4)
>>> +
>>> +#define EXYNOS_L2_CONFIGURATION(_nr)		\
>>> +			(EXYNOS_ARM_L2_CONFIGURATION + ((_nr) * 0x80))
>>> +#define EXYNOS_L2_STATUS(_nr)			\
>>> +			(EXYNOS_L2_CONFIGURATION(_nr) + 0x4)
>>> +
>>
>> Is it possible to share the definition of those macros with the rest=
 of the
>> code via functions, so they can be re-used for the other sub-systems=
 ? eg:
>> https://patches.linaro.org/27798/
>
> This patch is incompatible with MCPM.  A proper idle driver on top of
> MCPM is required instead.  That's the role of MCPM i.e. arbitrate pow=
er
> requests between different requestors, including hotplug, cpuidle, an=
d
> the b.L switcher in some cases.

The driver is resulting from some empirical testing, so I am not sure=20
yet MCPM will work. I will give it a try and I will be happy to convert=
=20
to MCPM if possible.

>>> +/*
>>> + * The common v7_exit_coherency_flush API could not be used becaus=
e of the
>>> + * Erratum 799270 workaround. This macro is the same as the common=
 one (in
>>> + * arch/arm/include/asm/cacheflush.h) except for the erratum handl=
ing.
>>> + */
>>> +#define exynos_v7_exit_coherency_flush(level) \
>>> +	asm volatile( \
>>> +	"stmfd	sp!, {fp, ip}\n\t"\
>>> +	"mrc	p15, 0, r0, c1, c0, 0	@ get SCTLR\n\t" \
>>> +	"bic	r0, r0, #"__stringify(CR_C)"\n\t" \
>>> +	"mcr	p15, 0, r0, c1, c0, 0	@ set SCTLR\n\t" \
>>> +	"isb\n\t"\
>>> +	"bl	v7_flush_dcache_"__stringify(level)"\n\t" \
>>> +	"clrex\n\t"\
>>> +	"mrc	p15, 0, r0, c1, c0, 1	@ get ACTLR\n\t" \
>>> +	"bic	r0, r0, #(1 << 6)	@ disable local coherency\n\t" \
>>> +	/* Dummy Load of a device register to avoid Erratum 799270 */ \
>>
>> Wouldn't make sense to add the erratum in the Kconfig and re-use it =
in the
>> generic v7_exit_coherency_flush macro instead of redefining it ?
>
> The implementation of the erratum (the dummy device register load) is
> platform specific I'm afraid.
>
> Is TC2 also concerned by this erratum, or is this Samsung specific?

Sounds like it is ARM Cortex-A15MP specific:

http://infocenter.arm.com/help/topic/com.arm.doc.epm028090/cortex_a15_m=
pcore_software_developers_errata_notice_r2_v12.pdf

Page 31.

>>> +	"ldr	r4, [%0]\n\t" \
>>> +	"and	r4, r4, #0\n\t" \
>>> +	"orr	r0, r0, r4\n\t" \
>>> +	"mcr	p15, 0, r0, c1, c0, 1	@ set ACTLR\n\t" \
>>> +	"isb\n\t" \
>>> +	"dsb\n\t" \
>>> +	"ldmfd	sp!, {fp, ip}" \
>>> +	: \
>>> +	: "Ir" (S5P_INFORM0) \
>>> +	: "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7", \
>>> +	  "r9", "r10", "lr", "memory")
>>
>>
>>
>>> +/*
>>> + * We can't use regular spinlocks. In the switcher case, it is pos=
sible
>>> + * for an outbound CPU to call power_down() after its inbound coun=
terpart
>>> + * is already live using the same logical CPU number which trips l=
ockdep
>>> + * debugging.
>>> + */
>>> +static arch_spinlock_t exynos_mcpm_lock =3D __ARCH_SPIN_LOCK_UNLOC=
KED;
>>> +static int
>>> +cpu_use_count[EXYNOS5420_CPUS_PER_CLUSTER][EXYNOS5420_NR_CLUSTERS]=
;
>>> +
>>> +static bool exynos_core_power_state(unsigned int cpu, unsigned int=
 cluster)
>>> +{
>>> +	unsigned int val;
>>> +	unsigned int cpunr =3D cpu + (cluster * EXYNOS5420_CPUS_PER_CLUST=
ER);
>>> +
>>> +	val =3D __raw_readl(EXYNOS_ARM_CORE_STATUS(cpunr)) &
>>> +				EXYNOS_CORE_LOCAL_PWR_EN;
>>> +	return !!val;
>>> +}
>>> +
>>> +static void exynos_core_power_control(unsigned int cpu, unsigned i=
nt
>>> cluster,
>>> +						int enable)
>>> +{
>>> +	unsigned int val =3D EXYNOS_CORE_LOCAL_PWR_DIS;
>>> +	unsigned int cpunr =3D cpu + (cluster * EXYNOS5420_CPUS_PER_CLUST=
ER);
>>> +
>>> +	if (exynos_core_power_state(cpu, cluster) =3D=3D enable)
>>> +		return;
>>> +
>>> +	if (enable)
>>> +		val =3D EXYNOS_CORE_LOCAL_PWR_EN;
>>> +	__raw_writel(val, EXYNOS_ARM_CORE_CONFIGURATION(cpunr));
>>> +}
>>
>> Same comment as above about sharing these functions.
>>
>> Shouldn't these functions to be reused by hotplug ?
>
> This _is_ hotplug.  Once this MCPM backend is registered, CPU hotplug=
 is
> automatically available.  See arch/arm/common/mcpm_platsmp.c.

Sorry, I think I was not clear. What I meant is : couldn't these macros=
=20
be converted to wrapper functions (powerdown, powerup, powerstate, etc=20
=2E..) and be generic for the entire EXYNOS arch, so the different sub=20
systems can reuse it (eg. hotplug.c) instead of defining macros +=20
read_raw + writel_raw all over the place (eg. hotplug.c + smp.c + mcpm =
[=20
+ exynos4 dual cpus for cpuidle ]).

Thanks

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
