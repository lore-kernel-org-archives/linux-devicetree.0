Return-Path: <SRS0=e4lG=AH=gmail.com=avifishman70@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170906080751.6773-2-brendanhiggins@google.com>
References: <20170906080751.6773-1-brendanhiggins@google.com> <20170906080751.6773-2-brendanhiggins@google.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Wed, 6 Sep 2017 23:27:56 +0300
Message-ID: <CAKKbWA7GUxbMaHsk4-42zE-ony6TSzv-960QWroK8yFrCB1atA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] arm: npcm: add basic support for Nuvoton BMCs
Content-Type: multipart/alternative; boundary="001a113f5b90e3503605588b2de1"
To: Brendan Higgins <brendanhiggins@google.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, tmaimon77@gmail.com, raltherr@google.com, f.fainelli@gmail.com, joel@jms.id.au, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

--001a113f5b90e3503605588b2de1
Content-Type: text/plain; charset="UTF-8"

2017-09-06 11:07 GMT+03:00 Brendan Higgins <brendanhiggins@google.com>:

> Adds basic support for the Nuvoton NPCM750 BMC.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  arch/arm/Kconfig             |  2 +
>  arch/arm/Makefile            |  1 +
>  arch/arm/mach-npcm/Kconfig   | 50 +++++++++++++++++++++++++
>  arch/arm/mach-npcm/Makefile  |  3 ++
>  arch/arm/mach-npcm/headsmp.S | 17 +++++++++
>  arch/arm/mach-npcm/npcm7xx.c | 34 +++++++++++++++++
>  arch/arm/mach-npcm/platsmp.c | 89 ++++++++++++++++++++++++++++++
> ++++++++++++++
>  7 files changed, 196 insertions(+)
>  create mode 100644 arch/arm/mach-npcm/Kconfig
>  create mode 100644 arch/arm/mach-npcm/Makefile
>  create mode 100644 arch/arm/mach-npcm/headsmp.S
>  create mode 100644 arch/arm/mach-npcm/npcm7xx.c
>  create mode 100644 arch/arm/mach-npcm/platsmp.c
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 61a0cb15067e..05543f1cfbde 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -782,6 +782,8 @@ source "arch/arm/mach-netx/Kconfig"
>
>  source "arch/arm/mach-nomadik/Kconfig"
>
> +source "arch/arm/mach-npcm/Kconfig"
> +
>  source "arch/arm/mach-nspire/Kconfig"
>
>  source "arch/arm/plat-omap/Kconfig"
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 47d3a1ab08d2..60ca50c7d762 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -191,6 +191,7 @@ machine-$(CONFIG_ARCH_MEDIATEK)             +=
> mediatek
>  machine-$(CONFIG_ARCH_MXS)             += mxs
>  machine-$(CONFIG_ARCH_NETX)            += netx
>  machine-$(CONFIG_ARCH_NOMADIK)         += nomadik
> +machine-$(CONFIG_ARCH_NPCM)            += npcm
>  machine-$(CONFIG_ARCH_NSPIRE)          += nspire
>  machine-$(CONFIG_ARCH_OXNAS)           += oxnas
>  machine-$(CONFIG_ARCH_OMAP1)           += omap1
> diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
> new file mode 100644
> index 000000000000..d47061855439
> --- /dev/null
> +++ b/arch/arm/mach-npcm/Kconfig
> @@ -0,0 +1,50 @@
> +menuconfig ARCH_NPCM
> +       bool "Nuvoton NPCM Architecture"
> +       select ARCH_REQUIRE_GPIOLIB
> +       select USE_OF
> +       select PINCTRL
> +       select PINCTRL_NPCM7XX
> +
> +if ARCH_NPCM
> +
> +comment "NPCMX50 CPU type"
> +
> +config CPU_NPCM750
> +       depends on ARCH_NPCM && ARCH_MULTI_V7
> +       bool "Support for NPCM750 BMC CPU (Poleg)"
> +       select CACHE_L2X0
> +       select CPU_V7
> +       select ARM_GIC
> +       select HAVE_SMP
> +       select SMP
> +       select SMP_ON_UP
> +       select HAVE_ARM_SCU
> +       select HAVE_ARM_TWD if SMP
> +       select ARM_ERRATA_458693
> +       select ARM_ERRATA_720789
> +       select ARM_ERRATA_742231
> +       select ARM_ERRATA_754322
> +       select ARM_ERRATA_764369
> +       select ARM_ERRATA_794072
> +       select PL310_ERRATA_588369
> +       select PL310_ERRATA_727915
> +       select USB_EHCI_ROOT_HUB_TT
> +       select USB_ARCH_HAS_HCD
> +       select USB_ARCH_HAS_EHCI
> +       select USB_EHCI_HCD
> +       select USB_ARCH_HAS_OHCI
> +       select USB_OHCI_HCD
> +       select USB
> +       select FIQ
> +       select CPU_USE_DOMAINS
> +       select GENERIC_CLOCKEVENTS
> +       select CLKDEV_LOOKUP
> +       select COMMON_CLK if OF
> +       select NPCM750_TIMER
> +       select MFD_SYSCON
> +       help
> +         Support for NPCM750 BMC CPU (Poleg).
> +
> +         Nuvoton NPCM750 BMC based on the Cortex A9.
> +
> +endif
> diff --git a/arch/arm/mach-npcm/Makefile b/arch/arm/mach-npcm/Makefile
> new file mode 100644
> index 000000000000..78416055b854
> --- /dev/null
> +++ b/arch/arm/mach-npcm/Makefile
> @@ -0,0 +1,3 @@
> +AFLAGS_headsmp.o               += -march=armv7-a
> +
> +obj-$(CONFIG_CPU_NPCM750)      += npcm7xx.o platsmp.o headsmp.o
> diff --git a/arch/arm/mach-npcm/headsmp.S b/arch/arm/mach-npcm/headsmp.S
> new file mode 100644
> index 000000000000..9fccbbd49ed4
> --- /dev/null
> +++ b/arch/arm/mach-npcm/headsmp.S
> @@ -0,0 +1,17 @@
> +/*
> + * Copyright 2017 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/linkage.h>
> +#include <linux/init.h>
> +#include <asm/assembler.h>
> +
> +ENTRY(npcm7xx_secondary_startup)
> +       safe_svcmode_maskall r0
>

I saw you  answered to Florian Fainelli that the BootRom is not starting
the secondary CPU in SVC mode. Are you sure? In our engineering npcm7xx
revision, Z1, the BootRom indeed started to run it in IRQ mode but we fixed
it in the production version, A1, (quite long time ago), I hope you didn't
get an EB with Z1 you can check that in BootBlock console print:
> ADC CLK is set to 25000000
>Last reset was CORST
>vgaioen=1 and mux gspi.
>A1 <<====== this is what you should see, if you see Z1 we need to replace
your EB

+
> +       b       secondary_startup
> +ENDPROC(npcm7xx_secondary_startup)
> diff --git a/arch/arm/mach-npcm/npcm7xx.c b/arch/arm/mach-npcm/npcm7xx.c
> new file mode 100644
> index 000000000000..132e9d587857
> --- /dev/null
> +++ b/arch/arm/mach-npcm/npcm7xx.c
> @@ -0,0 +1,34 @@
> +/*
> + * Copyright (c) 2017 Nuvoton Technology corporation.
> + * Copyright 2017 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <asm/mach/arch.h>
> +#include <asm/mach-types.h>
> +#include <asm/mach/map.h>
> +#include <asm/hardware/cache-l2x0.h>
> +
> +#define NPCM7XX_AUX_VAL (L310_AUX_CTRL_INSTR_PREFETCH |
>              \
> +                        L310_AUX_CTRL_DATA_PREFETCH |
>      \
> +                        L310_AUX_CTRL_NS_LOCKDOWN |
>      \
> +                        L310_AUX_CTRL_CACHE_REPLACE_RR |
>     \
> +                        L2C_AUX_CTRL_SHARED_OVERRIDE |
>     \
> +                        L310_AUX_CTRL_FULL_LINE_ZERO)
> +
> +static const char *const npcm7xx_dt_match[] = {
> +       "nuvoton,npcm750",
> +       NULL
> +};
> +
> +DT_MACHINE_START(NPCM7XX_DT, "NPCMX50 Chip family")
> +       .atag_offset    = 0x100,
> +       .dt_compat      = npcm7xx_dt_match,
> +       .l2c_aux_val    = NPCM7XX_AUX_VAL,
> +       .l2c_aux_mask   = ~NPCM7XX_AUX_VAL,
> +MACHINE_END
> diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
> new file mode 100644
> index 000000000000..144e3e7ec7e6
> --- /dev/null
> +++ b/arch/arm/mach-npcm/platsmp.c
> @@ -0,0 +1,89 @@
> +/*
> + * Copyright 2017 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#define pr_fmt(fmt) "PLATSMP: " fmt
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/smp.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <asm/cacheflush.h>
> +#include <asm/smp.h>
> +#include <asm/smp_plat.h>
> +#include <asm/smp_scu.h>
> +
> +#define NPCM7XX_SCRPAD_REG 0x13c
> +
> +extern void npcm7xx_secondary_startup(void);
> +
> +static int npcm7xx_smp_boot_secondary(unsigned int cpu,
> +                                     struct task_struct *idle)
> +{
> +       struct device_node *gcr_np;
> +       void __iomem *gcr_base;
> +       int ret = 0;
> +
> +       gcr_np = of_find_compatible_node(NULL, NULL,
> "nuvoton,npcm750-gcr");
> +       if (!gcr_np) {
> +               pr_err("no gcr device node\n");
> +               ret = -EFAULT;
> +               goto out;
> +       }
> +       gcr_base = of_iomap(gcr_np, 0);
> +       if (!gcr_base) {
> +               pr_err("could not iomap gcr at: 0x%llx\n", gcr_base);
> +               ret = -EFAULT;
> +               goto out;
> +       }
> +
> +       /* give boot ROM kernel start address. */
> +       iowrite32(__pa_symbol(npcm7xx_secondary_startup), gcr_base +
> +                 NPCM7XX_SCRPAD_REG);
> +       /* make sure npcm7xx_secondary_startup is seen by all observers. */
> +       smp_wmb();
> +       dsb_sev();
> +       /* make sure write buffer is drained */
> +       mb();
> +
> +out:
> +       iounmap(gcr_base);
> +       return ret;
> +}
> +
> +static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
> +{
> +       struct device_node *scu_np;
> +       void __iomem *scu_base;
> +
> +       scu_np = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
> +       if (!scu_np) {
> +               pr_err("no scu device node\n");
> +               return;
> +       }
> +       scu_base = of_iomap(scu_np, 0);
> +       if (!scu_base) {
> +               pr_err("could not iomap scu at: 0x%llx\n", scu_base);
> +               return;
> +       }
> +
> +       scu_enable(scu_base);
> +
> +out:
> +       iounmap(scu_base);
> +}
> +
> +static struct smp_operations npcm7xx_smp_ops __initdata = {
> +       .smp_prepare_cpus = npcm7xx_smp_prepare_cpus,
> +       .smp_boot_secondary = npcm7xx_smp_boot_secondary,
> +};
> +
> +CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm7xx-smp",
> &npcm7xx_smp_ops);
> --
> 2.14.1.581.gf28d330327-goog
>
>

