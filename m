Return-Path: <SRS0=e4lG=AH=gmail.com=avifishman70@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170906080751.6773-2-brendanhiggins@google.com>
References: <20170906080751.6773-1-brendanhiggins@google.com> <20170906080751.6773-2-brendanhiggins@google.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Wed, 6 Sep 2017 23:31:43 +0300
Message-ID: <CAKKbWA6M13+Od24aVEdJM8VA4b+=Wk7LM46vyj=3ziwpkKLesA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] arm: npcm: add basic support for Nuvoton BMCs
Content-Type: multipart/alternative; boundary="001a113e39486d0c9905588b3b33"
To: Brendan Higgins <brendanhiggins@google.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, tmaimon77@gmail.com, raltherr@google.com, f.fainelli@gmail.com, joel@jms.id.au, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

--001a113e39486d0c9905588b3b33
Content-Type: text/plain; charset="UTF-8"

2017-09-06 11:07 GMT+03:00 Brendan Higgins <brendanhiggins@google.com>:
>
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
>  arch/arm/mach-npcm/platsmp.c | 89
++++++++++++++++++++++++++++++++++++++++++++
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
mediatek
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

> +
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
              \
> +                        L310_AUX_CTRL_DATA_PREFETCH |
      \
> +                        L310_AUX_CTRL_NS_LOCKDOWN |
      \
> +                        L310_AUX_CTRL_CACHE_REPLACE_RR |
     \
> +                        L2C_AUX_CTRL_SHARED_OVERRIDE |
     \
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
"nuvoton,npcm750-gcr");
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
> +       /* make sure npcm7xx_secondary_startup is seen by all observers.
*/
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
&npcm7xx_smp_ops);
> --
> 2.14.1.581.gf28d330327-goog
>

--001a113e39486d0c9905588b3b33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"rtl"><div style=3D"text-align:left" dir=3D"ltr"><br></div><div =
style=3D"text-align:left" dir=3D"ltr"><br></div><div style=3D"text-align:le=
ft" dir=3D"ltr">2017-09-06 11:07 GMT+03:00 Brendan Higgins &lt;<a href=3D"m=
ailto:brendanhiggins@google.com">brendanhiggins@google.com</a>&gt;:</div><d=
iv style=3D"text-align:left" dir=3D"ltr">&gt;</div><div style=3D"text-align=
:left" dir=3D"ltr">&gt; Adds basic support for the Nuvoton NPCM750 BMC.</di=
v><div style=3D"text-align:left" dir=3D"ltr">&gt;</div><div style=3D"text-a=
lign:left" dir=3D"ltr">&gt; Signed-off-by: Brendan Higgins &lt;<a href=3D"m=
ailto:brendanhiggins@google.com">brendanhiggins@google.com</a>&gt;</div><di=
v style=3D"text-align:left" dir=3D"ltr">&gt; ---</div><div style=3D"text-al=
ign:left" dir=3D"ltr">&gt; =C2=A0arch/arm/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A02 +</div><div style=3D"text-align:left" dir=3D"lt=
r">&gt; =C2=A0arch/arm/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A01 +</div><div style=3D"text-align:left" dir=3D"ltr">&gt; =C2=A0arch/a=
rm/mach-npcm/Kconfig =C2=A0 | 50 +++++++++++++++++++++++++</div><div style=
=3D"text-align:left" dir=3D"ltr">&gt; =C2=A0arch/arm/mach-npcm/Makefile =C2=
=A0| =C2=A03 ++</div><div style=3D"text-align:left" dir=3D"ltr">&gt; =C2=A0=
arch/arm/mach-npcm/headsmp.S | 17 +++++++++</div><div style=3D"text-align:l=
eft" dir=3D"ltr">&gt; =C2=A0arch/arm/mach-npcm/npcm7xx.c | 34 +++++++++++++=
++++</div><div style=3D"text-align:left" dir=3D"ltr">&gt; =C2=A0arch/arm/ma=
ch-npcm/platsmp.c | 89 ++++++++++++++++++++++++++++++++++++++++++++</div><d=
iv style=3D"text-align:left" dir=3D"ltr">&gt; =C2=A07 files changed, 196 in=
sertions(+)</div><div style=3D"text-align:left" dir=3D"ltr">&gt; =C2=A0crea=
te mode 100644 arch/arm/mach-npcm/Kconfig</div><div style=3D"text-align:lef=
t" dir=3D"ltr">&gt; =C2=A0create mode 100644 arch/arm/mach-npcm/Makefile</d=
iv><div style=3D"text-align:left" dir=3D"ltr">&gt; =C2=A0create mode 100644=
 arch/arm/mach-npcm/headsmp.S</div><div style=3D"text-align:left" dir=3D"lt=
