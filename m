From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] arm: exynos: Add MCPM call-back functions
Date: Tue, 22 Apr 2014 13:21:18 +0200
Message-ID: <535650AE.90501@linaro.org>
References: <1397239311-27717-6-git-send-email-a.kesavan@samsung.com> <1398147435-3122-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398147435-3122-1-git-send-email-a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Dave.Martin-5wv7dgnIgG8@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/22/2014 08:17 AM, Abhilash Kesavan wrote:
> Add machine-dependent MCPM call-backs for Exynos5420. These are used
> to power up/down the secondary CPUs during boot, shutdown, s2r and
> switching.
>
> Signed-off-by: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Inderpal Singh <inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>   arch/arm/mach-exynos/Kconfig       |    8 +
>   arch/arm/mach-exynos/Makefile      |    2 +
>   arch/arm/mach-exynos/mcpm-exynos.c |  345 +++++++++++++++++++++++++=
+++++++++++
>   arch/arm/mach-exynos/regs-pmu.h    |    2 +
>   4 files changed, 357 insertions(+)
>   create mode 100644 arch/arm/mach-exynos/mcpm-exynos.c
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kcon=
fig
> index fc8bf18..1602abc 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -110,4 +110,12 @@ config SOC_EXYNOS5440
>
>   endmenu
>
> +config EXYNOS5420_MCPM
> +	bool "Exynos5420 Multi-Cluster PM support"
> +	depends on MCPM && SOC_EXYNOS5420
> +	select ARM_CCI
> +	help
> +	  This is needed to provide CPU and cluster power management
> +	  on Exynos5420 implementing big.LITTLE.
> +
>   endif
> diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Mak=
efile
> index a656dbe..01bc9b9 100644
> --- a/arch/arm/mach-exynos/Makefile
> +++ b/arch/arm/mach-exynos/Makefile
> @@ -29,3 +29,5 @@ obj-$(CONFIG_ARCH_EXYNOS)	+=3D firmware.o
>
>   plus_sec :=3D $(call as-instr,.arch_extension sec,+sec)
>   AFLAGS_exynos-smc.o		:=3D-Wa,-march=3Darmv7-a$(plus_sec)
> +
> +obj-$(CONFIG_EXYNOS5420_MCPM)	+=3D mcpm-exynos.o
> diff --git a/arch/arm/mach-exynos/mcpm-exynos.c b/arch/arm/mach-exyno=
s/mcpm-exynos.c
> new file mode 100644
> index 0000000..49b9031
> --- /dev/null
> +++ b/arch/arm/mach-exynos/mcpm-exynos.c
> @@ -0,0 +1,345 @@
> +/*
> + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * arch/arm/mach-exynos/mcpm-exynos.c
> + *
> + * Based on arch/arm/mach-vexpress/dcscb.c
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/io.h>
> +#include <linux/spinlock.h>
> +#include <linux/uaccess.h>
> +#include <linux/miscdevice.h>
> +#include <linux/fs.h>
> +#include <linux/delay.h>
> +#include <linux/arm-cci.h>
> +
> +#include <asm/mcpm.h>
> +#include <asm/cputype.h>
> +#include <asm/cp15.h>
> +
> +#include <plat/cpu.h>
> +#include "regs-pmu.h"
> +
> +#define EXYNOS5420_CPUS_PER_CLUSTER	4
> +#define EXYNOS5420_NR_CLUSTERS		2
> +
> +/* Secondary CPU entry point */
> +#define REG_ENTRY_ADDR		(S5P_VA_SYSRAM_NS + 0x1C)
> +
> +#define EXYNOS_CORE_LOCAL_PWR_EN		0x3
> +#define EXYNOS_CORE_LOCAL_PWR_DIS		0x0
>
> +#define EXYNOS_ARM_COMMON_CONFIGURATION		S5P_PMUREG(0x2500)
> +#define EXYNOS_ARM_L2_CONFIGURATION		S5P_PMUREG(0x2600)
> +
> +#define EXYNOS_ARM_CORE_CONFIGURATION(_nr)	\
> +			(S5P_ARM_CORE0_CONFIGURATION + ((_nr) * 0x80))
> +#define EXYNOS_ARM_CORE_STATUS(_nr)		\
> +			(S5P_ARM_CORE0_STATUS + ((_nr) * 0x80))
> +
> +#define EXYNOS_COMMON_CONFIGURATION(_nr)	\
> +			(EXYNOS_ARM_COMMON_CONFIGURATION + ((_nr) * 0x80))
> +#define EXYNOS_COMMON_STATUS(_nr)		\
> +			(EXYNOS_COMMON_CONFIGURATION(_nr) + 0x4)
> +
> +#define EXYNOS_L2_CONFIGURATION(_nr)		\
> +			(EXYNOS_ARM_L2_CONFIGURATION + ((_nr) * 0x80))
> +#define EXYNOS_L2_STATUS(_nr)			\
> +			(EXYNOS_L2_CONFIGURATION(_nr) + 0x4)
> +

