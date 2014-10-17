From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCHv5 6/6] ARM: imx: Add Freescale LS1021A SMP support
Date: Fri, 17 Oct 2014 14:27:18 +0200
Message-ID: <D5E3D48E-7425-4BA2-9AE9-59E46F410818@codeaurora.org>
References: <1413192963-11153-1-git-send-email-jingchang.lu@freescale.com> <1413192963-11153-7-git-send-email-jingchang.lu@freescale.com> <993EF472-33A7-48BD-A4CD-15B361D53365@codeaurora.org> <1e98bf0f1f2347ed8f02138816061cdc@BL2PR03MB467.namprd03.prod.outlook.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1e98bf0f1f2347ed8f02138816061cdc-AZ66ij2kwab4MB1ZSnT4iOO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Oct 17, 2014, at 12:10 PM, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>=
 wrote:

>=20
>=20
>> -----Original Message-----
>> From: Kumar Gala [mailto:galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org]
>> Sent: Thursday, October 16, 2014 10:31 PM
>> To: Lu Jingchang-B35083
>> Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; devicetree-u79uwXL29Tb/PtFMR13I2A@public.gmane.org=
el.org;
>> Lu Jingchang-B35083; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; arnd@arnd=
b.de
>> Subject: Re: [PATCHv5 6/6] ARM: imx: Add Freescale LS1021A SMP suppo=
rt
>>=20
>>=20
>> On Oct 13, 2014, at 11:36 AM, Jingchang Lu <jingchang.lu@freescale.c=
om>
>> wrote:
>>=20
>>> From: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>>=20
>>> Freescale LS1021A SoCs deploy two cortex-A7 processors, this adds
>>> bring-up support for the secondary core.
>>>=20
>>> Signed-off-by: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>> ---
>>> arch/arm/mach-imx/Makefile       |  2 +-
>>> arch/arm/mach-imx/common.h       |  1 +
>>> arch/arm/mach-imx/mach-ls1021a.c |  1 +
>>> arch/arm/mach-imx/platsmp.c      | 32 +++++++++++++++++++++++++++++=
+++
>>> 4 files changed, 35 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/arch/arm/mach-imx/Makefile b/arch/arm/mach-imx/Makefil=
e
>>> index ce137bc..38d75e2 100644
>>> --- a/arch/arm/mach-imx/Makefile
>>> +++ b/arch/arm/mach-imx/Makefile
>>> @@ -89,7 +89,7 @@ obj-$(CONFIG_HAVE_IMX_ANATOP) +=3D anatop.o
>>> obj-$(CONFIG_HAVE_IMX_GPC) +=3D gpc.o
>>> obj-$(CONFIG_HAVE_IMX_MMDC) +=3D mmdc.o
>>> obj-$(CONFIG_HAVE_IMX_SRC) +=3D src.o
>>> -ifdef CONFIG_SOC_IMX6
>>> +ifneq ($(CONFIG_SOC_IMX6)$(CONFIG_SOC_LS1021A),)
>>> AFLAGS_headsmp.o :=3D-Wa,-march=3Darmv7-a
>>> obj-$(CONFIG_SMP) +=3D headsmp.o platsmp.o
>>> obj-$(CONFIG_HOTPLUG_CPU) +=3D hotplug.o diff --git
>>> a/arch/arm/mach-imx/common.h b/arch/arm/mach-imx/common.h index
>>> 1dabf43..c473ca5 100644
>>> --- a/arch/arm/mach-imx/common.h
>>> +++ b/arch/arm/mach-imx/common.h
>>> @@ -157,5 +157,6 @@ static inline void imx_init_l2cache(void) {}
>>> #endif
>>>=20
>>> extern struct smp_operations imx_smp_ops;
>>> +extern struct smp_operations ls1021a_smp_ops;
>>>=20
>>> #endif
>>> diff --git a/arch/arm/mach-imx/mach-ls1021a.c
>>> b/arch/arm/mach-imx/mach-ls1021a.c
>>> index 9d2034b..b89c858 100644
>>> --- a/arch/arm/mach-imx/mach-ls1021a.c
>>> +++ b/arch/arm/mach-imx/mach-ls1021a.c
>>> @@ -17,5 +17,6 @@ static const char * const ls1021a_dt_compat[]
>>> __initconst =3D { };
>>>=20
>>> DT_MACHINE_START(LS1021A, "Freescale LS1021A")
>>> +	.smp		=3D smp_ops(ls1021a_smp_ops),
>>> 	.dt_compat	=3D ls1021a_dt_compat,
>>> MACHINE_END
>>> diff --git a/arch/arm/mach-imx/platsmp.c b/arch/arm/mach-imx/platsm=
p.c
>>> index 771bd25..69b87ca 100644
>>> --- a/arch/arm/mach-imx/platsmp.c
>>> +++ b/arch/arm/mach-imx/platsmp.c
>>> @@ -16,6 +16,8 @@
>>> #include <asm/page.h>
>>> #include <asm/smp_scu.h>
>>> #include <asm/mach/map.h>
>>> +#include <linux/of_address.h>
>>> +#include <linux/of.h>
>>>=20
>>> #include "common.h"
>>> #include "hardware.h"
>>> @@ -94,3 +96,33 @@ struct smp_operations  imx_smp_ops __initdata =3D=
 {
>>> 	.cpu_kill		=3D imx_cpu_kill,
>>> #endif
>>> };
>>> +
>>> +#define DCFG_CCSR_SCRATCHRW1	0x200
>>> +
>>> +static int ls1021a_boot_secondary(unsigned int cpu, struct
>>> +task_struct *idle) {
>>> +	arch_send_wakeup_ipi_mask(cpumask_of(cpu));
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void __init ls1021a_smp_prepare_cpus(unsigned int max_cpus)=
 {
>>> +	struct device_node *np;
>>> +	void __iomem *dcfg_base;
>>> +	unsigned long paddr;
>>> +
>>> +	np =3D of_find_compatible_node(NULL, NULL, "fsl,ls1021a-dcfg");
>>> +	dcfg_base =3D of_iomap(np, 0);
>>> +	BUG_ON(!dcfg_base);
>>> +
>>> +	paddr =3D virt_to_phys(secondary_startup);
>>> +	writel_relaxed(cpu_to_be32(paddr), dcfg_base +
>>> +DCFG_CCSR_SCRATCHRW1);
>>> +
>>=20
>> This seems odd, why are we writing the startup address to
>> DCFG_CCSR_SCRATCHRW1?
> It is the secondary cpu's executing address for smp kernel image,=20
> the secondary cpu will jump to this address after wakeup during
> the smp initialization. Thanks.

Is that a convention spec=92d by HW or SW?

- k
--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