r">&gt; =C2=A0create mode 100644 arch/arm/mach-npcm/npcm7xx.c</div><div sty=
le=3D"text-align:left" dir=3D"ltr">&gt; =C2=A0create mode 100644 arch/arm/m=
ach-npcm/platsmp.c</div><div style=3D"text-align:left" dir=3D"ltr">&gt;</di=
v><div style=3D"text-align:left" dir=3D"ltr">&gt; diff --git a/arch/arm/Kco=
nfig b/arch/arm/Kconfig</div><div style=3D"text-align:left" dir=3D"ltr">&gt=
; index 61a0cb15067e..05543f1cfbde 100644</div><div style=3D"text-align:lef=
t" dir=3D"ltr">&gt; --- a/arch/arm/Kconfig</div><div style=3D"text-align:le=
ft" dir=3D"ltr">&gt; +++ b/arch/arm/Kconfig</div><div style=3D"text-align:l=
eft" dir=3D"ltr">&gt; @@ -782,6 +782,8 @@ source &quot;arch/arm/mach-netx/K=
config&quot;</div><div style=3D"text-align:left" dir=3D"ltr">&gt;</div><div=
 style=3D"text-align:left" dir=3D"ltr">&gt; =C2=A0source &quot;arch/arm/mac=
h-nomadik/Kconfig&quot;</div><div style=3D"text-align:left" dir=3D"ltr">&gt=
;</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +source &quot;arch/a=
rm/mach-npcm/Kconfig&quot;</div><div style=3D"text-align:left" dir=3D"ltr">=
&gt; +</div><div style=3D"text-align:left" dir=3D"ltr">&gt; =C2=A0source &q=
uot;arch/arm/mach-nspire/Kconfig&quot;</div><div style=3D"text-align:left" =
dir=3D"ltr">&gt;</div><div style=3D"text-align:left" dir=3D"ltr">&gt; =C2=
=A0source &quot;arch/arm/plat-omap/Kconfig&quot;</div><div style=3D"text-al=
ign:left" dir=3D"ltr">&gt; diff --git a/arch/arm/Makefile b/arch/arm/Makefi=
le</div><div style=3D"text-align:left" dir=3D"ltr">&gt; index 47d3a1ab08d2.=
.60ca50c7d762 100644</div><div style=3D"text-align:left" dir=3D"ltr">&gt; -=
-- a/arch/arm/Makefile</div><div style=3D"text-align:left" dir=3D"ltr">&gt;=
 +++ b/arch/arm/Makefile</div><div style=3D"text-align:left" dir=3D"ltr">&g=
t; @@ -191,6 +191,7 @@ machine-$(CONFIG_ARCH_MEDIATEK) =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 +=3D mediatek</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; =C2=A0machine-$(CONFIG_ARCH_MXS) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 +=3D mxs</div><div style=3D"text-align:left" dir=3D"ltr">&gt;=
 =C2=A0machine-$(CONFIG_ARCH_NETX) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0+=3D netx</div><div style=3D"text-align:left" dir=3D"ltr">&gt; =C2=A0mac=
