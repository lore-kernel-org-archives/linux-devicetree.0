From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 3/8] irq-imgpdc: add ImgTec PDC irqchip driver
Date: Tue, 23 Apr 2013 17:09:51 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1304231647400.21884@ionos>
References: <1366727607-27444-1-git-send-email-james.hogan@imgtec.com> <1366727607-27444-4-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1366727607-27444-4-git-send-email-james.hogan@imgtec.com>
Sender: linux-doc-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 23 Apr 2013, James Hogan wrote:
> +/**
> + * struct pdc_intc_priv - private pdc interrupt data.
> + * @nr_perips:		Number of peripheral interrupt signals.
> + * @nr_syswakes:	Number of syswake signals.
> + * @perip_irqs:		List of peripheral IRQ numbers handled.
> + * @syswake_irq:	Shared PDC syswake IRQ number.
> + * @domain:		IRQ domain for PDC peripheral and syswake IRQs.
> + * @pdc_base:		Base of PDC registers.
> + * @lock:		Lock to protect the PDC syswake registers.
> + */
> +struct pdc_intc_priv {
> +	unsigned int		nr_perips;
> +	unsigned int		nr_syswakes;
> +	unsigned int		*perip_irqs;
> +	unsigned int		syswake_irq;
> +	struct irq_domain	*domain;
> +	void __iomem		*pdc_base;
> +
> +	spinlock_t		lock;

  raw_spinlock_t please

> +/* Generic IRQ callbacks */
> +
> +#define SYS0_HWIRQ	8
> +
> +static unsigned int hwirq_is_syswake(irq_hw_number_t hw)
> +{
> +	return hw >= SYS0_HWIRQ;
> +}
> +
> +static unsigned int hwirq_to_syswake(irq_hw_number_t hw)
> +{
> +	return hw - SYS0_HWIRQ;
> +}
> +
> +static irq_hw_number_t syswake_to_hwirq(unsigned int syswake)
> +{
> +	return SYS0_HWIRQ + syswake;
> +}
> +
> +static struct pdc_intc_priv *irqd_to_priv(struct irq_data *data)
> +{
> +	return (struct pdc_intc_priv *)data->domain->host_data;
> +}
> +
> +static void perip_irq_mask(struct irq_data *data)
> +{
> +	struct pdc_intc_priv *priv = irqd_to_priv(data);
> +	unsigned int irq_route;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->lock, flags);

This is always called with interrupts disabled.

> +	irq_route = pdc_read(priv, PDC_IRQ_ROUTE);
> +	irq_route &= ~(1 << data->hwirq);

Why not cache the mask value ?

> +	pdc_write(priv, PDC_IRQ_ROUTE, irq_route);

> +	spin_unlock_irqrestore(&priv->lock, flags);
> +}
> +
> +static void perip_irq_unmask(struct irq_data *data)
> +{
> +	struct pdc_intc_priv *priv = irqd_to_priv(data);
> +	unsigned int irq_route;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	irq_route = pdc_read(priv, PDC_IRQ_ROUTE);
> +	irq_route |= 1 << data->hwirq;
> +	pdc_write(priv, PDC_IRQ_ROUTE, irq_route);

This code is another slightly different copy of stuff which is
available in kernel/irq/generic-chip.c

Can we please stop the code duplication and reuse existing
infrastructure? Don't tell me it does not work for you.  I sent out a
patch yesterday which makes the code suitable for irq domains.

> +static int syswake_irq_set_type(struct irq_data *data, unsigned int flow_type)
> +{
> +	struct pdc_intc_priv *priv = irqd_to_priv(data);
> +	unsigned int syswake = hwirq_to_syswake(data->hwirq);
> +	unsigned int irq_mode;
> +	unsigned int soc_sys_wake_regoff, soc_sys_wake;
> +	unsigned long flags;
> +
> +	/* translate to syswake IRQ mode */
> +	switch (flow_type) {
> +	case IRQ_TYPE_EDGE_BOTH:
> +		irq_mode = PDC_SYS_WAKE_INT_CHANGE;
> +		break;
> +	case IRQ_TYPE_EDGE_RISING:
> +		irq_mode = PDC_SYS_WAKE_INT_UP;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		irq_mode = PDC_SYS_WAKE_INT_DOWN;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		irq_mode = PDC_SYS_WAKE_INT_HIGH;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		irq_mode = PDC_SYS_WAKE_INT_LOW;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	spin_lock_irqsave(&priv->lock, flags);

All irqchip callbacks are called with interrupts disabled.

> +static void pdc_intc_perip_isr(unsigned int irq, struct irq_desc *desc)
> +{
> +	struct pdc_intc_priv *priv;
> +	unsigned int i, irq_no;
> +
> +	priv = (struct pdc_intc_priv *)irq_desc_get_handler_data(desc);
> +
> +	/* find the peripheral number */
> +	for (i = 0; i < priv->nr_perips; ++i)
> +		if (irq == priv->perip_irqs[i])
> +			goto found;

Whee. Aren't these numbers linear ?

> +	/* should never get here */
> +	return;
> +found:
> +
> +	/* pass on the interrupt */
> +	irq_no = irq_linear_revmap(priv->domain, i);
> +	generic_handle_irq(irq_no);
> +}
> +
> +static void pdc_intc_syswake_isr(unsigned int irq, struct irq_desc *desc)
> +{
> +	struct pdc_intc_priv *priv;
> +	unsigned int syswake, irq_no;
> +	unsigned int status;
> +
> +	priv = (struct pdc_intc_priv *)irq_desc_get_handler_data(desc);
> +
> +	spin_lock(&priv->lock);
> +	status = pdc_read(priv, PDC_IRQ_STATUS);
> +	status &= pdc_read(priv, PDC_IRQ_ENABLE);
> +	spin_unlock(&priv->lock);
> +
> +	status &= (1 << priv->nr_syswakes) - 1;
> +
> +	for (syswake = 0; status; status >>= 1, ++syswake) {
> +		/* Has this sys_wake triggered? */
> +		if (!(status & 1))
> +			continue;
> +
> +		irq_no = irq_linear_revmap(priv->domain,
> +					   syswake_to_hwirq(syswake));
> +		generic_handle_irq(irq_no);
> +	}
> +}
> +


> +static int pdc_intc_probe(struct platform_device *pdev)
> +{
> +	struct pdc_intc_priv *priv;
> +	struct device_node *node = pdev->dev.of_node;
> +	struct resource *res_regs;
> +	unsigned int i;
> +	int irq, ret;
> +	u32 val;
> +
> +	if (!node)
> +		return -ENOENT;
> +
> +	/* Get registers */
> +	res_regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (res_regs == NULL) {
> +		dev_err(&pdev->dev, "cannot find registers resource\n");
> +		return -ENOENT;
> +	}
> +
> +	/* Allocate driver data */
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		dev_err(&pdev->dev, "cannot allocate device data\n");
> +		return -ENOMEM;
> +	}
> +	spin_lock_init(&priv->lock);
> +	platform_set_drvdata(pdev, priv);
> +
> +	/* Ioremap the registers */
> +	priv->pdc_base = devm_ioremap(&pdev->dev, res_regs->start,
> +				      res_regs->end - res_regs->start);
> +	if (!priv->pdc_base)
> +		return -EIO;

Leaks priv.

> +	/* Get number of peripherals */
> +	ret = of_property_read_u32(node, "num-perips", &val);
> +	if (ret) {
> +		dev_err(&pdev->dev, "No num-perips node property found\n");
> +		return -EINVAL;

Leaks priv and mapping

> +	}
> +	if (val > SYS0_HWIRQ) {
> +		dev_err(&pdev->dev, "num-perips (%u) out of range\n", val);
> +		return -EINVAL;

Error handling is optional, right?

> +static int pdc_intc_remove(struct platform_device *pdev)
> +{
> +	struct pdc_intc_priv *priv = platform_get_drvdata(pdev);
> +
> +	irq_domain_remove(priv->domain);

And the rest of the resources is still there?

