From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 3/4] irqchip: Add BCM2835 AUX interrupt controller
Date: Thu, 22 Jun 2017 14:55:08 +0100
Message-ID: <cc8f00e4-c8af-1d51-e020-32991f91210d@arm.com>
References: <4ceb6c92-f752-180e-6a6e-a94dcd120737@raspberrypi.org>
 <1497457750-35585-1-git-send-email-phil@raspberrypi.org>
 <1497457750-35585-4-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497457750-35585-4-git-send-email-phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 14/06/17 17:29, Phil Elwell wrote:
> Devices in the BCM2835 AUX block share a common interrupt line, with a
> register indicating which devices have active IRQs. Expose this as a
> nested interrupt controller to avoid IRQ sharing problems (easily
> observed if UART1 and SPI1/2 are enabled simultaneously).
> 
> Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
> ---
>  drivers/irqchip/Makefile          |   2 +-
>  drivers/irqchip/irq-bcm2835-aux.c | 153 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 154 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/irqchip/irq-bcm2835-aux.c
> 
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index b64c59b..cf01920 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -3,7 +3,7 @@ obj-$(CONFIG_IRQCHIP)			+= irqchip.o
>  obj-$(CONFIG_ALPINE_MSI)		+= irq-alpine-msi.o
>  obj-$(CONFIG_ATH79)			+= irq-ath79-cpu.o
>  obj-$(CONFIG_ATH79)			+= irq-ath79-misc.o
> -obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2835.o
> +obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2835.o irq-bcm2835-aux.o
>  obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2836.o
>  obj-$(CONFIG_ARCH_EXYNOS)		+= exynos-combiner.o
>  obj-$(CONFIG_FARADAY_FTINTC010)		+= irq-ftintc010.o
> diff --git a/drivers/irqchip/irq-bcm2835-aux.c b/drivers/irqchip/irq-bcm2835-aux.c
> new file mode 100644
> index 0000000..2151d51
> --- /dev/null
> +++ b/drivers/irqchip/irq-bcm2835-aux.c
> @@ -0,0 +1,153 @@
> +/*
> + * Copyright (C) 2017 Raspberry Pi (Trading) Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/interrupt-controller/bcm2835-aux-intc.h>
> +
> +#define BCM2835_AUXIRQ		0x00
> +
> +#define BCM2835_AUX_IRQ_UART_MASK BIT(BCM2835_AUX_IRQ_UART)
> +#define BCM2835_AUX_IRQ_SPI1_MASK BIT(BCM2835_AUX_IRQ_SPI1)
> +#define BCM2835_AUX_IRQ_SPI2_MASK BIT(BCM2835_AUX_IRQ_SPI2)
> +
> +#define BCM2835_AUX_IRQ_ALL_MASK \
> +	(BCM2835_AUX_IRQ_UART_MASK | \
> +	 BCM2835_AUX_IRQ_SPI1_MASK | \
> +	 BCM2835_AUX_IRQ_SPI2_MASK)
> +
> +struct aux_irq_state {
> +	void __iomem      *status;
> +	struct irq_domain *domain;
> +};
> +
> +static struct aux_irq_state aux_irq __read_mostly;
> +
> +static irqreturn_t bcm2835_aux_irq_handler(int irq, void *dev_id)
> +{
> +	u32 stat = readl_relaxed(aux_irq.status);
> +
> +	if (stat & BCM2835_AUX_IRQ_UART_MASK)
> +		generic_handle_irq(irq_linear_revmap(aux_irq.domain,
> +						     BCM2835_AUX_IRQ_UART));
> +
> +	if (stat & BCM2835_AUX_IRQ_SPI1_MASK)
> +		generic_handle_irq(irq_linear_revmap(aux_irq.domain,
> +						     BCM2835_AUX_IRQ_SPI1));
> +
> +	if (stat & BCM2835_AUX_IRQ_SPI2_MASK)
> +		generic_handle_irq(irq_linear_revmap(aux_irq.domain,
> +						     BCM2835_AUX_IRQ_SPI2));
> +
> +	return (stat & BCM2835_AUX_IRQ_ALL_MASK) ? IRQ_HANDLED : IRQ_NONE;

That feels like the wrong conditions to return IRQ_HANDLED. Only the
last level handler actually knows whether this has been handled or not.

A vaguely better approach would be to reread the HW status and only
return IRQ_HANDLED if everything is clear. Yes, this is racy (another
interrupt could have come in the meantime). But I doubt you can do much
better given the quality of the HW...

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