hine-$(CONFIG_ARCH_NOMADIK) =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D nomadik</div><=
div style=3D"text-align:left" dir=3D"ltr">&gt; +machine-$(CONFIG_ARCH_NPCM)=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D npcm</div><div style=3D"text=
-align:left" dir=3D"ltr">&gt; =C2=A0machine-$(CONFIG_ARCH_NSPIRE) =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D nspire</div><div style=3D"text-align:left" =
dir=3D"ltr">&gt; =C2=A0machine-$(CONFIG_ARCH_OXNAS) =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 +=3D oxnas</div><div style=3D"text-align:left" dir=3D"ltr">&g=
t; =C2=A0machine-$(CONFIG_ARCH_OMAP1) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=3D omap1</div><div style=3D"text-align:left" dir=3D"ltr">&gt; diff --git a=
/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig</div><div style=3D=
"text-align:left" dir=3D"ltr">&gt; new file mode 100644</div><div style=3D"=
text-align:left" dir=3D"ltr">&gt; index 000000000000..d47061855439</div><di=
v style=3D"text-align:left" dir=3D"ltr">&gt; --- /dev/null</div><div style=
=3D"text-align:left" dir=3D"ltr">&gt; +++ b/arch/arm/mach-npcm/Kconfig</div=
><div style=3D"text-align:left" dir=3D"ltr">&gt; @@ -0,0 +1,50 @@</div><div=
 style=3D"text-align:left" dir=3D"ltr">&gt; +menuconfig ARCH_NPCM</div><div=
 style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 bool &qu=
ot;Nuvoton NPCM Architecture&quot;</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select ARCH_REQUIRE_GPIOLIB</div><div =
style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select US=
E_OF</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =
=C2=A0 select PINCTRL</div><div style=3D"text-align:left" dir=3D"ltr">&gt; =
+ =C2=A0 =C2=A0 =C2=A0 select PINCTRL_NPCM7XX</div><div style=3D"text-align=
:left" dir=3D"ltr">&gt; +</div><div style=3D"text-align:left" dir=3D"ltr">&=
gt; +if ARCH_NPCM</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +</d=
iv><div style=3D"text-align:left" dir=3D"ltr">&gt; +comment &quot;NPCMX50 C=
PU type&quot;</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +</div><=
div style=3D"text-align:left" dir=3D"ltr">&gt; +config CPU_NPCM750</div><di=
v style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 depends=
 on ARCH_NPCM &amp;&amp; ARCH_MULTI_V7</div><div style=3D"text-align:left" =
dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 bool &quot;Support for NPCM750 BMC =
CPU (Poleg)&quot;</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =
=C2=A0 =C2=A0 =C2=A0 select CACHE_L2X0</div><div style=3D"text-align:left" =
dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select CPU_V7</div><div style=3D"te=
xt-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select ARM_GIC</div>=
<div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 sele=
ct HAVE_SMP</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =
=C2=A0 =C2=A0 select SMP</div><div style=3D"text-align:left" dir=3D"ltr">&g=
t; + =C2=A0 =C2=A0 =C2=A0 select SMP_ON_UP</div><div style=3D"text-align:le=
ft" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select HAVE_ARM_SCU</div><div s=
tyle=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select HAV=
E_ARM_TWD if SMP</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=
=A0 =C2=A0 =C2=A0 select ARM_ERRATA_458693</div><div style=3D"text-align:le=
ft" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select ARM_ERRATA_720789</div><=
div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 selec=
t ARM_ERRATA_742231</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =
=C2=A0 =C2=A0 =C2=A0 select ARM_ERRATA_754322</div><div style=3D"text-align=
:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select ARM_ERRATA_764369</di=
v><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 se=
lect ARM_ERRATA_794072</div><div style=3D"text-align:left" dir=3D"ltr">&gt;=
 + =C2=A0 =C2=A0 =C2=A0 select PL310_ERRATA_588369</div><div style=3D"text-=
