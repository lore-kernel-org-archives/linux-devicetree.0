From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] gpio: davinci: reuse for Keystone SoC
Date: Mon, 16 Dec 2013 11:38:31 -0500
Message-ID: <52AF2C87.1060700@ti.com>
References: <1386871973-26762-1-git-send-email-grygorii.strashko@ti.com>
	<1386871973-26762-3-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1386871973-26762-3-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 12 December 2013 01:12 PM, Grygorii Strashko wrote:
> The similar GPIO HW block is used by keystone SoCs as
> in Davinci SoCs.
> Hence, reuse Davinci GPIO driver for Keystone taking into
> account that Keystone contains ARM GIC IRQ controller which
> is implemented using IRQ Chip.
> 
> Documentation:
> 	http://www.ti.com/lit/ug/sprugv1/sprugv1.pdf
> 
> CC: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> CC: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
> CC: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
> CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> ---
>  .../devicetree/bindings/gpio/gpio-davinci.txt      |    4 +-
>  drivers/gpio/gpio-davinci.c                        |   49 +++++++++++++++-----
>  2 files changed, 40 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> index a2e839d..4ce9862 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> @@ -1,7 +1,7 @@
> -Davinci GPIO controller bindings
> +Davinci/Keystone GPIO controller bindings
>  
>  Required Properties:
> -- compatible: should be "ti,dm6441-gpio"
> +- compatible: should be "ti,dm6441-gpio", "ti,keystone-gpio"
>  
>  - reg: Physical base address of the controller and the size of memory mapped
>         registers.
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index 73f65ca..3e44e0c 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -413,6 +413,27 @@ static const struct irq_domain_ops davinci_gpio_irq_ops = {
>  	.xlate = irq_domain_xlate_onetwocell,
>  };
>  
> +static struct irq_chip *davinci_gpio_get_irq_chip(unsigned int irq)
> +{
> +	static struct irq_chip_type gpio_unbanked;
> +
> +	gpio_unbanked = *container_of(irq_get_chip(irq),
> +				      struct irq_chip_type, chip);
> +
> +	return &gpio_unbanked.chip;
> +};
> +
> +static struct irq_chip *keystone_gpio_get_irq_chip(unsigned int irq)
> +{
> +	static struct irq_chip gpio_unbanked;
> +
> +	gpio_unbanked = *irq_get_chip(irq);
> +	pr_err("keystone_gpio_get_irq_chip\n");
> +	return &gpio_unbanked;
> +};
> +
> +static const struct of_device_id davinci_gpio_ids[];
> +
>  /*
>   * NOTE:  for suspend/resume, probably best to make a platform_device with
>   * suspend_late/resume_resume calls hooking into results of the set_wake()
> @@ -433,6 +454,15 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>  	struct davinci_gpio_platform_data *pdata = dev->platform_data;
>  	struct davinci_gpio_regs __iomem *g;
>  	struct irq_domain	*irq_domain = NULL;
> +	const struct of_device_id *match;
> +	struct irq_chip *irq_chip;
> +	struct irq_chip *(*gpio_get_irq_chip)(unsigned int irq);
> +
> +	gpio_get_irq_chip = davinci_gpio_get_irq_chip;
> +	match = of_match_device(of_match_ptr(davinci_gpio_ids),
> +				dev);
> +	if (match)
> +		gpio_get_irq_chip = match->data;
and if the DT node is not populated ?
>  
>  	ngpio = pdata->ngpio;
>  	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> @@ -442,7 +472,6 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>  	}
>  
>  	bank_irq = res->start;
> -
stray change..

>  	if (!bank_irq) {
>  		dev_err(dev, "Invalid IRQ resource\n");
>  		return -ENODEV;
> @@ -484,25 +513,22 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>  	}
>  
>  	/*
> -	 * AINTC can handle direct/unbanked IRQs for GPIOs, with the GPIO
> +	 * INTC can handle direct/unbanked IRQs for GPIOs, with the GPIO
So you want to have a generic name here. If you are changing it, change it
across the driver in a separate patch or leave it as is...
I don't think it matters much..

With those comments addressed, you can add my ack.
Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
