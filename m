From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 4/7] Samsung: SMDKV210 Init VIC  using Device Tree
Date: Thu, 23 Sep 2010 14:00:31 -0600
Message-ID: <20100923200031.GD17400@angua.secretlab.ca>
References: <1284977986-30777-1-git-send-email-shaju.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1284977986-30777-1-git-send-email-shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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

On Mon, Sep 20, 2010 at 03:49:46PM +0530, Shaju Abraham wrote:
> SMDKV210 has 4 VICs. Use the device tree to get the virtual and
> physical address and the bit mask for the populted IRQ on each
> VIC.
> The DT probing of VIC is moved to a seperate file which gets compiled
> only if device tree support is enabled
> 
> Signed-off-by: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/mach-s5pv210/cpu.c              |    3 +-
>  arch/arm/mach-s5pv210/mach-smdkv210_dt.c |    9 +++-
>  arch/arm/plat-s5p/Makefile               |    4 +
>  arch/arm/plat-s5p/irq_dt.c               |   98 ++++++++++++++++++++++++++++++
>  4 files changed, 112 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/plat-s5p/irq_dt.c
> 
> diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
> index 411a4a9..94165b7 100644
> --- a/arch/arm/mach-s5pv210/cpu.c
> +++ b/arch/arm/mach-s5pv210/cpu.c
> @@ -103,6 +103,7 @@ void __init s5pv210_init_clocks(int xtal)
>  	s5pv210_setup_clocks();
>  }
>  
> +#ifndef CONFIG_USE_OF
>  void __init s5pv210_init_irq(void)
>  {
>  	u32 vic[4];	/* S5PV210 supports 4 VIC */
> @@ -115,7 +116,7 @@ void __init s5pv210_init_irq(void)
>  
>  	s5p_init_irq(vic, ARRAY_SIZE(vic));
>  }
> -
> +#endif

Don't do this.  This means that you cannot build a kernel that
supports both device tree and atags at the same time.  Adding device
tree support must not break existing platforms.  Just leave the
existing irq setup code in place, but don't call it from the dt
enabled platform setup code.

