From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] arm: exynos4: Add a new Exynos4210 device tree
	enabled machine
Date: Sun, 17 Jul 2011 09:31:44 +0530
Message-ID: <CAJuYYwTJfc5ZnoGL7o1swVS9XBQQa+aR37eJsNL__GnHBM3z4A@mail.gmail.com>
References: <1310730128-4243-1-git-send-email-thomas.abraham@linaro.org>
	<1310730128-4243-4-git-send-email-thomas.abraham@linaro.org>
	<20110715184935.GD2833@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110715184935.GD2833-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On 16 July 2011 00:19, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Fri, Jul 15, 2011 at 05:12:08PM +0530, Thomas Abraham wrote:
>> Basic Exynos4210 machine with device tree support that can boot on a
>> Exynos4210 processor based board and bring up the console.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Hey Thomas,
>
> The patch looks pretty good. =A0Comments below.
>
>> ---
>> =A0Documentation/devicetree/bindings/arm/samsung.txt | =A0 10 +-
>> =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 10 ++
>> =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A01 +
>> =A0arch/arm/mach-exynos4210-dt.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0128 +++++++++++++++++++++
>
> This file is getting put in the wrong place.

Sorry. I messed it up.

>
>> =A04 files changed, 144 insertions(+), 5 deletions(-)
>> =A0create mode 100644 arch/arm/mach-exynos4210-dt.c
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung.txt b/Documen=
tation/devicetree/bindings/arm/samsung.txt
>> index 594cb97..5b123dc 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung.txt
>> +++ b/Documentation/devicetree/bindings/arm/samsung.txt
>> @@ -1,9 +1,9 @@
>> -Samsung Exynos4 S5PV310 SoC based SMDKV310 eval board
>> +Samsung Exynos4210 architecture based SMDKV310 eval board
>>
>> - =A0 =A0SMDKV310 eval board is based on S5PV310 SoC which belongs to
>> - =A0 =A0Samsung's Exynos4 family of application processors.
>> + =A0 =A0SMDKV310 eval board is based on Samsung's Exynos4 family of
>> + =A0 =A0application processors.
>>
>> =A0Required root node properties:
>> - =A0 =A0- compatible =3D "samsung,smdkv310","samsung,s5pv310"
>> + =A0 =A0- compatible =3D "samsung,smdkv310", "samsung,exynos4210'.
>> =A0 =A0 =A0 =A0 =A0(a) "samsung,smdkv310" - for Samsung's SMDKV310 eval =
board.
>> - =A0 =A0 =A0 =A0(b) "samsung,s5pv310" =A0- for boards based on S5PV310 =
SoC.
>> + =A0 =A0 (c) "samsung,exynos4210" - for boards based on Exynos4210 proc=
essor.
>
> Inconsistent whitespace. =A0The rest of this comment block is using
> spaces for indentation.
>
>> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconf=
ig
>> index 1435fc3..205664f 100644
>> --- a/arch/arm/mach-exynos4/Kconfig
>> +++ b/arch/arm/mach-exynos4/Kconfig
>> @@ -186,6 +186,16 @@ config MACH_NURI
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Machine support for Samsung Mobile NURI Board.
>>
>> +config MACH_EXYNOS4210_DT
>> + =A0 =A0 bool "Samsung's Exynos4210 Machine with DT support"
>
> bool "Samsung Exynos4 Machine using device tree"
>
> This file should be suitable for multiple Exynos4 SoCs and boards.

Ok. This will be changed to Exynos4.

>
>> + =A0 =A0 select CPU_EXYNOS4210
>> + =A0 =A0 select USE_OF
>> + =A0 =A0 select S3C_DEV_HSMMC
>> + =A0 =A0 select S3C_DEV_HSMMC2
>> + =A0 =A0 select EXYNOS4_SETUP_SDHCI
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Machine support for Samsung Exynos4210 machine with device=
 tree enabled.