--001a113f5b90e3503605588b2de1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"rtl"><div style=3D"text-align:left" dir=3D"ltr"><br></div><div =
class=3D"gmail_extra" dir=3D"ltr"><div style=3D"text-align:left"><br></div>=
<div class=3D"gmail_quote"><div>2017-09-06 11:07 GMT+03:00 Brendan Higgins =
<span dir=3D"ltr">&lt;<a href=3D"mailto:brendanhiggins@google.com" target=
=3D"_blank">brendanhiggins@google.com</a>&gt;</span>:</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div style=3D"text-align:left">Adds basic=
 support for the Nuvoton NPCM750 BMC.</div><span class=3D"gmail-"><div styl=
e=3D"text-align:left"><br></div>
<div style=3D"text-align:left">Signed-off-by: Brendan Higgins &lt;<a href=
=3D"mailto:brendanhiggins@google.com">brendanhiggins@google.com</a>&gt;</di=
v><div style=3D"text-align:left">---</div><div style=3D"text-align:left">=
=C2=A0arch/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +</div><div style=3D"text-align:left">=C2=A0arch/arm/Makefile=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +</div>
</span><div style=3D"text-align:left">=C2=A0arch/arm/mach-npcm/Kconfig=C2=
=A0 =C2=A0| 50 +++++++++++++++++++++++++</div><div style=3D"text-align:left=
">=C2=A0arch/arm/mach-npcm/Makefile=C2=A0 |=C2=A0 3 ++</div><div style=3D"t=
ext-align:left">=C2=A0arch/arm/mach-npcm/headsmp.S | 17 +++++++++</div><div=
 style=3D"text-align:left">=C2=A0arch/arm/mach-npcm/npcm7xx.c | 34 ++++++++=
