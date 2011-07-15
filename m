From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/3] arm: exynos4: Add a new Exynos4210 device tree
	enabled machine
Date: Fri, 15 Jul 2011 12:49:35 -0600
Message-ID: <20110715184935.GD2833@ponder.secretlab.ca>
References: <1310730128-4243-1-git-send-email-thomas.abraham@linaro.org>
	<1310730128-4243-4-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1310730128-4243-4-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 15, 2011 at 05:12:08PM +0530, Thomas Abraham wrote:
> Basic Exynos4210 machine with device tree support that can boot on a
> Exynos4210 processor based board and bring up the console.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Hey Thomas,

The patch looks pretty good.  Comments below.

> ---
>  Documentation/devicetree/bindings/arm/samsung.txt |   10 +-
>  arch/arm/mach-exynos4/Kconfig                     |   10 ++
>  arch/arm/mach-exynos4/Makefile                    |    1 +
>  arch/arm/mach-exynos4210-dt.c                     |  128 +++++++++++++++++++++

This file is getting put in the wrong place.

>  4 files changed, 144 insertions(+), 5 deletions(-)
>  create mode 100644 arch/arm/mach-exynos4210-dt.c
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung.txt b/Documentation/devicetree/bindings/arm/samsung.txt
> index 594cb97..5b123dc 100644
> --- a/Documentation/devicetree/bindings/arm/samsung.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung.txt
> @@ -1,9 +1,9 @@
> -Samsung Exynos4 S5PV310 SoC based SMDKV310 eval board
> +Samsung Exynos4210 architecture based SMDKV310 eval board
>  
> -    SMDKV310 eval board is based on S5PV310 SoC which belongs to
> -    Samsung's Exynos4 family of application processors.
> +    SMDKV310 eval board is based on Samsung's Exynos4 family of
> +    application processors.
>  
>  Required root node properties:
> -    - compatible = "samsung,smdkv310","samsung,s5pv310"
> +    - compatible = "samsung,smdkv310", "samsung,exynos4210'.
>          (a) "samsung,smdkv310" - for Samsung's SMDKV310 eval board.
> -        (b) "samsung,s5pv310"  - for boards based on S5PV310 SoC.
> +	(c) "samsung,exynos4210" - for boards based on Exynos4210 processor.

Inconsistent whitespace.  The rest of this comment block is using
spaces for indentation.

> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index 1435fc3..205664f 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -186,6 +186,16 @@ config MACH_NURI
>  	help
>  	  Machine support for Samsung Mobile NURI Board.
>  
> +config MACH_EXYNOS4210_DT
> +	bool "Samsung's Exynos4210 Machine with DT support"

bool "Samsung Exynos4 Machine using device tree"

This file should be suitable for multiple Exynos4 SoCs and boards.

> +	select CPU_EXYNOS4210
> +	select USE_OF
> +	select S3C_DEV_HSMMC
> +	select S3C_DEV_HSMMC2
> +	select EXYNOS4_SETUP_SDHCI
> +	help
> +	  Machine support for Samsung Exynos4210 machine with device tree enabled.
> +
>  endmenu
>  
>  comment "Configuration for HSMMC bus width"
> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Makefile
> index 60fe5ec..2625dc4 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_MACH_SMDKV310)		+= mach-smdkv310.o
>  obj-$(CONFIG_MACH_ARMLEX4210)		+= mach-armlex4210.o
>  obj-$(CONFIG_MACH_UNIVERSAL_C210)	+= mach-universal_c210.o
>  obj-$(CONFIG_MACH_NURI)			+= mach-nuri.o
> +obj-$(CONFIG_MACH_EXYNOS4210_DT)	+= mach-exynos4-dt.o
>  
>  # device support
>  
> diff --git a/arch/arm/mach-exynos4210-dt.c b/arch/arm/mach-exynos4210-dt.c
> new file mode 100644
> index 0000000..33809e4
> --- /dev/null
> +++ b/arch/arm/mach-exynos4210-dt.c
> @@ -0,0 +1,126 @@
> +/*
> + * Samsung's Exynos4210 device tree enabled machine.
> + *
> + * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + * Copyright (c) 2010-2011 Linaro Ltd.
> + *		www.linaro.org
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/serial_core.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/of_platform.h>
> +#include <linux/irq.h>
> +
> +#include <asm/mach/arch.h>
> +#include <asm/mach-types.h>
> +
> +#include <plat/regs-serial.h>
> +#include <plat/exynos4.h>
> +#include <plat/cpu.h>
> +#include <plat/sdhci.h>
> +
> +#include <mach/map.h>
> +
> +/* Following are default values for UCON, ULCON and UFCON UART registers */
> +#define SMDKV310_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
> +				 S3C2410_UCON_RXILEVEL |	\
> +				 S3C2410_UCON_TXIRQMODE |	\
> +				 S3C2410_UCON_RXIRQMODE |	\
> +				 S3C2410_UCON_RXFIFO_TOI |	\
> +				 S3C2443_UCON_RXERR_IRQEN)
> +
> +#define SMDKV310_UFCON_DEFAULT	(S3C2410_UFCON_FIFOMODE |	\
> +				 S5PV210_UFCON_TXTRIG4 |	\
> +				 S5PV210_UFCON_RXTRIG4)
> +
> +static struct s3c2410_uartcfg smdkv310_uartcfgs[] __initdata = {
> +	[0] = {
> +		.hwport		= 0,
> +		.ucon		= SMDKV310_UCON_DEFAULT,
> +		.ufcon		= SMDKV310_UFCON_DEFAULT,
> +	},
> +	[1] = {
> +		.hwport		= 1,
> +		.ucon		= SMDKV310_UCON_DEFAULT,
> +		.ufcon		= SMDKV310_UFCON_DEFAULT,
> +	},
> +	[2] = {
> +		.hwport		= 2,
> +		.ucon		= SMDKV310_UCON_DEFAULT,
> +		.ufcon		= SMDKV310_UFCON_DEFAULT,
> +	},
> +	[3] = {
> +		.hwport		= 3,
> +		.ucon		= SMDKV310_UCON_DEFAULT,
> +		.ufcon		= SMDKV310_UFCON_DEFAULT,
> +	},
> +};

