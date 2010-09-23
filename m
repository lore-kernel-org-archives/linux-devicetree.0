From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/7] Samsung: SMDKV210 - Add basic Device Tree Support
	This patch enables the SMDKV210 to boot using the device tree method.
	The
	board initialisation routines are moved to a seperate file for device
	tree
	probing.When device tree is not enabled, the board boots with the normal
	boot mechanism.
Date: Thu, 23 Sep 2010 13:51:25 -0600
Message-ID: <20100923195125.GC17400@angua.secretlab.ca>
References: <1284977974-30747-1-git-send-email-shaju.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1284977974-30747-1-git-send-email-shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 20, 2010 at 03:49:34PM +0530, Shaju Abraham wrote:
> Signed-off-by: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/Kconfig                         |    8 ++
>  arch/arm/mach-s5pv210/Kconfig            |   15 ++++
>  arch/arm/mach-s5pv210/Makefile           |    1 +
>  arch/arm/mach-s5pv210/mach-smdkv210_dt.c |  121 ++++++++++++++++++++++++++++++
>  4 files changed, 145 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-s5pv210/mach-smdkv210_dt.c
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index a63f7c2..dd721fd 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1383,6 +1383,14 @@ endmenu
>  
>  menu "Boot options"
>  
> +config USE_OF
> +        bool "Flattened Device Tree support"
> +        select OF
> +        select OF_FLATTREE
> +        help
> +          Include support for flattened device tree machine descriptions.
> +
> +

Hmmm, this approach looks troublesome when looking at the rest of the
patch series.  I don't think this config symbol should be needed.

