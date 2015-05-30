From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 2/6] gpio: brcmstb: Add interrupt support
Date: Fri, 29 May 2015 17:10:33 -0700
Message-ID: <20150530001033.GV27753@ld-irv-0074>
References: <1432865650-4062-1-git-send-email-gregory.0xf0@gmail.com>
 <1432865650-4062-3-git-send-email-gregory.0xf0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432865650-4062-3-git-send-email-gregory.0xf0@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

A few small comments:

On Thu, May 28, 2015 at 07:14:06PM -0700, Gregory Fong wrote:
> v2:
> - since imask member of bank struct was removed, just read and write from mask
>   reg and don't maintain a shadow

^^ this comment may be addressing what I'm going to ask about below? Not
sure why this was changed, actually.

> - warn on invalid IRQs
> - move some irq setup to a separate function since probe is getting unwieldy
> 
>  drivers/gpio/Kconfig        |   1 +
>  drivers/gpio/gpio-brcmstb.c | 276 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 277 insertions(+)
> 
...
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index 7a3cb1f..b9962ff 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
...
> @@ -63,6 +69,231 @@ brcmstb_gpio_gc_to_priv(struct gpio_chip *gc)
...
> +static void brcmstb_gpio_irq_bank_handler(int irq,
> +		struct brcmstb_gpio_bank *bank)
> +{
> +	struct brcmstb_gpio_priv *priv = bank->parent_priv;
> +	void __iomem *reg_base = priv->reg_base;
> +	unsigned long status;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&bank->bgc.lock, flags);
> +	while ((status = bank->bgc.read_reg(reg_base + GIO_STAT(bank->id)) &
> +			 bank->bgc.read_reg(reg_base + GIO_MASK(bank->id)))) {

In case you do run this loop multiple times (multiple interrupts in
progress?), wouldn't it make sense to stash the mask exactly once,
outside the loop? It's probably not a real big deal in practice, I
guess.

> +		int bit;
> +		for_each_set_bit(bit, &status, 32) {
> +			int hwirq = bank->bgc.gc.base -
> +				priv->gpio_base + bit;
> +			int child_irq =
> +				irq_find_mapping(priv->irq_domain,
> +						 hwirq);
> +			u32 stat = bank->bgc.read_reg(reg_base +
> +						      GIO_STAT(bank->id));
> +			if (bit >= bank->width)
> +				dev_warn(&priv->pdev->dev,
> +					 "IRQ for invalid GPIO (bank=%d, offset=%d)\n",
> +					 bank->id, bit);
> +			bank->bgc.write_reg(reg_base + GIO_STAT(bank->id),
> +					    stat | BIT(bit));
> +			generic_handle_irq(child_irq);
> +		}
> +	}
> +	spin_unlock_irqrestore(&bank->bgc.lock, flags);
> +}
...
> @@ -153,6 +410,16 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
>  	priv->reg_base = reg_base;
>  	priv->pdev = pdev;
>  
> +	if (of_find_property(np, "interrupt-controller", NULL)) {

of_property_read_bool()?

> +		priv->parent_irq = platform_get_irq(pdev, 0);
> +		if (priv->parent_irq < 0) {
> +			dev_err(dev, "Couldn't get IRQ");
> +			return -ENOENT;
> +		}
> +	} else {
> +		priv->parent_irq = -ENOENT;
> +	}
> +
>  	INIT_LIST_HEAD(&priv->bank_list);
>  	if (brcmstb_gpio_sanity_check_banks(dev, np, res))
>  		return -EINVAL;

Otherwise, looks OK to my inexpert eyes.

Reviewed-by: Brian Norris <computersforpeace@gmail.com>
