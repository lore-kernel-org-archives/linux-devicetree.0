From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v7] gpio: Add MOXA ART GPIO driver
Date: Fri, 29 Nov 2013 20:06:31 +0100
Message-ID: <201311292006.31661.arnd@arndb.de>
References: <1385651945-22355-1-git-send-email-jonas.jensen@gmail.com> <1385723494-8033-1-git-send-email-jonas.jensen@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385723494-8033-1-git-send-email-jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 29 November 2013, Jonas Jensen wrote:
> Add GPIO driver for MOXA ART SoCs.
> 
> Signed-off-by: Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

One more comment, no need to resend for another review if this is the only
thing you want to change:

> +struct moxart_gpio_chip {
> +	struct gpio_chip gpio;
> +	void __iomem *moxart_gpio_base;
> +};

If you rename 'moxart_gpio_base' to 'base'

> +static int moxart_gpio_get(struct gpio_chip *chip, unsigned offset)
> +{
> +	struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
> +	u32 ret = readl(gc->moxart_gpio_base + GPIO_PIN_DIRECTION);
> +
> +	if (ret & BIT(offset))
> +		return !!(readl(gc->moxart_gpio_base + GPIO_DATA_OUT) &
> +			  BIT(offset));
> +	else
> +		return !!(readl(gc->moxart_gpio_base + GPIO_DATA_IN) &
> +			  BIT(offset));
> +}

These will fit in one line with no loss of readability.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
