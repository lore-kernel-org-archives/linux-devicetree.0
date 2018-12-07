From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v3 2/4] drivers/irqchip: Add Actions external interrupts
 support
Date: Fri, 7 Dec 2018 18:39:02 +0000
Message-ID: <769c5482-76e1-f0a2-de75-09abd3167632@arm.com>
References: <20181126100356.2840578-1-pn@denx.de>
 <20181126100356.2840578-3-pn@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181126100356.2840578-3-pn@denx.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Parthiban Nallathambi <pn@denx.de>, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, catalin.marinas@arm.com, will.deacon@arm.com, manivannan.sadhasivam@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thomas.liau@actions-semi.com, mp-cs@actions-semi.com, linux@cubietech.com, edgar.righi@lsitec.org.br, laisa.costa@lsitec.org.br, guilherme.simoes@lsitec.org.br, mkzuffo@lsi.usp.br, Saravanan Sekar <sravanhome@gmail.com>
List-Id: devicetree@vger.kernel.org

On 26/11/2018 10:03, Parthiban Nallathambi wrote:
> Actions Semi Owl family SoC's S500, S700 and S900 provides support
> for 3 external interrupt controllers through SIRQ pins.
> 
> Each line can be independently configured as interrupt and triggers
> on either of the edges (raising or falling) or either of the levels
> (high or low) . Each line can also be masked independently.
> 
> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
> Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
> ---
>  drivers/irqchip/Makefile       |   1 +
>  drivers/irqchip/irq-owl-sirq.c | 301 +++++++++++++++++++++++++++++++++
>  2 files changed, 302 insertions(+)
>  create mode 100644 drivers/irqchip/irq-owl-sirq.c
> 
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 794c13d3ac3d..d8015fc5c1a2 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_ATH79)			+= irq-ath79-misc.o
>  obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2835.o
>  obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2836.o
>  obj-$(CONFIG_ARCH_EXYNOS)		+= exynos-combiner.o
> +obj-$(CONFIG_ARCH_ACTIONS)		+= irq-owl-sirq.o
>  obj-$(CONFIG_FARADAY_FTINTC010)		+= irq-ftintc010.o
>  obj-$(CONFIG_ARCH_HIP04)		+= irq-hip04.o
>  obj-$(CONFIG_ARCH_LPC32XX)		+= irq-lpc32xx.o
> diff --git a/drivers/irqchip/irq-owl-sirq.c b/drivers/irqchip/irq-owl-sirq.c
> new file mode 100644
> index 000000000000..cc59e5743cda
> --- /dev/null
> +++ b/drivers/irqchip/irq-owl-sirq.c
> @@ -0,0 +1,301 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Actions Semi Owl SoCs SIRQ interrupt controller driver
> + *
> + * Copyright (C) 2014 Actions Semi Inc.
> + * David Liu <liuwei@actions-semi.com>
> + *
> + * Author: Parthiban Nallathambi <pn@denx.de>
> + * Author: Saravanan Sekar <sravanhome@gmail.com>
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/irqchip.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>
> +
> +#define INTC_EXTCTL_PENDING		BIT(0)
> +#define INTC_EXTCTL_CLK_SEL		BIT(4)
> +#define INTC_EXTCTL_EN			BIT(5)
> +#define	INTC_EXTCTL_TYPE_MASK		GENMASK(6, 7)

#define GENMASK(h, l) [...]

I sense a problem here.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