>  struct sysdev_class s5pv210_sysclass = {
>  	.name	= "s5pv210-core",
>  };
> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210_dt.c b/arch/arm/mach-s5pv210/mach-smdkv210_dt.c
> index 679401b..d0e930c 100644
> --- a/arch/arm/mach-s5pv210/mach-smdkv210_dt.c
> +++ b/arch/arm/mach-s5pv210/mach-smdkv210_dt.c
> @@ -41,6 +41,7 @@
>  #include <plat/ts.h>
>  
>  
> +extern void s5p_dt_init_irq(void);
>  
>  /* Following are default values for UCON, ULCON and UFCON UART registers */
>  #define SMDKV210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
> @@ -88,6 +89,12 @@ static struct s3c2410_uartcfg smdkv210_uartcfgs[] __initdata = {
>  };
>  
>  
> +void __init s5pv210_dt_init_irq(void)
> +{
> +	s5p_dt_init_irq();
> +}
> +
> +
>  
>  static void __init smdkv210_map_io(void)
>  {
> @@ -114,7 +121,7 @@ static int __init smdkv210_dt_probe(unsigned long dt)
>  DT_MACHINE_START(SMDKV210, "SMDKV210 (Device Tree Support)")
>  	.boot_params	= 0x00000100,
>  	.map_io		= smdkv210_map_io,
> -	.init_irq	= s5pv210_init_irq,
> +	.init_irq	= s5pv210_dt_init_irq,

s5p_dt_init_irq() should be used directly here.  No need for the
extran s5pv210_dt_init_irq() function.

>  	.init_machine	= smdkv210_dt_init,
>  	.timer		= &s3c24xx_timer,
>  	.probe_dt	= smdkv210_dt_probe,
> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
> index cdfb78d..e4d7218 100644
> --- a/arch/arm/plat-s5p/Makefile
> +++ b/arch/arm/plat-s5p/Makefile
> @@ -16,6 +16,10 @@ obj-y				+= dev-uart.o
>  obj-y				+= cpu.o
>  obj-$(CONFIG_USE_NONCOMMON_STRUCT_CLK) += clock.o
>  obj-$(CONFIG_USE_COMMON_STRUCT_CLK)            += clock-common-clk.o
> +ifeq ($(CONFIG_USE_OF),y)
> +obj-y				+= irq_dt.o
> +else
>  obj-y				+= irq.o
> +endif

Ditto here the point about building multiplatform kernels.

>  obj-$(CONFIG_S5P_EXT_INT)	+= irq-eint.o
>  
> diff --git a/arch/arm/plat-s5p/irq_dt.c b/arch/arm/plat-s5p/irq_dt.c
> new file mode 100644
> index 0000000..2fca196
> --- /dev/null
> +++ b/arch/arm/plat-s5p/irq_dt.c
> @@ -0,0 +1,98 @@
> +/* arch/arm/plat-s5p/irq_dt.c
> + *
> + * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S5P - Interrupt handling
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +
> +
> +#include <asm/hardware/vic.h>
> +
> +#include <linux/serial_core.h>
> +#include <mach/map.h>
> +#include <plat/regs-timer.h>
> +#include <plat/regs-serial.h>
> +#include <plat/cpu.h>
> +#include <plat/irq-vic-timer.h>
> +#include <plat/irq-uart.h>
> +
> +/*
> + * Note, we make use of the fact that the parent IRQs, IRQ_UART[0..3]
> + * are consecutive when looking up the interrupt in the demux routines.
> + */
> +static struct s3c_uart_irq uart_irqs[] = {
> +	[0] = {
> +		.regs		= S5P_VA_UART0,
> +		.base_irq	= IRQ_S5P_UART_BASE0,
> +		.parent_irq	= IRQ_UART0,
> +	},
> +	[1] = {
> +		.regs		= S5P_VA_UART1,
> +		.base_irq	= IRQ_S5P_UART_BASE1,
> +		.parent_irq	= IRQ_UART1,
> +	},
> +	[2] = {
> +		.regs		= S5P_VA_UART2,
> +		.base_irq	= IRQ_S5P_UART_BASE2,
> +		.parent_irq	= IRQ_UART2,
> +	},
> +#if CONFIG_SERIAL_SAMSUNG_UARTS > 3
> +	[3] = {
> +		.regs		= S5P_VA_UART3,
> +		.base_irq	= IRQ_S5P_UART_BASE3,
> +		.parent_irq	= IRQ_UART3,
> +	},
> +#endif
> +};

(as discussed elsewhere) irq numbers really need to be dynamically
allocated for each interrupt controller.  We're trying to move away
from these static definitions.

> +
> +
> +static int __init s5p_dt_vic_init(void)
> +{
> +	struct device_node *node;
> +	struct resource r;
> +	int err = -ENODEV , irq = 0;
> +	const u32 *prop;
> +	u32 virt_reg = 0, src_mask = 0;
> +
> +	for_each_compatible_node(node , NULL  , "arm,vic") {
> +		err = of_address_to_resource(node, 0 , &r);
> +		prop = of_get_property(node, "virtual-reg" , NULL);
> +		if (prop)
> +			virt_reg = of_read_number(prop, 1);

Why is the virtual address specified in the device tree?  The kernel
should be able to allocate a range of the virtual address space by
ioremapping the physical address.

> +		prop = of_get_property(node, "irq-src", NULL);
> +		if (prop)
> +			src_mask = of_read_number(prop, 1);
> +		vic_init((void __iomem __force *) virt_reg, VIC_BASE(irq), src_mask, 0);
> +		irq++;
> +	}
> +	of_node_put(node);
> +	return err;
> +}
> +
> +void __init s5p_dt_init_irq(void)
> +{
> +
> +	/* initialize the VICs */
> +	s5p_dt_vic_init();
> +	s3c_init_vic_timer_irq(IRQ_TIMER0_VIC, IRQ_TIMER0);
> +	s3c_init_vic_timer_irq(IRQ_TIMER1_VIC, IRQ_TIMER1);
> +	s3c_init_vic_timer_irq(IRQ_TIMER2_VIC, IRQ_TIMER2);
> +	s3c_init_vic_timer_irq(IRQ_TIMER3_VIC, IRQ_TIMER3);
> +	s3c_init_vic_timer_irq(IRQ_TIMER4_VIC, IRQ_TIMER4);

Should be initialized with a loop overs all "samsung,s3c2410-timer"
compatible nodes.  Better yet, the timers can probably be implemented
as regular platform_devices.

> +
> +	s3c_init_uart_irqs(uart_irqs, ARRAY_SIZE(uart_irqs));
> +}
> -- 
> 1.7.2
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
