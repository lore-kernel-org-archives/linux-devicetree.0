From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3 v2] GPIO: gpio-dwapb: Enable platform driver binding to MFD driver
Date: Fri, 05 Sep 2014 13:50:06 +0200
Message-ID: <3465722.Gc9y01nQRe@wuerfel>
References: <1409928798-31895-1-git-send-email-alvin.chen@intel.com> <1409928798-31895-2-git-send-email-alvin.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409928798-31895-2-git-send-email-alvin.chen@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Weike Chen <alvin.chen@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, atull <atull@opensource.altera.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Boon Leong Ong <boon.leong.ong@intel.com>, Hock Leong Kweh <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Mika Westerberg <mika.westerberg@intel.com>, Andriy Shevchenko <andriy.shevchenko@intel.com>
List-Id: devicetree@vger.kernel.org

On Friday 05 September 2014 07:53:16 Weike Chen wrote:
>  
> -	irq_set_chained_handler(irq, dwapb_irq_handler);
> -	irq_set_handler_data(irq, gpio);
> +	if (!pp->irq_shared) {
> +		irq_set_chained_handler(pp->irq, dwapb_irq_handler);
> +		irq_set_handler_data(pp->irq, gpio);
> +	} else {
> +		/*
> +		 * Request a shared IRQ since where MFD would have devices
> +		 * using the same irq pin
> +		 */
> +		err = devm_request_irq(gpio->dev, pp->irq,
> +				       dwapb_irq_handler_mfd,
> +				       IRQF_SHARED, "gpio-dwapb-mfd", gpio);
> +		if (err) {
> +			dev_err(gpio->dev, "error requesting IRQ\n");
> +			irq_domain_remove(gpio->domain);
> +			gpio->domain = NULL;
> +			return;
> +		}
> +	}
>

I think this need some better documentation. Why is it safe to use
devm_request_irq rather than irq_set_chained_handler here?


>  
> +#ifdef CONFIG_OF_GPIO
> +
> +static struct dwapb_platform_data *
> +dwapb_gpio_get_pdata_of(struct device *dev)
> +{
> +	struct device_node *node, *port_np;
> +	struct dwapb_platform_data *pdata;
> +	struct dwapb_port_property *pp;
> +	int nports;
> +	int i;
> +
> +	node = dev->of_node;
> +	if (!node)
> +		return ERR_PTR(-ENODEV);

Please replace the #ifdef above with 

	if (!IS_ENABLED(CONFIG_OF_GPIO) || !node)

here so get you proper compile-time coverage of the DT code path.

	Arnd