+++++++++</div><div style=3D"text-align:left">=C2=A0arch/arm/mach-npcm/plat=
smp.c | 89 ++++++++++++++++++++++++++++++<wbr>++++++++++++++</div><div styl=
e=3D"text-align:left">=C2=A07 files changed, 196 insertions(+)</div>
<div><div class=3D"gmail-h5"><div style=3D"text-align:left">=C2=A0create mo=
de 100644 arch/arm/mach-npcm/Kconfig</div><div style=3D"text-align:left">=
=C2=A0create mode 100644 arch/arm/mach-npcm/Makefile</div><div style=3D"tex=
t-align:left">=C2=A0create mode 100644 arch/arm/mach-npcm/headsmp.S</div><d=
iv style=3D"text-align:left">=C2=A0create mode 100644 arch/arm/mach-npcm/np=
cm7xx.c</div><div style=3D"text-align:left">=C2=A0create mode 100644 arch/a=
rm/mach-npcm/platsmp.c</div>
<div style=3D"text-align:left"><br></div><div style=3D"text-align:left">dif=
f --git a/arch/arm/Kconfig b/arch/arm/Kconfig</div><div style=3D"text-align=
:left">index 61a0cb15067e..05543f1cfbde 100644</div><div style=3D"text-alig=
n:left">--- a/arch/arm/Kconfig</div><div style=3D"text-align:left">+++ b/ar=
ch/arm/Kconfig</div><div style=3D"text-align:left">@@ -782,6 +782,8 @@ sour=
ce &quot;arch/arm/mach-netx/Kconfig&quot;</div>
<div style=3D"text-align:left"><br></div><div style=3D"text-align:left">=C2=
=A0source &quot;arch/arm/mach-nomadik/<wbr>Kconfig&quot;</div>
<div style=3D"text-align:left"><br></div><div style=3D"text-align:left">+so=
urce &quot;arch/arm/mach-npcm/Kconfig&quot;</div><div style=3D"text-align:l=
eft">+</div><div style=3D"text-align:left">=C2=A0source &quot;arch/arm/mach=
-nspire/Kconfig&quot;</div>
<div style=3D"text-align:left"><br></div><div style=3D"text-align:left">=C2=
=A0source &quot;arch/arm/plat-omap/Kconfig&quot;</div><div style=3D"text-al=
ign:left">diff --git a/arch/arm/Makefile b/arch/arm/Makefile</div><div styl=
e=3D"text-align:left">index 47d3a1ab08d2..60ca50c7d762 100644</div><div sty=
le=3D"text-align:left">--- a/arch/arm/Makefile</div><div style=3D"text-alig=
n:left">+++ b/arch/arm/Makefile</div><div style=3D"text-align:left">@@ -191=
,6 +191,7 @@ machine-$(CONFIG_ARCH_<wbr>MEDIATEK)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0+=3D mediatek</div><div style=3D"text-align:left">=
=C2=A0machine-$(CONFIG_ARCH_MXS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0+=3D mxs</div><div style=3D"text-align:left">=C2=A0machine-$(CONFIG_A=
RCH_NETX)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D netx</div><div styl=
e=3D"text-align:left">=C2=A0machine-$(CONFIG_ARCH_NOMADIK)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0+=3D nomadik</div><div style=3D"text-align:left">+machine-=
$(CONFIG_ARCH_NPCM)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D npcm</div=
><div style=3D"text-align:left">=C2=A0machine-$(CONFIG_ARCH_NSPIRE)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D nspire</div><div style=3D"text-align:left"=
>=C2=A0machine-$(CONFIG_ARCH_OXNAS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0+=3D oxnas</div><div style=3D"text-align:left">=C2=A0machine-$(CONFIG_AR=
CH_OMAP1)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D omap1</div><div styl=
e=3D"text-align:left">diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/ma=
ch-npcm/Kconfig</div><div style=3D"text-align:left">new file mode 100644</d=
iv>
</div></div><div style=3D"text-align:left">index 000000000000..d47061855439=
</div><div style=3D"text-align:left">--- /dev/null</div><div style=3D"text-=
align:left">+++ b/arch/arm/mach-npcm/Kconfig</div><div style=3D"text-align:=
left">@@ -0,0 +1,50 @@</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+menuconfig ARCH_NPCM=
</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot=
;Nuvoton NPCM Architecture&quot;</div><div style=3D"text-align:left">+=C2=
=A0 =C2=A0 =C2=A0 =C2=A0select ARCH_REQUIRE_GPIOLIB</div><div style=3D"text=
-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select USE_OF</div><div style=3D"t=
ext-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select PINCTRL</div><div style=
=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select PINCTRL_NPCM7XX</di=
v><div style=3D"text-align:left">+</div><div style=3D"text-align:left">+if =
ARCH_NPCM</div><div style=3D"text-align:left">+</div><div style=3D"text-ali=
gn:left">+comment &quot;NPCMX50 CPU type&quot;</div><div style=3D"text-alig=
n:left">+</div><div style=3D"text-align:left">+config CPU_NPCM750</div><div=
 style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARCH_NPCM=
 &amp;&amp; ARCH_MULTI_V7</div>
</span><span class=3D"gmail-"><div style=3D"text-align:left">+=C2=A0 =C2=A0=
 =C2=A0 =C2=A0bool &quot;Support for NPCM750 BMC CPU (Poleg)&quot;</div><di=
v style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select CACHE_L2X0</=
div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select CPU_V=
7</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select AR=
M_GIC</div>
</span><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select HA=
VE_SMP</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0sele=
ct SMP</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0sele=
ct SMP_ON_UP</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0select HAVE_ARM_SCU</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0=
 =C2=A0select HAVE_ARM_TWD if SMP</div>
</span><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select AR=
M_ERRATA_458693</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0select ARM_ERRATA_720789</div><div style=3D"text-align:left">+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0select ARM_ERRATA_742231</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0=
 =C2=A0select ARM_ERRATA_754322</div><div style=3D"text-align:left">+=C2=A0=
 =C2=A0 =C2=A0 =C2=A0select ARM_ERRATA_764369</div>
</span><span class=3D"gmail-"><div style=3D"text-align:left">+=C2=A0 =C2=A0=
 =C2=A0 =C2=A0select ARM_ERRATA_794072</div><div style=3D"text-align:left">=
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select PL310_ERRATA_588369</div><div style=3D"t=
ext-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select PL310_ERRATA_727915</div=
>
</span><span class=3D"gmail-"><div style=3D"text-align:left">+=C2=A0 =C2=A0=
 =C2=A0 =C2=A0select USB_EHCI_ROOT_HUB_TT</div><div style=3D"text-align:lef=
t">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select USB_ARCH_HAS_HCD</div><div style=3D"t=
ext-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select USB_ARCH_HAS_EHCI</div><=
div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select USB_EHCI_H=
CD</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select U=
SB_ARCH_HAS_OHCI</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0select USB_OHCI_HCD</div><div style=3D"text-align:left">+=C2=A0 =C2=
=A0 =C2=A0 =C2=A0select USB</div><div style=3D"text-align:left">+=C2=A0 =C2=
=A0 =C2=A0 =C2=A0select FIQ</div><div style=3D"text-align:left">+=C2=A0 =C2=
=A0 =C2=A0 =C2=A0select CPU_USE_DOMAINS</div>
</span><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0select GE=
NERIC_CLOCKEVENTS</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0=
 =C2=A0select CLKDEV_LOOKUP</div><div style=3D"text-align:left">+=C2=A0 =C2=
=A0 =C2=A0 =C2=A0select COMMON_CLK if OF</div>
</span><span class=3D"gmail-"><div style=3D"text-align:left">+=C2=A0 =C2=A0=
 =C2=A0 =C2=A0select NPCM750_TIMER</div><div style=3D"text-align:left">+=C2=
=A0 =C2=A0 =C2=A0 =C2=A0select MFD_SYSCON</div><div style=3D"text-align:lef=
t">+=C2=A0 =C2=A0 =C2=A0 =C2=A0help</div>
</span><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Su=
pport for NPCM750 BMC CPU (Poleg).</div><div style=3D"text-align:left">+</d=
iv><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Nuvoto=
n NPCM750 BMC based on the Cortex A9.</div><div style=3D"text-align:left">+=
</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+endif</div><div styl=
e=3D"text-align:left">diff --git a/arch/arm/mach-npcm/Makefile b/arch/arm/m=
ach-npcm/Makefile</div>
</span><div style=3D"text-align:left">new file mode 100644</div><div style=
=3D"text-align:left">index 000000000000..78416055b854</div>
<span class=3D"gmail-"><div style=3D"text-align:left">--- /dev/null</div><d=
iv style=3D"text-align:left">+++ b/arch/arm/mach-npcm/Makefile</div><div st=
yle=3D"text-align:left">@@ -0,0 +1,3 @@</div>
</span><div style=3D"text-align:left">+AFLAGS_headsmp.o=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D -march=3Darmv7-a</div><div style=3D=
"text-align:left">+</div><div style=3D"text-align:left">+obj-$(CONFIG_CPU_N=
PCM750)=C2=A0 =C2=A0 =C2=A0 +=3D npcm7xx.o platsmp.o headsmp.o</div>
<span class=3D"gmail-"><div style=3D"text-align:left">diff --git a/arch/arm=
/mach-npcm/headsmp.S b/arch/arm/mach-npcm/headsmp.S</div><div style=3D"text=
-align:left">new file mode 100644</div>
</span><div style=3D"text-align:left">index 000000000000..9fccbbd49ed4</div=
><div style=3D"text-align:left">--- /dev/null</div><div style=3D"text-align=
:left">+++ b/arch/arm/mach-npcm/headsmp.S</div><div style=3D"text-align:lef=
t">@@ -0,0 +1,17 @@</div><div style=3D"text-align:left">+/*</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+ * Copyright 2017 Go=
ogle, Inc.</div><div style=3D"text-align:left">+ *</div><div style=3D"text-=
align:left">+ * This program is free software; you can redistribute it and/=
or modify</div>
</span><span class=3D"gmail-"><div style=3D"text-align:left">+ * it under t=
he terms of the GNU General Public License version 2 as</div><div style=3D"=
text-align:left">+ * published by the Free Software Foundation.</div><div s=
tyle=3D"text-align:left">+ */</div><div style=3D"text-align:left">+</div><d=
iv style=3D"text-align:left">+#include &lt;linux/linkage.h&gt;</div><div st=
yle=3D"text-align:left">+#include &lt;linux/init.h&gt;</div>
</span><div style=3D"text-align:left">+#include &lt;asm/assembler.h&gt;</di=
v><div style=3D"text-align:left">+</div><div style=3D"text-align:left">+ENT=
RY(npcm7xx_secondary_<wbr>startup)</div><div style=3D"text-align:left">+=C2=
=A0 =C2=A0 =C2=A0 =C2=A0safe_svcmode_maskall r0</div></blockquote><div><br>=
</div><div>I saw you =C2=A0answered to Florian Fainelli that the BootRom is=
 not starting the secondary CPU in SVC mode. Are you sure? In our engineeri=
ng npcm7xx revision, Z1, the BootRom indeed started to run it in IRQ mode b=
ut we fixed it in the production version, A1, (quite long time ago), I hope=
 you didn&#39;t get an EB with Z1 you can check that in BootBlock console p=
rint:</div><div><div>&gt; ADC CLK is set to 25000000</div><div>&gt;Last res=
et was CORST</div><div>&gt;vgaioen=3D1 and mux gspi.</div><div>&gt;A1 &lt;&=
lt;=3D=3D=3D=3D=3D=3D this is what you should see, if you see Z1 we need to=
 replace your EB</div></div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div style=3D"text-align:left">+</div><div style=3D"text-=
align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0b=C2=A0 =C2=A0 =C2=A0 =C2=A0seconda=
ry_startup</div><div style=3D"text-align:left">+ENDPROC(npcm7xx_secondary_<=
wbr>startup)</div>
<span class=3D"gmail-"><div style=3D"text-align:left">diff --git a/arch/arm=
/mach-npcm/npcm7xx.c b/arch/arm/mach-npcm/npcm7xx.c</div><div style=3D"text=
-align:left">new file mode 100644</div>
</span><div style=3D"text-align:left">index 000000000000..132e9d587857</div=
>
<span class=3D"gmail-"><div style=3D"text-align:left">--- /dev/null</div><d=
iv style=3D"text-align:left">+++ b/arch/arm/mach-npcm/npcm7xx.c</div><div s=
tyle=3D"text-align:left">@@ -0,0 +1,34 @@</div><div style=3D"text-align:lef=
t">+/*</div>
</span><div style=3D"text-align:left">+ * Copyright (c) 2017 Nuvoton Techno=
logy corporation.</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+ * Copyright 2017 Go=
ogle, Inc.</div><div style=3D"text-align:left">+ *</div><div style=3D"text-=
align:left">+ * This program is free software; you can redistribute it and/=
or modify</div>
</span><span class=3D"gmail-"><div style=3D"text-align:left">+ * it under t=
he terms of the GNU General Public License version 2 as</div><div style=3D"=
text-align:left">+ * published by the Free Software Foundation.</div><div s=
tyle=3D"text-align:left">+ */</div><div style=3D"text-align:left">+</div>
</span><div><div class=3D"gmail-h5"><div style=3D"text-align:left">+#includ=
e &lt;linux/kernel.h&gt;</div><div style=3D"text-align:left">+#include &lt;=
linux/types.h&gt;</div><div style=3D"text-align:left">+#include &lt;asm/mac=
h/arch.h&gt;</div><div style=3D"text-align:left">+#include &lt;asm/mach-typ=
es.h&gt;</div><div style=3D"text-align:left">+#include &lt;asm/mach/map.h&g=
t;</div><div style=3D"text-align:left">+#include &lt;asm/hardware/cache-l2x=
0.h&gt;</div><div style=3D"text-align:left">+</div><div style=3D"text-align=
:left">+#define NPCM7XX_AUX_VAL (L310_AUX_CTRL_INSTR_PREFETCH |=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\</div><div style=3D"text-align:left">+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 L310_AUX_CTRL_DATA_PREFETCH |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\</div><div style=3D"text-a=
lign:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 L310_AUX_CTRL_NS_LOCKDOWN |=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\</di=
v><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 L310_AUX_CTRL_CACHE_REPLACE_RR |=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 L2C_AUX_CTRL_SHARED_OV=
ERRIDE |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 L310_AUX=
_CTRL_FULL_LINE_ZERO)</div><div style=3D"text-align:left">+</div><div style=
=3D"text-align:left">+static const char *const npcm7xx_dt_match[] =3D {</di=
v><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nuvoton,=
npcm750&quot;,</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0NULL</div><div style=3D"text-align:left">+};</div><div style=3D"text-=
align:left">+</div><div style=3D"text-align:left">+DT_MACHINE_START(NPCM7XX=
_DT, &quot;NPCMX50 Chip family&quot;)</div><div style=3D"text-align:left">+=
=C2=A0 =C2=A0 =C2=A0 =C2=A0.atag_offset=C2=A0 =C2=A0 =3D 0x100,</div><div s=
tyle=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dt_compat=C2=A0 =C2=
=A0 =C2=A0 =3D npcm7xx_dt_match,</div><div style=3D"text-align:left">+=C2=
=A0 =C2=A0 =C2=A0 =C2=A0.l2c_aux_val=C2=A0 =C2=A0 =3D NPCM7XX_AUX_VAL,</div=
><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0.l2c_aux_mask=
=C2=A0 =C2=A0=3D ~NPCM7XX_AUX_VAL,</div><div style=3D"text-align:left">+MAC=
HINE_END</div><div style=3D"text-align:left">diff --git a/arch/arm/mach-npc=
m/platsmp.c b/arch/arm/mach-npcm/platsmp.c</div><div style=3D"text-align:le=
ft">new file mode 100644</div>
</div></div><div style=3D"text-align:left">index 000000000000..144e3e7ec7e6=
</div><div style=3D"text-align:left">--- /dev/null</div><div style=3D"text-=
align:left">+++ b/arch/arm/mach-npcm/platsmp.c</div><div style=3D"text-alig=
n:left">@@ -0,0 +1,89 @@</div><div style=3D"text-align:left">+/*</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+ * Copyright 2017 Go=
ogle, Inc.</div><div style=3D"text-align:left">+ *</div><div style=3D"text-=
align:left">+ * This program is free software; you can redistribute it and/=
or modify</div>
</span><span class=3D"gmail-"><div style=3D"text-align:left">+ * it under t=
he terms of the GNU General Public License version 2 as</div><div style=3D"=
text-align:left">+ * published by the Free Software Foundation.</div><div s=
tyle=3D"text-align:left">+ */</div><div style=3D"text-align:left">+</div><d=
iv style=3D"text-align:left">+#define pr_fmt(fmt) &quot;PLATSMP: &quot; fmt=
</div><div style=3D"text-align:left">+</div><div style=3D"text-align:left">=
+#include &lt;linux/delay.h&gt;</div><div style=3D"text-align:left">+#inclu=
de &lt;linux/device.h&gt;</div><div style=3D"text-align:left">+#include &lt=
;linux/smp.h&gt;</div><div style=3D"text-align:left">+#include &lt;linux/io=
.h&gt;</div><div style=3D"text-align:left">+#include &lt;linux/of.h&gt;</di=
v><div style=3D"text-align:left">+#include &lt;linux/of_device.h&gt;</div><=
div style=3D"text-align:left">+#include &lt;linux/of_platform.h&gt;</div><d=
iv style=3D"text-align:left">+#include &lt;linux/of_address.h&gt;</div><div=
 style=3D"text-align:left">+#include &lt;asm/cacheflush.h&gt;</div><div sty=
