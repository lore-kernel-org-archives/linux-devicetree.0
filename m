From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/5] gpio: Cygnus: add GPIO driver
Date: Fri, 05 Dec 2014 17:28:02 -0800
Message-ID: <1417829282.31745.3.camel@perches.com>
References: <Ray Jui <rjui@broadcom.com>
	 <1417826408-1600-1-git-send-email-rjui@broadcom.com>
	 <1417826408-1600-3-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417826408-1600-3-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-12-05 at 16:40 -0800, Ray Jui wrote:
> This GPIO driver supports all 3 GPIO controllers in the Broadcom Cygnus
> SoC. The 3 GPIO controllers are 1) the ASIU GPIO controller
> ("brcm,cygnus-asiu-gpio"), 2) the chipCommonG GPIO controller
> ("brcm,cygnus-ccm-gpio"), and 3) the ALWAYS-ON GPIO controller
> ("brcm,cygnus-crmu-gpio")

trivia:

> diff --git a/drivers/gpio/gpio-bcm-cygnus.c b/drivers/gpio/gpio-bcm-cygnus.c

> +static inline struct bcm_cygnus_gpio *to_bcm_cygnus_gpio(
> +		struct gpio_chip *gc)
> +{
> +	return container_of(gc, struct bcm_cygnus_gpio, gc);
> +}

Probably all of these inlines can just be static.

The compiler does a pretty good job these days
of inlining where appropriate.


> +static void bcm_cygnus_gpio_irq_handler(unsigned int irq,
> +		struct irq_desc *desc)
> +{
> +	struct bcm_cygnus_gpio *cygnus_gpio;
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	int i, bit;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	cygnus_gpio = irq_get_handler_data(irq);
> +
> +	/* go through the entire GPIO banks and handle all interrupts */
> +	for (i = 0; i < cygnus_gpio->num_banks; i++) {
> +		unsigned long val = readl(cygnus_gpio->base +
> +				(i * GPIO_BANK_SIZE) +
> +				CYGNUS_GPIO_INT_MSTAT_OFFSET);
> +		if (val) {

This if (val) and indentation isn't really necessary

> +			for_each_set_bit(bit, &val, 32) {

for_each_set_bit will effectively do the if above.

32 bit only code?
otherwise isn't this endian unsafe?

> +				unsigned pin = NGPIOS_PER_BANK * i + bit;
> +				int child_irq =	bcm_cygnus_gpio_to_irq(
> +						&cygnus_gpio->gc, pin);
> +
> +				/*
> +				 * Clear the interrupt before invoking the
> +				 * handler, so we do not leave any window
> +				 */
> +				writel(1 << bit,
> +					cygnus_gpio->base +
> +					(i * GPIO_BANK_SIZE) +
> +					CYGNUS_GPIO_INT_CLR_OFFSET);
> +
> +				generic_handle_irq(child_irq);
> +			}
> +
> +		}
> +	}
> +
> +	chained_irq_exit(chip, desc);
> +}
> +
> +static void bcm_cygnus_gpio_irq_ack(struct irq_data *d)
> +{
> +	struct bcm_cygnus_gpio *cygnus_gpio = irq_data_get_irq_chip_data(d);
> +	unsigned gpio = d->hwirq;
> +	unsigned int offset, shift;
> +	u32 val;
> +
> +	offset = __gpio_reg_offset(cygnus_gpio, gpio) +
> +		CYGNUS_GPIO_INT_CLR_OFFSET;
> +	shift = __gpio_bitpos(cygnus_gpio, gpio);
> +
> +	val = 1 << shift;
> +	writel(val, cygnus_gpio->base + offset);
> +
> +	dev_dbg(cygnus_gpio->dev, "gpio:%u offset:0x%04x shift:%u\n", gpio,
> +			offset, shift);
> +}

> +static struct irq_chip bcm_cygnus_gpio_irq_chip = {
> +	.name = "bcm-cygnus-gpio",
> +	.irq_ack = bcm_cygnus_gpio_irq_ack,
> +	.irq_mask = bcm_cygnus_gpio_irq_mask,
> +	.irq_unmask = bcm_cygnus_gpio_irq_unmask,
> +	.irq_set_type = bcm_cygnus_gpio_irq_set_type,
> +};

const?

> +static struct irq_domain_ops bcm_cygnus_irq_ops = {
> +	.map = bcm_cygnus_gpio_irq_map,
> +	.unmap = bcm_cygnus_gpio_irq_unmap,
> +	.xlate = irq_domain_xlate_twocell,
> +};

const here too?

> +#ifdef CONFIG_OF_GPIO
> +static void bcm_cygnus_gpio_set_pull(struct bcm_cygnus_gpio *cygnus_gpio,
> +		unsigned gpio, enum gpio_pull pull)
> +{
> +	unsigned int offset, shift;
> +	u32 val, up;

	bool up; ?

> +	unsigned long flags;
> +
> +	switch (pull) {
> +	case GPIO_PULL_NONE:
> +		return;
> +	case GPIO_PULL_UP:
> +		up = 1;
> +		break;
> +	case GPIO_PULL_DOWN:
> +		up = 0;
> +		break;
> +	case GPIO_PULL_INVALID:
> +	default:
> +		return;
> +	}

Maybe more sensible to group GPIO_PULL_NONE with GPIO_PULL_INVALID


> +static int bcm_cygnus_gpio_probe(struct platform_device *pdev)
> +{
[]
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "unable to get I/O resource");

missing newline


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