align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select PL310_ERRATA_727=
915</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =
=C2=A0 select USB_EHCI_ROOT_HUB_TT</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select USB_ARCH_HAS_HCD</div><div styl=
e=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select USB_AR=
CH_HAS_EHCI</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =
=C2=A0 =C2=A0 select USB_EHCI_HCD</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select USB_ARCH_HAS_OHCI</div><div sty=
le=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select USB_O=
HCI_HCD</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=
=A0 =C2=A0 select USB</div><div style=3D"text-align:left" dir=3D"ltr">&gt; =
+ =C2=A0 =C2=A0 =C2=A0 select FIQ</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select CPU_USE_DOMAINS</div><div style=
=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select GENERIC=
_CLOCKEVENTS</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =
=C2=A0 =C2=A0 select CLKDEV_LOOKUP</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select COMMON_CLK if OF</div><div styl=
e=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 select NPCM75=
0_TIMER</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=
=A0 =C2=A0 select MFD_SYSCON</div><div style=3D"text-align:left" dir=3D"ltr=
">&gt; + =C2=A0 =C2=A0 =C2=A0 help</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Support for NPCM750 BMC CPU (Po=
leg).</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +</div><div styl=
e=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Nuvoto=
n NPCM750 BMC based on the Cortex A9.</div><div style=3D"text-align:left" d=
ir=3D"ltr">&gt; +</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +end=
if</div><div style=3D"text-align:left" dir=3D"ltr">&gt; diff --git a/arch/a=
rm/mach-npcm/Makefile b/arch/arm/mach-npcm/Makefile</div><div style=3D"text=
-align:left" dir=3D"ltr">&gt; new file mode 100644</div><div style=3D"text-=
align:left" dir=3D"ltr">&gt; index 000000000000..78416055b854</div><div sty=
le=3D"text-align:left" dir=3D"ltr">&gt; --- /dev/null</div><div style=3D"te=
xt-align:left" dir=3D"ltr">&gt; +++ b/arch/arm/mach-npcm/Makefile</div><div=
 style=3D"text-align:left" dir=3D"ltr">&gt; @@ -0,0 +1,3 @@</div><div style=
=3D"text-align:left" dir=3D"ltr">&gt; +AFLAGS_headsmp.o =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D -march=3Darmv7-a</div><div style=3D"te=
xt-align:left" dir=3D"ltr">&gt; +</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; +obj-$(CONFIG_CPU_NPCM750) =C2=A0 =C2=A0 =C2=A0+=3D npcm7xx.o=
 platsmp.o headsmp.o</div><div style=3D"text-align:left" dir=3D"ltr">&gt; d=
iff --git a/arch/arm/mach-npcm/headsmp.S b/arch/arm/mach-npcm/headsmp.S</di=
v><div style=3D"text-align:left" dir=3D"ltr">&gt; new file mode 100644</div=
><div style=3D"text-align:left" dir=3D"ltr">&gt; index 000000000000..9fccbb=
d49ed4</div><div style=3D"text-align:left" dir=3D"ltr">&gt; --- /dev/null</=
div><div style=3D"text-align:left" dir=3D"ltr">&gt; +++ b/arch/arm/mach-npc=
m/headsmp.S</div><div style=3D"text-align:left" dir=3D"ltr">&gt; @@ -0,0 +1=
,17 @@</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +/*</div><div s=
tyle=3D"text-align:left" dir=3D"ltr">&gt; + * Copyright 2017 Google, Inc.</=
div><div style=3D"text-align:left" dir=3D"ltr">&gt; + *</div><div style=3D"=
text-align:left" dir=3D"ltr">&gt; + * This program is free software; you ca=
n redistribute it and/or modify</div><div style=3D"text-align:left" dir=3D"=
ltr">&gt; + * it under the terms of the GNU General Public License version =
2 as</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + * published by =
the Free Software Foundation.</div><div style=3D"text-align:left" dir=3D"lt=
r">&gt; + */</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +</div><d=
iv style=3D"text-align:left" dir=3D"ltr">&gt; +#include &lt;linux/linkage.h=
&gt;</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +#include &lt;lin=
ux/init.h&gt;</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +#includ=
e &lt;asm/assembler.h&gt;</div><div style=3D"text-align:left" dir=3D"ltr">&=
gt; +</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +ENTRY(npcm7xx_s=
econdary_startup)</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =
=C2=A0 =C2=A0 =C2=A0 safe_svcmode_maskall r0</div><div style=3D"text-align:=
left" dir=3D"ltr"><br></div><div style=3D"text-align:left" dir=3D"ltr"><div=
 style=3D"font-size:12.8px">I saw you =C2=A0answered to Florian Fainelli th=
