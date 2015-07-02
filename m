From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 1/2] gpio: dwapb: Use human understandable gpio numbering.
Date: Thu, 02 Jul 2015 09:36:22 +0200
Message-ID: <5594E9F6.7040701@linutronix.de>
References: <cover.1435777856.git.rcochran@linutronix.de> <d6b5ce85a17164970d454583560e07f7aed7b8ca.1435777856.git.rcochran@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <d6b5ce85a17164970d454583560e07f7aed7b8ca.1435777856.git.rcochran@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Alan Tull <atull@altera.com>, Alexandre Courbot <gnurou@gmail.com>, Dinh Nguyen <dinguyen@altera.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On 07/01/2015 09:34 PM, Richard Cochran wrote:
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 58faf04..b7e7977 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -491,6 +491,13 @@ dwapb_gpio_get_pdata_of(struct device *dev)
>  			return ERR_PTR(-EINVAL);
>  		}
>  
> +		if (of_property_read_u32(port_np, "snps,base",
> +					 &pp->gpio_base)) {
> +			dev_info(dev, "no base gpio specified for %s\n",
> +				 port_np->full_name);
> +			pp->gpio_base = -1;
> +		}
> +

If you are in a specific SoC you could do
	base = of_alias_get_id(np, "gpio") * num_of_gpio_per_chip
and get consistent numbers / sane.
I think this is the one reason why there is no generic binding for the
starting address. The other reason might be that this is simply a user
space problem. To get consistent numbers all you need to do to lookup
each gpio's memory address and decide if this is the one you look for.

Sebastian
