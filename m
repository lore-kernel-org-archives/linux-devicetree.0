From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 3/6] gpio: davinci: use irqdomain
Date: Mon, 4 Nov 2013 20:27:46 +0200
Message-ID: <5277E722.50205@ti.com>
References: <1383406775-14902-1-git-send-email-prabhakar.csenng@gmail.com>
	<1383406775-14902-4-git-send-email-prabhakar.csenng@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1383406775-14902-4-git-send-email-prabhakar.csenng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alex Elder <alex.elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Prabhakar Lad,

On 11/02/2013 05:39 PM, Lad, Prabhakar wrote:
> From: "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> This patch converts the davinci gpio driver to use irqdomain
> support.

This patch needs to be splitted in two:
1) add IRQ domain support
2) remove intc_irq_num

> 
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   arch/arm/mach-davinci/da830.c              |    1 -
>   arch/arm/mach-davinci/da850.c              |    1 -
>   arch/arm/mach-davinci/dm355.c              |    1 -
>   arch/arm/mach-davinci/dm365.c              |    1 -
>   arch/arm/mach-davinci/dm644x.c             |    1 -
>   arch/arm/mach-davinci/dm646x.c             |    1 -
>   drivers/gpio/gpio-davinci.c                |   49 ++++++++++++++++++----------
>   include/linux/platform_data/gpio-davinci.h |    3 +-
>   8 files changed, 32 insertions(+), 26 deletions(-)
> 

[...]

>   
>   int __init dm646x_gpio_register(void)
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index 95c6df1..bcb6d8d 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -16,6 +16,7 @@
>   #include <linux/err.h>
>   #include <linux/io.h>
>   #include <linux/irq.h>
> +#include <linux/irqdomain.h>
>   #include <linux/platform_device.h>
>   #include <linux/platform_data/gpio-davinci.h>
>   
> @@ -292,7 +293,7 @@ gpio_irq_handler(unsigned irq, struct irq_desc *desc)
>   		__raw_writel(status, &g->intstat);
>   
>   		/* now demux them to the right lowlevel handler */
> -		n = d->irq_base;
> +		n = irq_find_mapping(d->irq_domain, 0);

Sorry, but I don't understand why have you used <0> as hwirq?