at the BootRom is not starting the secondary CPU in SVC mode. Are you sure?=
 In our engineering npcm7xx revision, Z1, the BootRom indeed started to run=
 it in IRQ mode but we fixed it in the production version, A1, (quite long =
time ago), I hope you didn&#39;t get an EB with Z1 you can check that in Bo=
otBlock console print:</div><div style=3D"font-size:12.8px"><div>&gt; ADC C=
LK is set to 25000000</div><div>&gt;Last reset was CORST</div><div>&gt;vgai=
oen=3D1 and mux gspi.</div><div>&gt;A1 &lt;&lt;=3D=3D=3D=3D=3D=3D this is w=
hat you should see, if you see Z1 we need to replace your EB</div><div><br>=
</div></div></div><div style=3D"text-align:left" dir=3D"ltr">&gt; +</div><d=
iv style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 b =C2=
=A0 =C2=A0 =C2=A0 secondary_startup</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; +ENDPROC(npcm7xx_secondary_startup)</div><div style=3D"text-a=
lign:left" dir=3D"ltr">&gt; diff --git a/arch/arm/mach-npcm/npcm7xx.c b/arc=
h/arm/mach-npcm/npcm7xx.c</div><div style=3D"text-align:left" dir=3D"ltr">&=
gt; new file mode 100644</div><div style=3D"text-align:left" dir=3D"ltr">&g=
t; index 000000000000..132e9d587857</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; --- /dev/null</div><div style=3D"text-align:left" dir=3D"ltr"=
>&gt; +++ b/arch/arm/mach-npcm/npcm7xx.c</div><div style=3D"text-align:left=
" dir=3D"ltr">&gt; @@ -0,0 +1,34 @@</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; +/*</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + * =
Copyright (c) 2017 Nuvoton Technology corporation.</div><div style=3D"text-=
align:left" dir=3D"ltr">&gt; + * Copyright 2017 Google, Inc.</div><div styl=
e=3D"text-align:left" dir=3D"ltr">&gt; + *</div><div style=3D"text-align:le=
ft" dir=3D"ltr">&gt; + * This program is free software; you can redistribut=
e it and/or modify</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + *=
 it under the terms of the GNU General Public License version 2 as</div><di=
v style=3D"text-align:left" dir=3D"ltr">&gt; + * published by the Free Soft=
ware Foundation.</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + */<=
/div><div style=3D"text-align:left" dir=3D"ltr">&gt; +</div><div style=3D"t=
ext-align:left" dir=3D"ltr">&gt; +#include &lt;linux/kernel.h&gt;</div><div=
 style=3D"text-align:left" dir=3D"ltr">&gt; +#include &lt;linux/types.h&gt;=
</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +#include &lt;asm/mac=
h/arch.h&gt;</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +#include=
 &lt;asm/mach-types.h&gt;</div><div style=3D"text-align:left" dir=3D"ltr">&=
gt; +#include &lt;asm/mach/map.h&gt;</div><div style=3D"text-align:left" di=
r=3D"ltr">&gt; +#include &lt;asm/hardware/cache-l2x0.h&gt;</div><div style=
=3D"text-align:left" dir=3D"ltr">&gt; +</div><div style=3D"text-align:left"=
 dir=3D"ltr">&gt; +#define NPCM7XX_AUX_VAL (L310_AUX_CTRL_INSTR_PREFETCH | =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0L310_AUX_CTRL_DATA_PREFETCH | =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \</div><div =
style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0L310_AUX_CTRL_NS_LOC=
KDOWN | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \</div><div style=3D"text-align:left" dir=3D"ltr">=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0L310_AUX_CTRL_CACHE_REPLACE_RR | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\</div><div style=3D"te=
xt-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0L2C_AUX_CTRL_SHARED_OVERRIDE | =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0L310_AUX_CTRL_FULL_LINE_ZERO)</div><div style=3D"text-align:left" dir=3D=
"ltr">&gt; +</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +static c=
onst char *const npcm7xx_dt_match[] =3D {</div><div style=3D"text-align:lef=
t" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 &quot;nuvoton,npcm750&quot;,</di=
v><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 NU=
LL</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +};</div><div style=
=3D"text-align:left" dir=3D"ltr">&gt; +</div><div style=3D"text-align:left"=
 dir=3D"ltr">&gt; +DT_MACHINE_START(NPCM7XX_DT, &quot;NPCMX50 Chip family&q=
uot;)</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =
=C2=A0 .atag_offset =C2=A0 =C2=A0=3D 0x100,</div><div style=3D"text-align:l=
eft" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 .dt_compat =C2=A0 =C2=A0 =C2=
=A0=3D npcm7xx_dt_match,</div><div style=3D"text-align:left" dir=3D"ltr">&g=
t; + =C2=A0 =C2=A0 =C2=A0 .l2c_aux_val =C2=A0 =C2=A0=3D NPCM7XX_AUX_VAL,</d=
iv><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 .=
l2c_aux_mask =C2=A0 =3D ~NPCM7XX_AUX_VAL,</div><div style=3D"text-align:lef=
t" dir=3D"ltr">&gt; +MACHINE_END</div><div style=3D"text-align:left" dir=3D=
"ltr">&gt; diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/p=
latsmp.c</div><div style=3D"text-align:left" dir=3D"ltr">&gt; new file mode=
 100644</div><div style=3D"text-align:left" dir=3D"ltr">&gt; index 00000000=
