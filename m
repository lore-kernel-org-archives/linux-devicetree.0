From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Wed, 14 Mar 2012 22:22:09 -0400
Message-ID: <20120315022209.GC16189@titan.lakedaemon.net>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203131557.49488.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203131557.49488.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: andrew-g2DYL2Zd6BY@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2012 at 03:57:49PM +0000, Arnd Bergmann wrote:
> On Monday 12 March 2012, Jason Cooper wrote:
> > Also, serial comes up, works without earlyprintk, but says irq = 0.
> > Could be due to the way I setup serial in dtsi/dts.
> 
> Well, in this series you don't have any interrupt-controller node
> in the device tree, so the interrupt number lookup fails for
> any irq you put into the device tree.
> 
> I wanted to understand how this works for myself, so I've tried
> implementing it in the patch below. This probably doesn't work
> right away, but it should give you an idea of what needs to
> be done.
> 
> It is based on the latest irqdomain series from
> git://git.secretlab.ca/git/linux-2.6.git irqdomain/next
> together with your own patches.
> 
> Grant, can you have a look at this? I'm trying to help out
> multiple people right now who are converting a number of platforms
> to devicetree. It would be good to know if I'm giving the right
> recommendations.

Arnd, I got this to compile, however:

> 
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 
> diff --git a/arch/arm/boot/dts/kirkwood.dtsi b/arch/arm/boot/dts/kirkwood.dtsi
> index 3474ef8..762f8e2 100644
> --- a/arch/arm/boot/dts/kirkwood.dtsi
> +++ b/arch/arm/boot/dts/kirkwood.dtsi
> @@ -2,6 +2,7 @@
>  
>  / {
>  	compatible = "mrvl,kirkwood";
> +	interrupt-parent = <&irq>;
>  
>  	ocp@f1000000 {
>  		compatible = "simple-bus";
> @@ -9,6 +10,22 @@
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  
> +		irq: irq@f1020204 {
> +			compatible = "mrvl,kirkwood-irq", "mrvl,orion-irq";
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			reg = <0x20204 0x4 0x14>;
> +		};
> +
> +		gpio: gpio@f1010100 {
> +			compatible = "mrvl,kirkwood-gpio", "mrvl,orion-gpio";
> +			gpio-controller;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			#gpio-cells = <1>;

			interrupts = <...>; /* added as mentioned */

> +			reg = <0x10100 0x40 0x10140 0x40>;

orion_dt_gpio_irq_setup(...) only iterates over the first region (i=0),
which sets the max hwirqs to 32 which causes this WARN_ON():

------------[ cut here ]------------
WARNING: at kernel/irq/irqdomain.c:75
irq_domain_legacy_revmap+0x24/0x7c()
Modules linked in:
[<c000d644>] (unwind_backtrace+0x0/0xf0) from [<c0015484>] (warn_slowpath_common+0x4c/0x64)
[<c0015484>] (warn_slowpath_common+0x4c/0x64) from [<c00154b8>] (warn_slowpath_null+0x1c/0x24)
[<c00154b8>] (warn_slowpath_null+0x1c/0x24) from [<c005b35c>] (irq_domain_legacy_revmap+0x24/0x7c)
[<c005b35c>] (irq_domain_legacy_revmap+0x24/0x7c) from [<c005b608>] (irq_create_mapping+0x20/0x12c)
[<c005b608>] (irq_create_mapping+0x20/0x12c) from [<c005b790>] (irq_create_of_mapping+0x7c/0xf0)
[<c005b790>] (irq_create_of_mapping+0x7c/0xf0) from [<c02d4a5c>] (irq_of_parse_and_map+0x30/0x38)
[<c02d4a5c>] (irq_of_parse_and_map+0x30/0x38) from [<c04fd3b8>] (orion_dt_gpio_irq_setup+0x50/0x108)
[<c04fd3b8>] (orion_dt_gpio_irq_setup+0x50/0x108) from [<c050fdbc>] (of_irq_init+0x164/0x298)
[<c050fdbc>] (of_irq_init+0x164/0x298) from [<c04f90f4>] (init_IRQ+0x14/0x1c)  
[<c04f90f4>] (init_IRQ+0x14/0x1c) from [<c04f7614>] (start_kernel+0x190/0x300)
[<c04f7614>] (start_kernel+0x190/0x300) from [<0000803c>] (0x803c)
---[ end trace 1b75b31a2719ed1c ]---
   hwirq = 35
   first_hwirq = 0
   size = 32

I'll keep digging tomorrow...

Thanks for the help,

Jason.

> +		};
> +
>  		serial@12000 {
>  			compatible = "ns16550a";
>  			reg = <0x12000 0x100>;
> diff --git a/arch/arm/mach-kirkwood/board-dt.c b/arch/arm/mach-kirkwood/board-dt.c
> index 0819240..67a356c 100644
> --- a/arch/arm/mach-kirkwood/board-dt.c
> +++ b/arch/arm/mach-kirkwood/board-dt.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_platform.h>
>  #include <asm/mach/arch.h>
>  #include <asm/mach/map.h>
> +#include <plat/irq.h>
>  #include <mach/bridge-regs.h>
>  #include "common.h"
>  
> @@ -67,7 +68,7 @@ DT_MACHINE_START(KIRKWOOD_DT, "Marvell Kirkwood (Flattened Device Tree)")
>  	/* Maintainer: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> */
>  	.map_io		= kirkwood_map_io,
>  	.init_early	= kirkwood_init_early,
> -	.init_irq	= kirkwood_init_irq,
> +	.init_irq	= orion_dt_init_irq,
>  	.timer		= &kirkwood_timer,
>  	.init_machine	= kirkwood_dt_init,
>  	.restart	= kirkwood_restart,
> diff --git a/arch/arm/mach-kirkwood/irq.c b/arch/arm/mach-kirkwood/irq.c
> index c4c68e5..a0e13d2 100644
> --- a/arch/arm/mach-kirkwood/irq.c
> +++ b/arch/arm/mach-kirkwood/irq.c
> @@ -46,3 +46,4 @@ void __init kirkwood_init_irq(void)
>  	irq_set_chained_handler(IRQ_KIRKWOOD_GPIO_HIGH_16_23,
>  				gpio_irq_handler);
>  }
> +
> diff --git a/arch/arm/plat-orion/include/plat/irq.h b/arch/arm/plat-orion/include/plat/irq.h
> index f05eeab..dc83270 100644
> --- a/arch/arm/plat-orion/include/plat/irq.h
> +++ b/arch/arm/plat-orion/include/plat/irq.h
> @@ -13,5 +13,6 @@
>  
>  void orion_irq_init(unsigned int irq_start, void __iomem *maskaddr);
>  
> +void orion_dt_init_irq(void);
>  
>  #endif
> diff --git a/arch/arm/plat-orion/irq.c b/arch/arm/plat-orion/irq.c
> index 2d5b9c1..2e8e5db 100644
> --- a/arch/arm/plat-orion/irq.c
> +++ b/arch/arm/plat-orion/irq.c
> @@ -12,7 +12,12 @@
>  #include <linux/init.h>
>  #include <linux/irq.h>
>  #include <linux/io.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +
>  #include <plat/irq.h>
> +#include <plat/gpio.h>
>  
>  void __init orion_irq_init(unsigned int irq_start, void __iomem *maskaddr)
>  {
> @@ -32,3 +37,67 @@ void __init orion_irq_init(unsigned int irq_start, void __iomem *maskaddr)
>  	irq_setup_generic_chip(gc, IRQ_MSK(32), IRQ_GC_INIT_MASK_CACHE,
>  			       IRQ_NOREQUEST, IRQ_LEVEL | IRQ_NOPROBE);
>  }
> +
> +#ifdef CONFIG_OF
> +static int __init orion_dt_irq_setup(struct device_node *node, struct device_node *parent)
> +{
> +	int i;
> +	void __iomem *reg;
> +
> +	for (i = 0; (reg = of_iomap(node, i)) != NULL; i++) {
> +		orion_irq_init(i * 32, reg);
> +		irq_domain_add_legacy(node, 32, i * 32, 0,
> +					&irq_domain_simple_ops, NULL);
> +	}
> +
> +	return 0;
> +}
> +
> +static void gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
> +{
> +	orion_gpio_irq_handler((long)irq_data_get_irq_handler_data(&desc->irq_data));
> +}
> +
> +unsigned int irq_orion_gpio_start = 64; /* can be overridden from platform */
> +static int __init orion_dt_gpio_irq_setup(struct device_node *node, struct device_node *parent)
> +{
> +	int i;
> +	void __iomem *reg;
> +	for (i = 0; (reg = of_iomap(node, i)) != NULL; i++) {
> +		int nr_irqs;
> +
> +		for (nr_irqs = 0; nr_irqs < 4; nr_irqs++) {
> +			int parent_irq;
> +			parent_irq = irq_of_parse_and_map(node, i * 4 + nr_irqs);
> +			if (!parent_irq)
> +				break;
> +
> +			irq_domain_add_legacy(node, 8,
> +					irq_orion_gpio_start + nr_irqs * 8,
> +					i * 32 + nr_irqs * 8,
> +					&irq_domain_simple_ops,
> +					(void *)parent_irq);
> +			irq_set_chained_handler(parent_irq, gpio_irq_handler);
> +			irq_set_handler_data(parent_irq,
> +					(void *)(i * 32 + nr_irqs * 8));
> +		}
> +
> +		orion_gpio_init(i * 32, nr_irqs, (u32)reg, 0,
> +				irq_orion_gpio_start);
> +		irq_orion_gpio_start += nr_irqs;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id orion_dt_irq_match[] __initconst = {
> +	{ .compatible = "mrvl,orion-irq", .data = &orion_dt_irq_setup },
> +	{ .compatible = "mrvl,orion-gpio", .data = &orion_dt_gpio_irq_setup },
> +	{ }
> +};
> +
> +void __init orion_dt_init_irq(void)
> +{
> +	of_irq_init(orion_dt_irq_match);
> +}
> +#endif