Is it possible to share the definition of those macros with the rest of=
=20
the code via functions, so they can be re-used for the other sub-system=
s=20
? eg: https://patches.linaro.org/27798/

> +/*
> + * The common v7_exit_coherency_flush API could not be used because =
of the
> + * Erratum 799270 workaround. This macro is the same as the common o=
ne (in
> + * arch/arm/include/asm/cacheflush.h) except for the erratum handlin=
g.
> + */
> +#define exynos_v7_exit_coherency_flush(level) \
> +	asm volatile( \
> +	"stmfd	sp!, {fp, ip}\n\t"\
> +	"mrc	p15, 0, r0, c1, c0, 0	@ get SCTLR\n\t" \
> +	"bic	r0, r0, #"__stringify(CR_C)"\n\t" \
> +	"mcr	p15, 0, r0, c1, c0, 0	@ set SCTLR\n\t" \
> +	"isb\n\t"\
> +	"bl	v7_flush_dcache_"__stringify(level)"\n\t" \
> +	"clrex\n\t"\
> +	"mrc	p15, 0, r0, c1, c0, 1	@ get ACTLR\n\t" \
> +	"bic	r0, r0, #(1 << 6)	@ disable local coherency\n\t" \
> +	/* Dummy Load of a device register to avoid Erratum 799270 */ \

Wouldn't make sense to add the erratum in the Kconfig and re-use it in=20
the generic v7_exit_coherency_flush macro instead of redefining it ?

> +	"ldr	r4, [%0]\n\t" \
> +	"and	r4, r4, #0\n\t" \
> +	"orr	r0, r0, r4\n\t" \
> +	"mcr	p15, 0, r0, c1, c0, 1	@ set ACTLR\n\t" \
> +	"isb\n\t" \
> +	"dsb\n\t" \
> +	"ldmfd	sp!, {fp, ip}" \
> +	: \
> +	: "Ir" (S5P_INFORM0) \
> +	: "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7", \
> +	  "r9", "r10", "lr", "memory")