And you're working on eventually eliminating this, correct?

> +
> +static struct s3c_sdhci_platdata smdkv310_hsmmc0_pdata __initdata = {
> +	.cd_type		= S3C_SDHCI_CD_INTERNAL,
> +	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
> +#ifdef CONFIG_EXYNOS4_SDHCI_CH0_8BIT
> +	.max_width		= 8,
> +	.host_caps		= MMC_CAP_8_BIT_DATA,
> +#endif
> +};
> +
> +static struct s3c_sdhci_platdata smdkv310_hsmmc2_pdata __initdata = {
> +	.cd_type		= S3C_SDHCI_CD_INTERNAL,
> +	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
> +#ifdef CONFIG_EXYNOS4_SDHCI_CH2_8BIT
> +	.max_width		= 8,
> +	.host_caps		= MMC_CAP_8_BIT_DATA,
> +#endif

These parameters can definitely be obtained from the device tree right
now with simple property reads in the device driver.  It is not a hard
conversion.  I would drop the s3c_hsmmc*_def_platdata tables from this
file.

Since this is a new board support file, it should be just fine to
merge this code without the platdata hunks, even if it takes a little
bit longer to add the decoding to the sdhci driver.

> +};
> +
> +static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
> +	OF_DEV_AUXDATA("samsung,s3c-sdhci", EXYNOS4_PA_HSMMC(2),
> +				"s3c-sdhci.2", &s3c_hsmmc2_def_platdata),
> +	OF_DEV_AUXDATA("samsung,s3c-sdhci", EXYNOS4_PA_HSMMC(0),
> +				"s3c-sdhci.0", &s3c_hsmmc0_def_platdata),
> +	{},
> +};

It would be helpful to put a comment block on this table describing
that it is necessary to get things working, but will be eliminated in
the future.  (I'm assuming that setting the device name to
"s3c-sdhci.*" is important.  If this table is only for the platdata,
then it can be removed immediately.

> +
> +static void __init exynos4_dt_map_io(void)
> +{
> +	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> +	s3c24xx_init_clocks(24000000);
> +	s3c24xx_init_uarts(smdkv310_uartcfgs, ARRAY_SIZE(smdkv310_uartcfgs));
> +}
> +
> +static const struct of_device_id intc_of_match[] __initconst = {
> +	{ .compatible = "samsung,exynos4-gic", },
> +	{}
> +};
> +
> +static void __init exynos4_dt_machine_init(void)
> +{
> +	s3c_sdhci0_set_platdata(&smdkv310_hsmmc0_pdata);
> +	s3c_sdhci2_set_platdata(&smdkv310_hsmmc2_pdata);
> +
> +	irq_domain_generate_simple(intc_of_match, EXYNOS4_PA_GIC_DIST, 0);
> +	of_platform_populate(NULL, of_default_bus_match_table,
> +				exynos4_auxdata_lookup, NULL);
> +}
> +
> +static char const *exynos4_dt_compat[] __initdata = {
> +	"samsung,exynos4210",
> +	NULL
> +};
> +
> +DT_MACHINE_START(SMDKV310, "Samsung Exynos4 DT")
> +	/* Maintainer: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */
> +	.boot_params	= S5P_PA_SDRAM + 0x100,

Drop .boot_params.  It isn't used for DT booting.

> +	.init_irq	= exynos4_init_irq,
> +	.map_io		= exynos4_dt_map_io,
> +	.init_machine	= exynos4_dt_machine_init,
> +	.timer		= &exynos4_timer,
> +	.dt_compat	= exynos4_dt_compat,
> +MACHINE_END
> -- 
> 1.7.1
> 