>> +
>> =A0endmenu
>>
>> =A0comment "Configuration for HSMMC bus width"
>> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Make=
file
>> index 60fe5ec..2625dc4 100644
>> --- a/arch/arm/mach-exynos4/Makefile
>> +++ b/arch/arm/mach-exynos4/Makefile
>> @@ -36,6 +36,7 @@ obj-$(CONFIG_MACH_SMDKV310) =A0 =A0 =A0 =A0 +=3D mach-=
smdkv310.o
>> =A0obj-$(CONFIG_MACH_ARMLEX4210) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D mac=
h-armlex4210.o
>> =A0obj-$(CONFIG_MACH_UNIVERSAL_C210) =A0 =A0+=3D mach-universal_c210.o
>> =A0obj-$(CONFIG_MACH_NURI) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=
=3D mach-nuri.o
>> +obj-$(CONFIG_MACH_EXYNOS4210_DT) =A0 =A0 +=3D mach-exynos4-dt.o
>>
>> =A0# device support
>>
>> diff --git a/arch/arm/mach-exynos4210-dt.c b/arch/arm/mach-exynos4210-dt=
.c
>> new file mode 100644
>> index 0000000..33809e4
>> --- /dev/null
>> +++ b/arch/arm/mach-exynos4210-dt.c
>> @@ -0,0 +1,126 @@
>> +/*
>> + * Samsung's Exynos4210 device tree enabled machine.
>> + *
>> + * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
>> + * Copyright (c) 2010-2011 Linaro Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 www.linaro.org
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +#include <linux/serial_core.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/io.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/irq.h>
>> +
>> +#include <asm/mach/arch.h>
>> +#include <asm/mach-types.h>
>> +
>> +#include <plat/regs-serial.h>
>> +#include <plat/exynos4.h>
>> +#include <plat/cpu.h>
>> +#include <plat/sdhci.h>
>> +
>> +#include <mach/map.h>
>> +
>> +/* Following are default values for UCON, ULCON and UFCON UART register=
s */
>> +#define SMDKV310_UCON_DEFAULT =A0 =A0 =A0 =A0(S3C2410_UCON_TXILEVEL | =
=A0 =A0 =A0 =A0\
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_UCO=
N_RXILEVEL | =A0 =A0 =A0 =A0\
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_UCO=
N_TXIRQMODE | =A0 =A0 =A0 \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_UCO=
N_RXIRQMODE | =A0 =A0 =A0 \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_UCO=
N_RXFIFO_TOI | =A0 =A0 =A0\
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2443_UCO=
N_RXERR_IRQEN)
>> +
>> +#define SMDKV310_UFCON_DEFAULT =A0 =A0 =A0 (S3C2410_UFCON_FIFOMODE | =
=A0 =A0 =A0 \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_UFC=
ON_TXTRIG4 | =A0 =A0 =A0 =A0\
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_UFC=
ON_RXTRIG4)
>> +
>> +static struct s3c2410_uartcfg smdkv310_uartcfgs[] __initdata =3D {
>> + =A0 =A0 [0] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 0,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV310_UCON_DE=
FAULT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV310_UFCON_D=
EFAULT,
>> + =A0 =A0 },
>> + =A0 =A0 [1] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV310_UCON_DE=
FAULT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV310_UFCON_D=
EFAULT,
>> + =A0 =A0 },
>> + =A0 =A0 [2] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 2,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV310_UCON_DE=
FAULT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV310_UFCON_D=
EFAULT,
>> + =A0 =A0 },
>> + =A0 =A0 [3] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 3,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV310_UCON_DE=
FAULT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV310_UFCON_D=
EFAULT,
>> + =A0 =A0 },
>> +};
>
> And you're working on eventually eliminating this, correct?

Yes. This will be eventually elimnated. This is temporary.