All below logic may not work in case if we switch to use Linear IRQ domain :(
- irq_create_mapping() may return ANY Linux IRQ number. It means, for 
example, for bank0(ngpio=32)[0] it may return Linux_IRQ=200 or 201 or any other.
 Also, for bank3(ngpio=16)[0] it may return Linux_IRQ=150, etc.
- More over, if you call irq_create_mapping() 32 times you may NOT get
 sequential Linux_IRQ numbers.

So, the better sequence here can be smth. as below
(I can't verify it - my HW support only unbanked IRQs):

	if (irq & 1)
		mask <<= 16;

	while (1) {
		u32		status;
		int		bit;

		/* ack any irqs */
		status = __raw_readl(&g->intstat) & mask;
		if (!status)
			break;
		__raw_writel(status, &g->intstat);

		/* now demux them to the right lowlevel handler */
		while (status) {
			bit = __ffs(status);
                        status &= ~(1 << bit);
			generic_handle_irq(irq_find_mapping(d->irq_domain, bit));
		}
	}


>   		if (irq & 1) {
>   			n += 16;
>   			status >>= 16;
> @@ -313,10 +314,7 @@ static int gpio_to_irq_banked(struct gpio_chip *chip, unsigned offset)
>   {
>   	struct davinci_gpio_controller *d = chip2controller(chip);
>   
> -	if (d->irq_base >= 0)
> -		return d->irq_base + offset;
> -	else
> -		return -ENODEV;
> +	return irq_find_mapping(d->irq_domain, offset);

I think you can use irq_create_mapping() here instead of 
irq_find_mapping(), so IRQ will be mapped/allocated on demand.
Also, it seems, above code may crash in case if SoC has >1 GPIO banks and
gpio_unbanked > 0 and someone will call gpio_to_irq(>31).

>   }
>   
>   static int gpio_to_irq_unbanked(struct gpio_chip *chip, unsigned offset)
> @@ -373,6 +371,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>   	struct davinci_gpio_controller *chips = platform_get_drvdata(pdev);
>   	struct davinci_gpio_platform_data *pdata = dev->platform_data;
>   	struct davinci_gpio_regs __iomem *g;
> +	int gpio_irq = 0;
>   
>   	ngpio = pdata->ngpio;
>   	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> @@ -402,9 +401,15 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>   	 */
>   	for (gpio = 0, bank = 0; gpio < ngpio; bank++, gpio += 32) {
>   		chips[bank].chip.to_irq = gpio_to_irq_banked;
> -		chips[bank].irq_base = pdata->gpio_unbanked
> -			? -EINVAL
> -			: (pdata->intc_irq_num + gpio);
> +		if (!pdata->gpio_unbanked) {
> +			chips[bank].irq_domain =
> +				irq_domain_add_linear(NULL, 32,

Use chips[i].chip.ngpio here instead of const 32?

> +						      &irq_domain_simple_ops,

Pass &davinci_gpio_irq_ops (see below)

> +						      NULL);

Pass &chips[bank] as host_data and use .map() callback (see below)

> +
> +			if (!chips[bank].irq_domain)
> +				return -ENOMEM;
> +		}
>   	}
>   
>   	/*
> @@ -445,9 +450,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>   	 * Or, AINTC can handle IRQs for banks of 16 GPIO IRQs, which we
>   	 * then chain through our own handler.
>   	 */
> -	for (gpio = 0, irq = gpio_to_irq(0), bank = 0;
> -			gpio < ngpio;
> -			bank++, bank_irq++) {
> +	for (gpio = 0, irq = 0, bank = 0; gpio < ngpio; bank++, bank_irq++) {
>   		unsigned		i;
>   
>   		/* disabled by default, enabled only as needed */
> @@ -465,12 +468,22 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>   		 */
>   		irq_set_handler_data(bank_irq, &chips[gpio / 32]);
>   
> -		for (i = 0; i < 16 && gpio < ngpio; i++, irq++, gpio++) {
> -			irq_set_chip(irq, &gpio_irqchip);
> -			irq_set_chip_data(irq, (__force void *)g);
> -			irq_set_handler_data(irq, (void *)__gpio_mask(gpio));
> -			irq_set_handler(irq, handle_simple_irq);
> -			set_irq_flags(irq, IRQF_VALID);
> +		if (!(bank % 2))
> +			irq = 0;
> +		else
> +			irq = 16;

As I mentioned above, I think, it is not good to play with IRQ numbers here.
Only chained IRQs and <binten> can be configured in this cycle.

> +
> +		for (i = 0; i < 16 && gpio < ngpio; i++, gpio++) {
> +			int irqno =
> +				irq_create_mapping(chips[gpio / 32].irq_domain,
> +						   i + irq);
> +
> +			irq_set_chip(irqno, &gpio_irqchip);
> +			irq_set_chip_data(irqno, (__force void *)g);
> +			irq_set_handler_data(irqno, (void *)__gpio_mask(gpio));
> +			irq_set_handler(irqno, handle_simple_irq);
> +			set_irq_flags(irqno, IRQF_VALID);

It makes no sense to manually create mapping. Usually it can be done in
.map() callback of IRQ domain. Like:

static int davinci_gpio_irq_map(struct irq_domain *d, unsigned int irq,
			    irq_hw_number_t hw)
{
	struct davinci_gpio_controller *chip = d->host_data;
	unsigned gpio = chip->chip.base + hw;

	irq_set_chip_and_handler_name(irq, &gpio_irqchip, handle_simple_irq,
				      "davinci_gpio");
	irq_set_irq_type(irq, IRQ_TYPE_NONE);
	set_irq_flags(irq, IRQF_VALID);
...
	return 0;
}

static const struct irq_domain_ops davinci_gpio_irq_ops = {
	.map = davinci_gpio_irq_map,
	.xlate = irq_domain_xlate_onetwocell,
};


> +			gpio_irq++;
>   		}
>   
>   		binten |= BIT(bank);
> @@ -483,7 +496,7 @@ done:
>   	 */
>   	__raw_writel(binten, gpio_base + BINTEN);
>   
> -	printk(KERN_INFO "DaVinci: %d gpio irqs\n", irq - gpio_to_irq(0));
> +	pr_info("DaVinci: %d gpio irqs\n", gpio_irq);
>   
>   	return 0;
>   }
[...]
>   	spinlock_t		lock;
>   	void __iomem		*regs;
> 
start

Regards,
- grygorii
