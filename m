From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 2/2] irqchip: add TS-4800 interrupt controller
Date: Mon, 21 Dec 2015 17:52:19 +0000
Message-ID: <20151221175219.202cd241@why.wild-wind.fr.eu.org>
References: <1450467559-21066-1-git-send-email-damien.riegel@savoirfairelinux.com>
	<1450467559-21066-2-git-send-email-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450467559-21066-2-git-send-email-damien.riegel@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Damien Riegel <damien.riegel@savoirfairelinux.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, kernel@savoirfairelinux.com
List-Id: devicetree@vger.kernel.org

On Fri, 18 Dec 2015 14:39:19 -0500
Damien Riegel <damien.riegel@savoirfairelinux.com> wrote:

> This commit adds support for the TS-4800 interrupt controller. This
> controller is instantiated in a companion FPGA, and multiplex interrupts
> for other FPGA IPs.
> 
> As this component is external to the SoC, the SoC might need to reserve
> pins, so this controller is implemented as a platform driver and doesn't
> use the IRQCHIP_DECLARE construct.
> 
> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> ---
>  drivers/irqchip/Kconfig      |   6 ++
>  drivers/irqchip/Makefile     |   1 +
>  drivers/irqchip/irq-ts4800.c | 156 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 163 insertions(+)
>  create mode 100644 drivers/irqchip/irq-ts4800.c
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 27b52c8..e734772 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -137,6 +137,12 @@ config TB10X_IRQC
>  	select IRQ_DOMAIN
>  	select GENERIC_IRQ_CHIP
>  
> +config TS4800_IRQ
> +	tristate "TS-4800 IRQ controller"
> +	select IRQ_DOMAIN
> +	help
> +	  Support for the TS-4800 FPGA IRQ controller
> +
>  config VERSATILE_FPGA_IRQ
>  	bool
>  	select IRQ_DOMAIN
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index bb3048f..ca9de01 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_ARCH_NSPIRE)		+= irq-zevio.o
>  obj-$(CONFIG_ARCH_VT8500)		+= irq-vt8500.o
>  obj-$(CONFIG_ST_IRQCHIP)		+= irq-st.o
>  obj-$(CONFIG_TB10X_IRQC)		+= irq-tb10x.o
> +obj-$(CONFIG_TS4800_IRQ)		+= irq-ts4800.o
>  obj-$(CONFIG_XTENSA)			+= irq-xtensa-pic.o
>  obj-$(CONFIG_XTENSA_MX)			+= irq-xtensa-mx.o
>  obj-$(CONFIG_IRQ_CROSSBAR)		+= irq-crossbar.o
> diff --git a/drivers/irqchip/irq-ts4800.c b/drivers/irqchip/irq-ts4800.c
> new file mode 100644
> index 0000000..f5a4d5b
> --- /dev/null
> +++ b/drivers/irqchip/irq-ts4800.c
> @@ -0,0 +1,156 @@
> +/*
> + * Multiplexed-IRQs driver for TS-4800's FPGA
> + *
> + * Copyright (c) 2015 - Savoir-faire Linux
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +
> +#define IRQ_MASK        0x4
> +#define IRQ_STATUS      0x8
> +
> +struct ts4800_irq_data {
> +	void __iomem            *base;
> +	struct irq_domain       *domain;
> +	struct irq_chip         irq_chip;
> +};
> +
> +static void ts4800_irq_mask(struct irq_data *d)
> +{
> +	struct ts4800_irq_data *data = irq_data_get_irq_chip_data(d);
> +	u16 mask = 1 << d->hwirq;
> +	u16 reg = readw(data->base + IRQ_MASK);
> +
> +	writew(reg | mask, data->base + IRQ_MASK);
> +}
> +
> +static void ts4800_irq_unmask(struct irq_data *d)
> +{
> +	struct ts4800_irq_data *data = irq_data_get_irq_chip_data(d);
> +	u16 mask = 1 << d->hwirq;
> +	u16 reg = readw(data->base + IRQ_MASK);
> +
> +	writew(reg & ~mask, data->base + IRQ_MASK);
> +}
> +
> +static int ts4800_irqdomain_map(struct irq_domain *d, unsigned int irq,
> +				irq_hw_number_t hwirq)
> +{
> +	struct ts4800_irq_data *data = d->host_data;
> +
> +	irq_set_chip_and_handler(irq, &data->irq_chip, handle_simple_irq);
> +	irq_set_chip_data(irq, data);
> +	irq_set_noprobe(irq);
> +
> +	return 0;
> +}
> +
> +struct irq_domain_ops ts4800_ic_ops = {
> +	.map = ts4800_irqdomain_map,
> +	.xlate = irq_domain_xlate_onecell,
> +};
> +
> +static void ts4800_ic_chained_handle_irq(struct irq_desc *desc)
> +{
> +	struct ts4800_irq_data *data = irq_desc_get_handler_data(desc);
> +	u16 status = readw(data->base + IRQ_STATUS);
> +
> +	if (unlikely(status == 0)) {
> +		handle_bad_irq(desc);
> +		return;
> +	}
> +
> +	do {
> +		unsigned int bit = __ffs(status);
> +		int irq = irq_find_mapping(data->domain, bit);
> +
> +		status &= ~(1 << bit);
> +		generic_handle_irq(irq);
> +	} while (status);
> +}

Please use chained_irq_{enter,exit} to wrap this, or this will never
work when combined with a primary irqchip that uses a fasteoi handling
method.

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.
