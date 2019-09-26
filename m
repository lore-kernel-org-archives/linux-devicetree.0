From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH v5] gpio/mpc8xxx: change irq handler from chained to
 normal
Date: Thu, 26 Sep 2019 16:35:42 +0100
Message-ID: <20190926153542.GE25745@shell.armlinux.org.uk>
References: <20190916055817.43425-1-hui.song_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190916055817.43425-1-hui.song_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hui Song <hui.song_1@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 16, 2019 at 01:58:17PM +0800, Hui Song wrote:
> From: Song Hui <hui.song_1@nxp.com>
> 
> More than one gpio controllers can share one interrupt, change the
> driver to request shared irq.
> 
> Signed-off-by: Laurentiu Tudor <Laurentiu.Tudor@nxp.com>
> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>

While this will work, it will mess up userspace accounting of the
number of interrupts per second in tools such as vmstat.  The reason
is that for every GPIO interrupt, /proc/interrupts records the count
against GIC interrupt 68 or 69, as well as the GPIO itself.  So, for
every GPIO interrupt, the total number of interrupts that the system
has seen increments by two.

If we don't care about accurate interrupt statistics, then this is
fine, but I think it should be mentioned in the commit message.

> ---
> Changes in v5:
> 	- add traverse every bit function.
> Changes in v4:
> 	- convert 'pr_err' to 'dev_err'.
> Changes in v3:
> 	- update the patch description.
> Changes in v2:
> 	- delete the compatible of ls1088a.
>  drivers/gpio/gpio-mpc8xxx.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 16a47de..3a06ca9 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -22,6 +22,7 @@
>  #include <linux/irq.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/bitops.h>
> +#include <linux/interrupt.h>
>  
>  #define MPC8XXX_GPIO_PINS	32
>  
> @@ -127,20 +128,20 @@ static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
>  		return -ENXIO;
>  }
>  
> -static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
> +static irqreturn_t mpc8xxx_gpio_irq_cascade(int irq, void *data)
>  {
> -	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_desc_get_handler_data(desc);
> -	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	struct mpc8xxx_gpio_chip *mpc8xxx_gc = (struct mpc8xxx_gpio_chip *)data;
>  	struct gpio_chip *gc = &mpc8xxx_gc->gc;
>  	unsigned int mask;
> +	int i;
>  
>  	mask = gc->read_reg(mpc8xxx_gc->regs + GPIO_IER)
>  		& gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR);
> -	if (mask)
> +	for_each_set_bit(i, &mask, 32)
>  		generic_handle_irq(irq_linear_revmap(mpc8xxx_gc->irq,
> -						     32 - ffs(mask)));
> -	if (chip->irq_eoi)
> -		chip->irq_eoi(&desc->irq_data);
> +						     31 - i));
> +
> +	return IRQ_HANDLED;
>  }
>  
>  static void mpc8xxx_irq_unmask(struct irq_data *d)
> @@ -388,8 +389,8 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>  
>  	ret = gpiochip_add_data(gc, mpc8xxx_gc);
>  	if (ret) {
> -		pr_err("%pOF: GPIO chip registration failed with status %d\n",
> -		       np, ret);
> +		dev_err(&pdev->dev, "%pOF: GPIO chip registration failed with status %d\n",
> +			np, ret);
>  		goto err;
>  	}
>  
> @@ -409,8 +410,15 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>  	if (devtype->gpio_dir_in_init)
>  		devtype->gpio_dir_in_init(gc);
>  
> -	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
> -					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
> +	ret = request_irq(mpc8xxx_gc->irqn, mpc8xxx_gpio_irq_cascade,
> +			  IRQF_NO_THREAD | IRQF_SHARED, "gpio-cascade",
> +			  mpc8xxx_gc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: failed to request_irq(%d), ret = %d\n",
> +			np->full_name, mpc8xxx_gc->irqn, ret);
> +		goto err;
> +	}
> +
>  	return 0;
>  err:
>  	iounmap(mpc8xxx_gc->regs);
> -- 
> 2.9.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