>  config ARM_EMBEDDED_DTB
>  	string "Embedded device tree blob" if OF
>  	default ""
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> index 307a21d..74a6cbe 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -78,6 +78,21 @@ config MACH_SMDKV210
>  	help
>  	  Machine support for Samsung SMDKV210
>  
> +config MACH_SMDKV210_DT
> +       bool "SMDKV210-DT"
> +       select OF
> +       select OF_FLATTREE
> +       select CPU_S5PV210
> +       select ARCH_SPARSEMEM_ENABLE
> +       select SAMSUNG_DEV_ADC
> +       select SAMSUNG_DEV_TS
> +       select S3C_DEV_WDT
> +       select HAVE_S3C2410_WATCHDOG
> +       help
> +         Machine support for Samsung SMDKV210-Device Tree
> +
> +
> +
>  config MACH_SMDKC110
>  	bool "SMDKC110"
>  	select CPU_S5PV210
> diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/Makefile
> index 74dbd76..f0944a9 100644
> --- a/arch/arm/mach-s5pv210/Makefile
> +++ b/arch/arm/mach-s5pv210/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_S5PV210_USE_NONCOMMON_STRUCT_CLK) += clock.o
>  
>  obj-$(CONFIG_MACH_AQUILA)	+= mach-aquila.o
>  obj-$(CONFIG_MACH_SMDKV210)	+= mach-smdkv210.o
> +obj-$(CONFIG_MACH_SMDKV210_DT) += mach-smdkv210_dt.o
>  obj-$(CONFIG_MACH_SMDKC110)	+= mach-smdkc110.o
>  obj-$(CONFIG_MACH_GONI)		+= mach-goni.o
>  
> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210_dt.c b/arch/arm/mach-s5pv210/mach-smdkv210_dt.c
> new file mode 100644
> index 0000000..679401b
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/mach-smdkv210_dt.c
> @@ -0,0 +1,121 @@
> +/* linux/arch/arm/mach-s5pv210/mach-smdkv210_dt.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/serial_core.h>
> +#include <linux/dm9000.h>
> +#include <linux/gpio.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_clk.h>
> +
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +
> +
> +#include <asm/mach/arch.h>
> +#include <asm/hardware/vic.h>
> +#include <asm/mach/map.h>
> +#include <asm/setup.h>
> +#include <asm/mach-types.h>
> +
> +#include <mach/map.h>
> +
> +#include <mach/regs-clock.h>
> +
> +#include <plat/regs-serial.h>
> +#include <plat/s5pv210.h>
> +#include <plat/devs.h>
> +#include <plat/cpu.h>
> +#include <plat/adc.h>
> +#include <plat/ts.h>
> +
> +
> +
> +/* Following are default values for UCON, ULCON and UFCON UART registers */
> +#define SMDKV210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
> +				 S3C2410_UCON_RXILEVEL |	\
> +				 S3C2410_UCON_TXIRQMODE |	\
> +				 S3C2410_UCON_RXIRQMODE |	\
> +				 S3C2410_UCON_RXFIFO_TOI |	\
> +				 S3C2443_UCON_RXERR_IRQEN)
> +
> +#define SMDKV210_ULCON_DEFAULT	S3C2410_LCON_CS8
> +
> +#define SMDKV210_UFCON_DEFAULT	(S3C2410_UFCON_FIFOMODE |	\
> +				 S5PV210_UFCON_TXTRIG4 |	\
> +				 S5PV210_UFCON_RXTRIG4)
> +
> +static struct s3c2410_uartcfg smdkv210_uartcfgs[] __initdata = {
> +	[0] = {
> +		.hwport		= 0,
> +		.flags		= 0,
> +		.ucon		= SMDKV210_UCON_DEFAULT,
> +		.ulcon		= SMDKV210_ULCON_DEFAULT,
> +		.ufcon		= SMDKV210_UFCON_DEFAULT,
> +	},
> +	[1] = {
> +		.hwport		= 1,
> +		.flags		= 0,
> +		.ucon		= SMDKV210_UCON_DEFAULT,
> +		.ulcon		= SMDKV210_ULCON_DEFAULT,
> +		.ufcon		= SMDKV210_UFCON_DEFAULT,
> +	},
> +	[2] = {
> +		.hwport		= 2,
> +		.flags		= 0,
> +		.ucon		= SMDKV210_UCON_DEFAULT,
> +		.ulcon		= SMDKV210_ULCON_DEFAULT,
> +		.ufcon		= SMDKV210_UFCON_DEFAULT,
> +	},
> +	[3] = {
> +		.hwport		= 3,
> +		.flags		= 0,
> +		.ucon		= SMDKV210_UCON_DEFAULT,
> +		.ulcon		= SMDKV210_ULCON_DEFAULT,
> +		.ufcon		= SMDKV210_UFCON_DEFAULT,
> +	},
> +};

This looks like data that should be populated from parsing the device
tree.  It shouldn't be implemented as statically allocated tables.

> +static void __init smdkv210_map_io(void)
> +{
> +	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> +	s3c24xx_init_clocks(24000000);
> +	s3c24xx_init_uarts(smdkv210_uartcfgs, ARRAY_SIZE(smdkv210_uartcfgs));

As mentioned above, uart initialization data should be extracted from
the device tree.  However, this isn't a showstopper issue, and I won't
Nack the patch over it.  It just makes the board support more verbose
than it needs to be.

> +}
> +
> +static void __init smdkv210_dt_init(void)
> +{
> +	struct device_node *node;

'node' isn't used

> +	of_clk_fixed_parse();
> +	of_platform_bus_probe(NULL, NULL, NULL);
> +}
> +
> +static int __init smdkv210_dt_probe(unsigned long dt)
> +{
> +	if (!of_flat_dt_is_compatible(dt, "samsung,smdkv210"))
> +		return 0;
> +
> +	return 1;
> +}
> +
> +DT_MACHINE_START(SMDKV210, "SMDKV210 (Device Tree Support)")
> +	.boot_params	= 0x00000100,
> +	.map_io		= smdkv210_map_io,
> +	.init_irq	= s5pv210_init_irq,
> +	.init_machine	= smdkv210_dt_init,
> +	.timer		= &s3c24xx_timer,
> +	.probe_dt	= smdkv210_dt_probe,
> +MACHINE_END
> -- 
> 1.7.2
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