le=3D"text-align:left">+#include &lt;asm/smp.h&gt;</div><div style=3D"text-=
align:left">+#include &lt;asm/smp_plat.h&gt;</div><div style=3D"text-align:=
left">+#include &lt;asm/smp_scu.h&gt;</div><div style=3D"text-align:left">+=
</div><div style=3D"text-align:left">+#define NPCM7XX_SCRPAD_REG 0x13c</div=
><div style=3D"text-align:left">+</div>
</span><div style=3D"text-align:left">+extern void npcm7xx_secondary_startu=
p(<wbr>void);</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+</div><div style=3D"=
text-align:left">+static int npcm7xx_smp_boot_secondary(<wbr>unsigned int c=
pu,</div>
</span><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct task_struct *idle)</div><div style=3D"text-a=
lign:left">+{</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct device_node *gcr_np;</div><div style=3D"text-align:left">+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0void __iomem *gcr_base;</div><div style=3D"text-align:l=
eft">+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+</div><div style=3D"=
text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0gcr_np =3D of_find_compatible_=
node(NULL, NULL, &quot;nuvoton,npcm750-gcr&quot;);</div><div style=3D"text-=
align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gcr_np) {</div><div style=3D"t=
ext-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_=
err(&quot;no gcr device node\n&quot;);</div>
</span><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret =3D -EFAULT;</div><div style=3D"text-align:left">+=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0=
 =C2=A0}</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0gc=