0000..144e3e7ec7e6</div><div style=3D"text-align:left" dir=3D"ltr">&gt; ---=
 /dev/null</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +++ b/arch/=
arm/mach-npcm/platsmp.c</div><div style=3D"text-align:left" dir=3D"ltr">&gt=
; @@ -0,0 +1,89 @@</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +/*=
</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + * Copyright 2017 Go=
ogle, Inc.</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + *</div><d=
iv style=3D"text-align:left" dir=3D"ltr">&gt; + * This program is free soft=
ware; you can redistribute it and/or modify</div><div style=3D"text-align:l=
eft" dir=3D"ltr">&gt; + * it under the terms of the GNU General Public Lice=
nse version 2 as</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + * p=
ublished by the Free Software Foundation.</div><div style=3D"text-align:lef=
t" dir=3D"ltr">&gt; + */</div><div style=3D"text-align:left" dir=3D"ltr">&g=
t; +</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +#define pr_fmt(f=
mt) &quot;PLATSMP: &quot; fmt</div><div style=3D"text-align:left" dir=3D"lt=
r">&gt; +</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +#include &l=
t;linux/delay.h&gt;</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +#=
include &lt;linux/device.h&gt;</div><div style=3D"text-align:left" dir=3D"l=
tr">&gt; +#include &lt;linux/smp.h&gt;</div><div style=3D"text-align:left" =
dir=3D"ltr">&gt; +#include &lt;linux/io.h&gt;</div><div style=3D"text-align=
:left" dir=3D"ltr">&gt; +#include &lt;linux/of.h&gt;</div><div style=3D"tex=
t-align:left" dir=3D"ltr">&gt; +#include &lt;linux/of_device.h&gt;</div><di=
v style=3D"text-align:left" dir=3D"ltr">&gt; +#include &lt;linux/of_platfor=
m.h&gt;</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +#include &lt;=
linux/of_address.h&gt;</div><div style=3D"text-align:left" dir=3D"ltr">&gt;=
 +#include &lt;asm/cacheflush.h&gt;</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; +#include &lt;asm/smp.h&gt;</div><div style=3D"text-align:lef=
t" dir=3D"ltr">&gt; +#include &lt;asm/smp_plat.h&gt;</div><div style=3D"tex=
t-align:left" dir=3D"ltr">&gt; +#include &lt;asm/smp_scu.h&gt;</div><div st=
yle=3D"text-align:left" dir=3D"ltr">&gt; +</div><div style=3D"text-align:le=
ft" dir=3D"ltr">&gt; +#define NPCM7XX_SCRPAD_REG 0x13c</div><div style=3D"t=
ext-align:left" dir=3D"ltr">&gt; +</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; +extern void npcm7xx_secondary_startup(void);</div><div style=
=3D"text-align:left" dir=3D"ltr">&gt; +</div><div style=3D"text-align:left"=
 dir=3D"ltr">&gt; +static int npcm7xx_smp_boot_secondary(unsigned int cpu,<=
/div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct task_struct *idle)</div><div style=
=3D"text-align:left" dir=3D"ltr">&gt; +{</div><div style=3D"text-align:left=
" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 struct device_node *gcr_np;</div>=
<div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 void=
 __iomem *gcr_base;</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =
=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; +</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=
=A0 =C2=A0 =C2=A0 gcr_np =3D of_find_compatible_node(NULL, NULL, &quot;nuvo=
ton,npcm750-gcr&quot;);</div><div style=3D"text-align:left" dir=3D"ltr">&gt=
; + =C2=A0 =C2=A0 =C2=A0 if (!gcr_np) {</div><div style=3D"text-align:left"=
 dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err=
(&quot;no gcr device node\n&quot;);</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -E=
FAULT;</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;</div><div style=3D"text-align=
:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 }</div><div style=3D"text-al=
ign:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 gcr_base =3D of_iomap(gcr=
_np, 0);</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=
=A0 =C2=A0 if (!gcr_base) {</div><div style=3D"text-align:left" dir=3D"ltr"=
>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;could=
 not iomap gcr at: 0x%llx\n&quot;, gcr_base);</div><div style=3D"text-align=
:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
ret =3D -EFAULT;</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;</div><div style=3D"=
text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 }</div><div style=
=3D"text-align:left" dir=3D"ltr">&gt; +</div><div style=3D"text-align:left"=
 dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 /* give boot ROM kernel start addr=
ess. */</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=
=A0 =C2=A0 iowrite32(__pa_symbol(npcm7xx_secondary_startup), gcr_base +</di=
v><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_SCRPAD_REG);</div><div style=3D"=
text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 /* make sure npcm7=
xx_secondary_startup is seen by all observers. */</div><div style=3D"text-a=
lign:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 smp_wmb();</div><div sty=
le=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 dsb_sev();</=
div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 =
/* make sure write buffer is drained */</div><div style=3D"text-align:left"=
 dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 mb();</div><div style=3D"text-alig=
