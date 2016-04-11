From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] irqchip: add lpc18xx gpio pin interrupt driver
Date: Mon, 11 Apr 2016 17:40:06 +0200
Message-ID: <CAGhQ9VzX1Q8kEUp9_4pz2t9rrYDYce6Tv=++tY61cmj3WtyDVQ@mail.gmail.com>
References: <1459614924-32670-1-git-send-email-manabian@gmail.com>
	<1459614924-32670-2-git-send-email-manabian@gmail.com>
	<570BBF7F.2040001@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <570BBF7F.2040001-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marc,

On 11 April 2016 at 17:15, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi Joachim,
>
> On 02/04/16 17:35, Joachim Eastwood wrote:
>> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> As a start, a commit message would be appreciated.

Ops! I wonder where that disappeared to. The previous version did have one:
https://www.marc.info/?l=devicetree&m=145643797630859&w=3

I'll add it back in the next version.

>> ---
>>  drivers/irqchip/Kconfig                 |   5 +
>>  drivers/irqchip/Makefile                |   1 +
>>  drivers/irqchip/irq-lpc18xx-gpio-pint.c | 219 ++++++++++++++++++++++++++++++++
>>  3 files changed, 225 insertions(+)
>>  create mode 100644 drivers/irqchip/irq-lpc18xx-gpio-pint.c
>>
>> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>> index 3e12479..0278837e 100644
>> --- a/drivers/irqchip/Kconfig
>> +++ b/drivers/irqchip/Kconfig
>> @@ -211,6 +211,11 @@ config KEYSTONE_IRQ
>>               Support for Texas Instruments Keystone 2 IRQ controller IP which
>>               is part of the Keystone 2 IPC mechanism
>>
>> +config LPC18XX_GPIO_PINT
>> +     bool
>> +     select IRQ_DOMAIN
>> +     select GENERIC_IRQ_CHIP
>> +
>>  config MIPS_GIC
>>       bool
>>       select GENERIC_IRQ_IPI
>> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
>> index b03cfcb..bf60e0c 100644
>> --- a/drivers/irqchip/Makefile
>> +++ b/drivers/irqchip/Makefile
>> @@ -55,6 +55,7 @@ obj-$(CONFIG_BCM7038_L1_IRQ)                += irq-bcm7038-l1.o
>>  obj-$(CONFIG_BCM7120_L2_IRQ)         += irq-bcm7120-l2.o
>>  obj-$(CONFIG_BRCMSTB_L2_IRQ)         += irq-brcmstb-l2.o
>>  obj-$(CONFIG_KEYSTONE_IRQ)           += irq-keystone.o
>> +obj-$(CONFIG_LPC18XX_GPIO_PINT)              += irq-lpc18xx-gpio-pint.o
>>  obj-$(CONFIG_MIPS_GIC)                       += irq-mips-gic.o
>>  obj-$(CONFIG_ARCH_MEDIATEK)          += irq-mtk-sysirq.o
>>  obj-$(CONFIG_ARCH_DIGICOLOR)         += irq-digicolor.o
>> diff --git a/drivers/irqchip/irq-lpc18xx-gpio-pint.c b/drivers/irqchip/irq-lpc18xx-gpio-pint.c
>> new file mode 100644
>> index 0000000..d53e99b
>> --- /dev/null
>> +++ b/drivers/irqchip/irq-lpc18xx-gpio-pint.c
>> @@ -0,0 +1,219 @@
>> +/*
>> + * Irqchip driver for GPIO Pin Interrupt (PINT) on NXP LPC18xx/43xx.
>> + *
>> + * Copyright (C) 2016 Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/init.h>
>> +#include <linux/irq.h>
>> +#include <linux/irqdomain.h>
>> +#include <linux/of.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/platform_device.h>
>> +
>> +/* LPC18xx GPIO pin interrupt register offsets */
>> +#define LPC18XX_GPIO_PINT_ISEL               0x000
>> +#define LPC18XX_GPIO_PINT_SIENR              0x008
>> +#define LPC18XX_GPIO_PINT_CIENR              0x00c
>> +#define LPC18XX_GPIO_PINT_SIENF              0x014
>> +#define LPC18XX_GPIO_PINT_CIENF              0x018
>> +#define LPC18XX_GPIO_PINT_IST                0x024
>> +
>> +#define PINT_MAX_IRQS                        32
>> +
>> +struct lpc18xx_gpio_pint_chip {
>> +     struct irq_domain *domain;
>> +     void __iomem      *base;
>> +     struct clk        *clk;
>> +     unsigned int      revmap[];
>> +};
>> +
>> +static void lpc18xx_gpio_pint_handler(struct irq_desc *desc)
>> +{
>> +     struct lpc18xx_gpio_pint_chip *pint = irq_desc_get_handler_data(desc);
>> +     unsigned int irq = irq_desc_get_irq(desc);
>> +     unsigned int hwirq = pint->revmap[irq];
>> +     unsigned int virq;
>> +
>> +     virq = irq_find_mapping(pint->domain, hwirq);
>> +     generic_handle_irq(virq);
>
> Two things here:
> - It feels a bit weird that you are indirecting everything through a
> cascade interrupt. As you have a 1:1 relationship between the PINT
> interrupts and their NVIC counterparts, this would be better described
> as a hierarchical irqchip (see drivers/irqchip/irq-vf610-mscm-ir.c for
> an example)

Okey, I'll have a look at how irq-vf610-mscm-ir handels it.


> - If you decide to stick with the current approach, you're then missing
> the usual chained_irq_{enter,exit}.

Indeed.


Thanks for looking through.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