r_base =3D of_iomap(gcr_np, 0);</div><div style=3D"text-align:left">+=C2=A0=
 =C2=A0 =C2=A0 =C2=A0if (!gcr_base) {</div><div style=3D"text-align:left">+=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;could n=
ot iomap gcr at: 0x%llx\n&quot;, gcr_base);</div>
</span><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret =3D -EFAULT;</div><div style=3D"text-align:left">+=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;</div><div =
style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0}</div><div style=3D"=
text-align:left">+</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* give boot ROM kernel start address. */</div><div style=3D"text=
-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite32(__pa_symbol(npcm7xx_<wbr=
>secondary_startup), gcr_base +</div><div style=3D"text-align:left">+=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_SCRPAD_REG)=
;</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* make sure npcm7xx_secondary_startup is seen by all observers. */<=
/div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0smp_wmb();<=
/div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0dsb_sev();<=
/div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* make sur=
e write buffer is drained */</div><div style=3D"text-align:left">+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0mb();</div><div style=3D"text-align:left">+</div>
</span><div style=3D"text-align:left">+out:</div><div style=3D"text-align:l=
eft">+=C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(gcr_base);</div><div style=3D"text=
-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+}</div><div style=3D=
"text-align:left">+</div><div style=3D"text-align:left">+static void __init=
 npcm7xx_smp_prepare_cpus(<wbr>unsigned int max_cpus)</div><div style=3D"te=