n:left" dir=3D"ltr">&gt; +</div><div style=3D"text-align:left" dir=3D"ltr">=
&gt; +out:</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =
=C2=A0 =C2=A0 iounmap(gcr_base);</div><div style=3D"text-align:left" dir=3D=
"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 return ret;</div><div style=3D"text-align=
:left" dir=3D"ltr">&gt; +}</div><div style=3D"text-align:left" dir=3D"ltr">=
&gt; +</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +static void __=
init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)</div><div style=3D"tex=
t-align:left" dir=3D"ltr">&gt; +{</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 struct device_node *scu_np;</div><div =
style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 void __io=
mem *scu_base;</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +</div>=
<div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 scu_=
np =3D of_find_compatible_node(NULL, NULL, &quot;arm,cortex-a9-scu&quot;);<=
/div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0=
 if (!scu_np) {</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;no scu device no=
de\n&quot;);</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;</div><div style=3D"text-a=
lign:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 }</div><div style=3D"tex=
t-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 scu_base =3D of_iomap=
(scu_np, 0);</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =
=C2=A0 =C2=A0 if (!scu_base) {</div><div style=3D"text-align:left" dir=3D"l=
tr">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;co=
uld not iomap scu at: 0x%llx\n&quot;, scu_base);</div><div style=3D"text-al=
ign:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return;</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =
=C2=A0 =C2=A0 }</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +</div=
><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 scu=
_enable(scu_base);</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +</=
div><div style=3D"text-align:left" dir=3D"ltr">&gt; +out:</div><div style=
=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 iounmap(scu_ba=
se);</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +}</div><div styl=
e=3D"text-align:left" dir=3D"ltr">&gt; +</div><div style=3D"text-align:left=
" dir=3D"ltr">&gt; +static struct smp_operations npcm7xx_smp_ops __initdata=
 =3D {</div><div style=3D"text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0=
 =C2=A0 .smp_prepare_cpus =3D npcm7xx_smp_prepare_cpus,</div><div style=3D"=
text-align:left" dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 .smp_boot_secondar=
y =3D npcm7xx_smp_boot_secondary,</div><div style=3D"text-align:left" dir=
=3D"ltr">&gt; +};</div><div style=3D"text-align:left" dir=3D"ltr">&gt; +</d=
iv><div style=3D"text-align:left" dir=3D"ltr">&gt; +CPU_METHOD_OF_DECLARE(n=
pcm7xx_smp, &quot;nuvoton,npcm7xx-smp&quot;, &amp;npcm7xx_smp_ops);</div><d=
iv style=3D"text-align:left" dir=3D"ltr">&gt; --</div><div style=3D"text-al=
ign:left" dir=3D"ltr">&gt; 2.14.1.581.gf28d330327-goog</div><div style=3D"t=
ext-align:left" dir=3D"ltr">&gt;</div></div>

--001a113e39486d0c9905588b3b33--