>
>> +
>> +static struct s3c_sdhci_platdata smdkv310_hsmmc0_pdata __initdata =3D {
>> + =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_CD_INTER=
NAL,
>> + =A0 =A0 .clk_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D S3C_SDHCI_CLK_DIV_EX=
TERNAL,
>> +#ifdef CONFIG_EXYNOS4_SDHCI_CH0_8BIT
>> + =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 8,
>> + =A0 =A0 .host_caps =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D MMC_CAP_8_BIT_DATA,
>> +#endif
>> +};
>> +
>> +static struct s3c_sdhci_platdata smdkv310_hsmmc2_pdata __initdata =3D {
>> + =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_CD_INTER=
NAL,
>> + =A0 =A0 .clk_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D S3C_SDHCI_CLK_DIV_EX=
TERNAL,
>> +#ifdef CONFIG_EXYNOS4_SDHCI_CH2_8BIT
>> + =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 8,
>> + =A0 =A0 .host_caps =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D MMC_CAP_8_BIT_DATA,
>> +#endif
>
> These parameters can definitely be obtained from the device tree right
> now with simple property reads in the device driver. =A0It is not a hard
> conversion. =A0I would drop the s3c_hsmmc*_def_platdata tables from this
> file.
>
> Since this is a new board support file, it should be just fine to
> merge this code without the platdata hunks, even if it takes a little
> bit longer to add the decoding to the sdhci driver.

These parameters will be moved to dts file and driver will be updated
to retreive it from dtb.

>
>> +};
>> +
>> +static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst=
 =3D {
>> + =A0 =A0 OF_DEV_AUXDATA("samsung,s3c-sdhci", EXYNOS4_PA_HSMMC(2),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "s3c-sdhci.2",=
 &s3c_hsmmc2_def_platdata),
>> + =A0 =A0 OF_DEV_AUXDATA("samsung,s3c-sdhci", EXYNOS4_PA_HSMMC(0),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "s3c-sdhci.0",=
 &s3c_hsmmc0_def_platdata),
>> + =A0 =A0 {},
>> +};
>
> It would be helpful to put a comment block on this table describing
> that it is necessary to get things working, but will be eliminated in
> the future. =A0(I'm assuming that setting the device name to
> "s3c-sdhci.*" is important. =A0If this table is only for the platdata,
> then it can be removed immediately.

The device name is important. I will add a comment as you have suggsted.

>
>> +
>> +static void __init exynos4_dt_map_io(void)
>> +{
>> + =A0 =A0 s5p_init_io(NULL, 0, S5P_VA_CHIPID);
>> + =A0 =A0 s3c24xx_init_clocks(24000000);
>> + =A0 =A0 s3c24xx_init_uarts(smdkv310_uartcfgs, ARRAY_SIZE(smdkv310_uart=
cfgs));
>> +}
>> +
>> +static const struct of_device_id intc_of_match[] __initconst =3D {
>> + =A0 =A0 { .compatible =3D "samsung,exynos4-gic", },
>> + =A0 =A0 {}
>> +};
>> +
>> +static void __init exynos4_dt_machine_init(void)
>> +{
>> + =A0 =A0 s3c_sdhci0_set_platdata(&smdkv310_hsmmc0_pdata);
>> + =A0 =A0 s3c_sdhci2_set_platdata(&smdkv310_hsmmc2_pdata);
>> +
>> + =A0 =A0 irq_domain_generate_simple(intc_of_match, EXYNOS4_PA_GIC_DIST,=
 0);
>> + =A0 =A0 of_platform_populate(NULL, of_default_bus_match_table,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_auxdat=
a_lookup, NULL);
>> +}
>> +
>> +static char const *exynos4_dt_compat[] __initdata =3D {
>> + =A0 =A0 "samsung,exynos4210",
>> + =A0 =A0 NULL
>> +};
>> +
>> +DT_MACHINE_START(SMDKV310, "Samsung Exynos4 DT")
>> + =A0 =A0 /* Maintainer: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
>> + =A0 =A0 .boot_params =A0 =A0=3D S5P_PA_SDRAM + 0x100,
>
> Drop .boot_params. =A0It isn't used for DT booting.

Ok. I will remove it.

Thanks,
Thomas.

>
>> + =A0 =A0 .init_irq =A0 =A0 =A0 =3D exynos4_init_irq,
>> + =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D exynos4_dt_map_io,
>> + =A0 =A0 .init_machine =A0 =3D exynos4_dt_machine_init,
>> + =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &exynos4_timer,
>> + =A0 =A0 .dt_compat =A0 =A0 =A0=3D exynos4_dt_compat,
>> +MACHINE_END
>> --
>> 1.7.1
>>
>