> +/*
> + * We can't use regular spinlocks. In the switcher case, it is possi=
ble
> + * for an outbound CPU to call power_down() after its inbound counte=
rpart
> + * is already live using the same logical CPU number which trips loc=
kdep
> + * debugging.
> + */
> +static arch_spinlock_t exynos_mcpm_lock =3D __ARCH_SPIN_LOCK_UNLOCKE=
D;
> +static int
> +cpu_use_count[EXYNOS5420_CPUS_PER_CLUSTER][EXYNOS5420_NR_CLUSTERS];
> +
> +static bool exynos_core_power_state(unsigned int cpu, unsigned int c=
luster)
> +{
> +	unsigned int val;
> +	unsigned int cpunr =3D cpu + (cluster * EXYNOS5420_CPUS_PER_CLUSTER=
);
> +
> +	val =3D __raw_readl(EXYNOS_ARM_CORE_STATUS(cpunr)) &
> +				EXYNOS_CORE_LOCAL_PWR_EN;
> +	return !!val;
> +}
> +
> +static void exynos_core_power_control(unsigned int cpu, unsigned int=
 cluster,
> +						int enable)
> +{
> +	unsigned int val =3D EXYNOS_CORE_LOCAL_PWR_DIS;
> +	unsigned int cpunr =3D cpu + (cluster * EXYNOS5420_CPUS_PER_CLUSTER=
);
> +
> +	if (exynos_core_power_state(cpu, cluster) =3D=3D enable)
> +		return;
> +
> +	if (enable)
> +		val =3D EXYNOS_CORE_LOCAL_PWR_EN;
> +	__raw_writel(val, EXYNOS_ARM_CORE_CONFIGURATION(cpunr));
> +}

Same comment as above about sharing these functions.

Shouldn't these functions to be reused by hotplug ?