xt-align:left">+{</div>
</span><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct de=
vice_node *scu_np;</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0void __iomem *scu_base;</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+</div><div style=3D"=
text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0scu_np =3D of_find_compatible_=
node(NULL, NULL, &quot;arm,cortex-a9-scu&quot;);</div><div style=3D"text-al=
ign:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!scu_np) {</div><div style=3D"tex=
t-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_er=
r(&quot;no scu device node\n&quot;);</div><div style=3D"text-align:left">+=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;</div><div st=
yle=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0}</div><div style=3D"te=
xt-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0scu_base =3D of_iomap(scu_np, 0)=
;</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!scu_=
base) {</div>
</span><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0pr_err(&quot;could not iomap scu at: 0x%llx\n&quot;, sc=
u_base);</div>
<span class=3D"gmail-"><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;</div><div style=3D"text-align:le=
ft">+=C2=A0 =C2=A0 =C2=A0 =C2=A0}</div><div style=3D"text-align:left">+</di=
v><div style=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0scu_enable(scu=
_base);</div><div style=3D"text-align:left">+</div>
</span><div style=3D"text-align:left">+out:</div><div style=3D"text-align:l=
eft">+=C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(scu_base);</div>
<span class=3D"gmail-im gmail-HOEnZb"><div style=3D"text-align:left">+}</di=
v><div style=3D"text-align:left">+</div><div style=3D"text-align:left">+sta=
tic struct smp_operations npcm7xx_smp_ops __initdata =3D {</div><div style=
=3D"text-align:left">+=C2=A0 =C2=A0 =C2=A0 =C2=A0.smp_prepare_cpus =3D npcm=
7xx_smp_prepare_cpus,</div><div style=3D"text-align:left">+=C2=A0 =C2=A0 =
=C2=A0 =C2=A0.smp_boot_secondary =3D npcm7xx_smp_boot_secondary,</div>
</span><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><div style=3D"te=
xt-align:left">+};</div><div style=3D"text-align:left">+</div><div style=3D=
"text-align:left">+CPU_METHOD_OF_DECLARE(<wbr>npcm7xx_smp, &quot;nuvoton,np=
cm7xx-smp&quot;, &amp;npcm7xx_smp_ops);</div><div style=3D"text-align:left"=
>--</div><div style=3D"text-align:left">2.14.1.581.gf28d330327-goog</div>
<div style=3D"text-align:left"><br></div>
</div></div></blockquote></div><div style=3D"text-align:left"><br></div></d=
iv></div>

--001a113f5b90e3503605588b2de1--
