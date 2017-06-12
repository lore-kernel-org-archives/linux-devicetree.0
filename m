From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Re: [PATCH v2 3/4] irqchip: Add BCM2835 AUX interrupt controller
Date: Mon, 12 Jun 2017 16:21:02 +0100
Message-ID: <fb54ef5b-3bbb-4c39-e993-48bf45982412@raspberrypi.org>
References: <c5ceca4d-81d1-9faf-bc4a-3ea3113abf36@raspberrypi.org>
 <56e314db-49a9-48fa-d7d9-877bd68aadfc@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56e314db-49a9-48fa-d7d9-877bd68aadfc-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/06/2017 15:59, Marc Zyngier wrote:> On 12/06/17 15:25, Phil Elwell wrote:
>> Devices in the BCM2835 AUX block share a common interrupt line, with a
>> register indicating which devices have active IRQs. Expose this as a
>> nested interrupt controller to avoid IRQ sharing problems (easily
>> observed if UART1 and SPI1/2 are enabled simultaneously).
>>
>> Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
>> ---
>>  drivers/irqchip/Makefile          |   2 +-
>>  drivers/irqchip/irq-bcm2835-aux.c | 155 ++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 156 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/irqchip/irq-bcm2835-aux.c
>>
>> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
>> index b64c59b..cf01920 100644
>> --- a/drivers/irqchip/Makefile
>> +++ b/drivers/irqchip/Makefile
>> @@ -3,7 +3,7 @@ obj-$(CONFIG_IRQCHIP)			+= irqchip.o
>>  obj-$(CONFIG_ALPINE_MSI)		+= irq-alpine-msi.o
>>  obj-$(CONFIG_ATH79)			+= irq-ath79-cpu.o
>>  obj-$(CONFIG_ATH79)			+= irq-ath79-misc.o
>> -obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2835.o
>> +obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2835.o irq-bcm2835-aux.o
>>  obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2836.o
>>  obj-$(CONFIG_ARCH_EXYNOS)		+= exynos-combiner.o
>>  obj-$(CONFIG_FARADAY_FTINTC010)		+= irq-ftintc010.o
>> diff --git a/drivers/irqchip/irq-bcm2835-aux.c b/drivers/irqchip/irq-bcm2835-aux.c
>> new file mode 100644
>> index 0000000..545f12e
>> --- /dev/null
>> +++ b/drivers/irqchip/irq-bcm2835-aux.c
>> @@ -0,0 +1,155 @@
>> +/*
>> + * Copyright (C) 2017 Raspberry Pi (Trading) Ltd.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include <linux/interrupt.h>
>> +#include <linux/irqdomain.h>
>> +#include <linux/module.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/platform_device.h>
>> +#include <dt-bindings/interrupt-controller/bcm2835-aux-intc.h>
>> +
>> +#define BCM2835_AUXIRQ		0x00
>> +
>> +#define BCM2835_AUX_IRQ_UART_MASK BIT(BCM2835_AUX_IRQ_UART)
>> +#define BCM2835_AUX_IRQ_SPI1_MASK BIT(BCM2835_AUX_IRQ_SPI1)
>> +#define BCM2835_AUX_IRQ_SPI2_MASK BIT(BCM2835_AUX_IRQ_SPI2)
>> +
>> +#define BCM2835_AUX_IRQ_ALL_MASK \
>> +	(BCM2835_AUX_IRQ_UART_MASK | \
>> +	 BCM2835_AUX_IRQ_SPI1_MASK | \
>> +	 BCM2835_AUX_IRQ_SPI2_MASK)
>> +
>> +struct aux_irq_state {
>> +	void __iomem      *status;
>> +	struct irq_domain *domain;
>> +};
>> +
>> +static struct aux_irq_state aux_irq __read_mostly;
>> +
>> +static irqreturn_t bcm2835_aux_irq_handler(int irq, void *dev_id)
>> +{
>> +	u32 stat = readl_relaxed(aux_irq.status);
>> +
>> +	if (stat & BCM2835_AUX_IRQ_UART_MASK)
>> +		generic_handle_irq(irq_linear_revmap(aux_irq.domain,
>> +						     BCM2835_AUX_IRQ_UART));
>> +
>> +	if (stat & BCM2835_AUX_IRQ_SPI1_MASK)
>> +		generic_handle_irq(irq_linear_revmap(aux_irq.domain,
>> +						     BCM2835_AUX_IRQ_SPI1));
>> +
>> +	if (stat & BCM2835_AUX_IRQ_SPI2_MASK)
>> +		generic_handle_irq(irq_linear_revmap(aux_irq.domain,
>> +						     BCM2835_AUX_IRQ_SPI2));
>> +
>> +	return (stat & BCM2835_AUX_IRQ_ALL_MASK) ? IRQ_HANDLED : IRQ_NONE;
> 
> I could understand the use of a normal interrupt handler instead of a
> chained handler, as the HW doesn't have any way of masking interrupts
> (whoever designed this should be forced to fix each and every SoC with a
> magnifier and a tiny drill) if it wasn't for this last line.
> 
> Here, you're making sure that you always return IRQ_HANDLED if something
> was pending, irrespective of whether it has been handled or not. How do
> you recover when you have a screaming interrupt and no handler?

Does Linux not notice when one calls generic_handle_irq with the number of an
interrupt without a handler?

> Why don't you simply request the interrupt as a shared one, and check
> for the state in the handlers themselves? This way, the kernel will be
> able to recover from a screaming interrupt by disabling it.

I'm not sure quite how the problem arises - the AUX SPI driver uses IRQF_SHARED,
and the AUX UART (8250 clone) driver sets UPF_SHARE_IRQ, but the end result
is a lockup. Putting checking of the parent status bits into the drivers (one of
which is a fairly generic 8250 driver) seems wrong.

Adding this simple driver fixed the problem, and I think it better reflects the
hardware modularity.

> 
>> +}
>> +
>> +static int bcm2835_aux_irq_xlate(struct irq_domain *d,
>> +				 struct device_node *ctrlr,
>> +				 const u32 *intspec, unsigned int intsize,
>> +				 unsigned long *out_hwirq,
>> +				 unsigned int *out_type)
>> +{
>> +	if (WARN_ON(intsize != 1))
>> +		return -EINVAL;
>> +
>> +	if (WARN_ON(intspec[0] >= BCM2835_AUX_IRQ_COUNT))
>> +		return -EINVAL;
>> +
>> +	*out_hwirq = intspec[0];
>> +	*out_type = IRQ_TYPE_NONE;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * The irq_mask and irq_unmask function pointers are used without
>> + * validity checks, so they must not be NULL. Create a dummy function
>> + * with the expected type for use as a no-op.
>> + */
>> +static void bcm2835_aux_irq_dummy(struct irq_data *data)
>> +{
>> +}
>> +
>> +static struct irq_chip bcm2835_aux_irq_chip = {
>> +	.name = "bcm2835-aux_irq",
>> +	.irq_mask = bcm2835_aux_irq_dummy,
>> +	.irq_unmask = bcm2835_aux_irq_dummy,
>> +};
>> +
>> +static const struct irq_domain_ops bcm2835_aux_irq_ops = {
>> +	.xlate = bcm2835_aux_irq_xlate
>> +};
>> +
>> +static int bcm2835_aux_irq_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *node = dev->of_node;
>> +	int parent_irq;
>> +	struct resource *res;
>> +	void __iomem *reg;
>> +	int i;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	reg = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(reg))
>> +		return PTR_ERR(reg);
>> +
>> +	parent_irq = irq_of_parse_and_map(node, 0);
>> +	if (!parent_irq)
>> +		return -ENXIO;
>> +
>> +	aux_irq.status = reg + BCM2835_AUXIRQ;
>> +	aux_irq.domain = irq_domain_add_linear(node,
>> +					       BCM2835_AUX_IRQ_COUNT,
>> +					       &bcm2835_aux_irq_ops,
>> +					       NULL);
>> +	if (!aux_irq.domain)
>> +		return -ENXIO;
>> +
>> +	for (i = 0; i < BCM2835_AUX_IRQ_COUNT; i++) {
>> +		unsigned int irq = irq_create_mapping(aux_irq.domain, i);
>> +
>> +		if (irq == 0)
>> +			return -ENXIO;
>> +
>> +		irq_set_chip_and_handler(irq, &bcm2835_aux_irq_chip,
>> +					 handle_level_irq);
>> +	}
> 
> My initial question notwithstanding, why do you need any of this? This
> should be done at map time, and the irq_create_mapping() call should
> entirely be driven from DT.

Can you explain this in more detail? I'm open to a better solution.

>> +
>> +	return  devm_request_irq(dev, parent_irq, bcm2835_aux_irq_handler,
>> +				 0, "bcm2835-aux-intc", NULL);
>> +}
>> +
>> +static const struct of_device_id bcm2835_aux_irq_of_match[] = {
>> +	{ .compatible = "brcm,bcm2835-aux-intc", },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, bcm2835_aux_irq_of_match);
>> +
>> +static struct platform_driver bcm2835_aux_irq_driver = {
>> +	.driver = {
>> +		.name = "bcm2835-aux-intc",
>> +		.of_match_table = bcm2835_aux_irq_of_match,
>> +	},
>> +	.probe          = bcm2835_aux_irq_probe,
>> +};
>> +builtin_platform_driver(bcm2835_aux_irq_driver);
>> +
>> +MODULE_AUTHOR("Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>");
>> +MODULE_DESCRIPTION("BCM2835 auxiliary peripheral interrupt driver");
>> +MODULE_LICENSE("GPL v2");
>>

Thanks,

Phil

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