> +static void exynos_cluster_power_control(unsigned int cluster, int e=
nable)
> +{
> +	unsigned long timeout =3D jiffies + msecs_to_jiffies(20);
> +	unsigned int status, val =3D EXYNOS_CORE_LOCAL_PWR_DIS;
> +
> +	if (enable)
> +		val =3D EXYNOS_CORE_LOCAL_PWR_EN;
> +
> +	status =3D __raw_readl(EXYNOS_COMMON_STATUS(cluster));
> +	if ((status & EXYNOS_CORE_LOCAL_PWR_EN) =3D=3D val)
> +		return;
> +
> +	__raw_writel(val, EXYNOS_COMMON_CONFIGURATION(cluster));
> +	/* Wait until cluster power control is applied */
> +	while (time_before(jiffies, timeout)) {
> +		status =3D __raw_readl(EXYNOS_COMMON_STATUS(cluster));
> +
> +		if ((status & EXYNOS_CORE_LOCAL_PWR_EN) =3D=3D val)
> +			return;
> +
> +		cpu_relax();
> +	}
> +	pr_warn("timed out waiting for cluster %u to power %s\n", cluster,
> +		enable ? "on" : "off");
> +}
> +
> +static int exynos_power_up(unsigned int cpu, unsigned int cluster)
> +{
> +	pr_debug("%s: cpu %u cluster %u\n", __func__, cpu, cluster);
> +	if (cpu >=3D EXYNOS5420_CPUS_PER_CLUSTER ||
> +		cluster >=3D EXYNOS5420_NR_CLUSTERS)
> +		return -EINVAL;
> +
> +	/*
> +	 * Since this is called with IRQs enabled, and no arch_spin_lock_ir=
q
> +	 * variant exists, we need to disable IRQs manually here.
> +	 */
> +	local_irq_disable();
> +	arch_spin_lock(&exynos_mcpm_lock);
> +
> +	cpu_use_count[cpu][cluster]++;
> +	if (cpu_use_count[cpu][cluster] =3D=3D 1) {
> +		bool was_cluster_down =3D
> +			__mcpm_cluster_state(cluster) =3D=3D CLUSTER_DOWN;
> +
> +		/*
> +		 * Turn on the cluster (L2/COMMON) and then power on the cores.
> +		 * TODO: Turn off the clusters when all cores in the cluster
> +		 * are down to achieve significant power savings.
> +		 */
> +		if (was_cluster_down)
> +			exynos_cluster_power_control(cluster, 1);
> +		exynos_core_power_control(cpu, cluster, 1);
> +
> +		/* CPU should be powered up there */
> +		/* Also setup Cluster Power Sequence here */
> +	} else if (cpu_use_count[cpu][cluster] !=3D 2) {
> +		/*
> +		 * The only possible values are:
> +		 * 0 =3D CPU down
> +		 * 1 =3D CPU (still) up
> +		 * 2 =3D CPU requested to be up before it had a chance
> +		 *     to actually make itself down.
> +		 * Any other value is a bug.
> +		 */
> +		BUG();
> +	}
> +
> +	arch_spin_unlock(&exynos_mcpm_lock);
> +	local_irq_enable();
> +
> +	return 0;
> +}
> +
> +static void exynos_power_down(void)
> +{
> +	unsigned int mpidr, cpu, cluster, cpumask;
> +	bool last_man =3D false, skip_wfi =3D false;
> +
> +	mpidr =3D read_cpuid_mpidr();
> +	cpu =3D MPIDR_AFFINITY_LEVEL(mpidr, 0);
> +	cluster =3D MPIDR_AFFINITY_LEVEL(mpidr, 1);
> +	cpumask =3D (1 << cpu);

This variable is not used.

> +
> +	pr_debug("%s: cpu %u cluster %u\n", __func__, cpu, cluster);
> +	BUG_ON(cpu >=3D EXYNOS5420_CPUS_PER_CLUSTER ||
> +			cluster >=3D EXYNOS5420_NR_CLUSTERS);
> +
> +	__mcpm_cpu_going_down(cpu, cluster);
> +
> +	arch_spin_lock(&exynos_mcpm_lock);
> +	BUG_ON(__mcpm_cluster_state(cluster) !=3D CLUSTER_UP);
> +	cpu_use_count[cpu][cluster]--;
> +	if (cpu_use_count[cpu][cluster] =3D=3D 0) {
> +		int cnt =3D 0, i;
> +
> +		exynos_core_power_control(cpu, cluster, 0);
> +		for (i =3D 0; i < EXYNOS5420_CPUS_PER_CLUSTER; i++)
> +			cnt +=3D cpu_use_count[i][cluster];
> +		if (cnt =3D=3D 0)
> +			last_man =3D true;
> +	} else if (cpu_use_count[cpu][cluster] =3D=3D 1) {
> +		/*
> +		 * A power_up request went ahead of us.
> +		 * Even if we do not want to shut this CPU down,
> +		 * the caller expects a certain state as if the WFI
> +		 * was aborted.  So let's continue with cache cleaning.
> +		 */
> +		skip_wfi =3D true;
> +	} else {
> +		BUG();
> +	}
> +
> +	if (last_man && __mcpm_outbound_enter_critical(cpu, cluster)) {
> +		arch_spin_unlock(&exynos_mcpm_lock);
> +
> +		/* Flush all cache levels for this cluster. */
> +		exynos_v7_exit_coherency_flush(all);
> +
> +		/*
> +		 * Disable cluster-level coherency by masking
> +		 * incoming snoops and DVM messages:
> +		 */
> +		cci_disable_port_by_cpu(mpidr);
> +
> +		__mcpm_outbound_leave_critical(cluster, CLUSTER_DOWN);
> +	} else {
> +		arch_spin_unlock(&exynos_mcpm_lock);
> +
> +		/* Disable and flush the local CPU cache. */
> +		exynos_v7_exit_coherency_flush(louis);
> +	}
> +
> +	__mcpm_cpu_down(cpu, cluster);
> +
> +	/* Now we are prepared for power-down, do it: */
> +	if (!skip_wfi)
> +		wfi();
> +
> +	/* Not dead at this point?  Let our caller cope. */
> +}
> +
> +static int exynos_power_down_finish(unsigned int cpu, unsigned int c=
luster)
> +{
> +	pr_debug("%s: cpu %u cluster %u\n", __func__, cpu, cluster);
> +	BUG_ON(cpu >=3D EXYNOS5420_CPUS_PER_CLUSTER ||
> +			cluster >=3D EXYNOS5420_NR_CLUSTERS);
> +
> +	/* Wait for the core state to be OFF */
> +	while (exynos_core_power_state(cpu, cluster) !=3D 0x0)
> +		;

As this is a potential infinite loop, a timeout may be desirable, no ?

> +
> +	return 0; /* success: the CPU is halted */
> +}
> +
> +static const struct mcpm_platform_ops exynos_power_ops =3D {
> +	.power_up		=3D exynos_power_up,
> +	.power_down		=3D exynos_power_down,
> +	.power_down_finish	=3D exynos_power_down_finish,
> +};
> +
> +static void __init exynos_mcpm_usage_count_init(void)
> +{
> +	unsigned int mpidr, cpu, cluster;
> +
> +	mpidr =3D read_cpuid_mpidr();
> +	cpu =3D MPIDR_AFFINITY_LEVEL(mpidr, 0);
> +	cluster =3D MPIDR_AFFINITY_LEVEL(mpidr, 1);
> +
> +	pr_debug("%s: cpu %u cluster %u\n", __func__, cpu, cluster);
> +	BUG_ON(cpu >=3D EXYNOS5420_CPUS_PER_CLUSTER  ||
> +			cluster >=3D EXYNOS5420_NR_CLUSTERS);
> +
> +	cpu_use_count[cpu][cluster] =3D 1;
> +}
> +
> +/*
> + * Enable cluster-level coherency, in preparation for turning on the=
 MMU.
> + */
> +static void __naked exynos_pm_power_up_setup(unsigned int affinity_l=
evel)
> +{
> +	asm volatile ("\n"
> +	"cmp	r0, #1\n"
> +	"bxne	lr\n"
> +	"b	cci_enable_port_for_self");
> +}
> +
> +static int __init exynos_mcpm_init(void)
> +{
> +	int ret =3D 0;
> +
> +	if (!soc_is_exynos5420())
> +		return -ENODEV;
> +
> +	if (!cci_probed())
> +		return -ENODEV;
> +
> +	/*
> +	 * To increase the stability of KFC reset we need to program
> +	 * the PMU SPARE3 register
> +	 */
> +	__raw_writel(EXYNOS5420_SWRESET_KFC_SEL, S5P_PMU_SPARE3);
> +
> +	exynos_mcpm_usage_count_init();
> +
> +	ret =3D mcpm_platform_register(&exynos_power_ops);
> +	if (!ret)
> +		ret =3D mcpm_sync_init(exynos_pm_power_up_setup);
> +	if (ret)
> +		return ret;
> +
> +	mcpm_smp_set_ops();
> +
> +	pr_info("Exynos MCPM support installed\n");
> +
> +	/*
> +	 * Future entries into the kernel can now go
> +	 * through the cluster entry vectors.
> +	 */
> +	__raw_writel(virt_to_phys(mcpm_entry_point),
> +		REG_ENTRY_ADDR);
> +
> +	return ret;
> +}
> +
> +early_initcall(exynos_mcpm_init);
> diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/r=
egs-pmu.h
> index cfbfc575..43fe7a0 100644
> --- a/arch/arm/mach-exynos/regs-pmu.h
> +++ b/arch/arm/mach-exynos/regs-pmu.h
> @@ -38,6 +38,7 @@
>   #define S5P_INFORM5				S5P_PMUREG(0x0814)
>   #define S5P_INFORM6				S5P_PMUREG(0x0818)
>   #define S5P_INFORM7				S5P_PMUREG(0x081C)
> +#define S5P_PMU_SPARE3				S5P_PMUREG(0x090C)
>
>   #define EXYNOS_IROM_DATA2			S5P_PMUREG(0x0988)
>
> @@ -540,5 +541,6 @@
>   #define EXYNOS5420_KFC_USE_STANDBY_WFE3				(1 << 23)
>
>   #define DUR_WAIT_RESET				0xF
> +#define EXYNOS5420_SWRESET_KFC_SEL		0x3
>
>   #endif /* __ASM_ARCH_REGS_PMU_H */
>


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
