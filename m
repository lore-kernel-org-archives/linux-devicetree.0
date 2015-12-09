From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/3] usb: misc: generic_onboard_hub: add generic onboard
 USB HUB driver
Date: Wed, 9 Dec 2015 16:23:04 +0800
Message-ID: <20151209082303.GD941@shlinux2>
References: <1449538670-7954-1-git-send-email-peter.chen@freescale.com>
 <1449538670-7954-2-git-send-email-peter.chen@freescale.com>
 <20151208061905.GM11966@pengutronix.de>
 <20151208092655.GC16881@shlinux2>
 <20151208094402.GP11966@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151208094402.GP11966-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 08, 2015 at 10:44:02AM +0100, Sascha Hauer wrote:
> On Tue, Dec 08, 2015 at 05:26:56PM +0800, Peter Chen wrote:
> > On Tue, Dec 08, 2015 at 07:19:05AM +0100, Sascha Hauer wrote:
> > > > +	hub_data = devm_kzalloc(dev, sizeof(*hub_data), GFP_KERNEL);
> > > > +	if (!hub_data)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	if (dev->of_node) {
> > > > +		struct device_node *node = dev->of_node;
> > > > +
> > > > +		hub_data->clk = devm_clk_get(dev, "external_clk");
> > > 
> > > Please drop such _clk suffixes. The context already makes it clear that
> > > it's a clock.
> > > 
> > 
> > Will change.
> > 
> > > > +		if (IS_ERR(hub_data->clk)) {
> > > > +			dev_dbg(dev, "Can't get external clock: %ld\n",
> > > > +					PTR_ERR(hub_data->clk));
> > > > +		}
> > > > +
> > > > +		/*
> > > > +		 * Try to get the information for HUB reset, the
> > > > +		 * default setting like below:
> > > > +		 *
> > > > +		 * - Reset state is low
> > > > +		 * - The duration is 50us
> > > > +		 */
> > > > +		if (of_find_property(node, "hub-reset-active-high", NULL))
> > > > +			reset_pol = 1;
> > > > +
> > > > +		of_property_read_u32(node, "hub-reset-duration-us",
> > > > +			&duration_us);
> > > > +
> > > > +		gpiod_reset = devm_gpiod_get_optional(dev, "hub-reset",
> > > > +			reset_pol ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
> > > > +		ret = PTR_ERR_OR_ZERO(gpiod_reset);
> > > > +		if (ret) {
> > > > +			dev_err(dev, "Failed to get reset gpio, err = %d\n",
> > > > +				ret);
> > > > +			return ret;
> > > > +		}
> > > > +	} else if (pdata) {
> > > > +		hub_data->clk = pdata->ext_clk;
> > > 
> > > Passing clocks in platform_data is a no go. clocks must always be
> > > retrieved with clk_get.
> > 
> > Yes, you are right.
> > 
> > > 
> > > > +		duration_us = pdata->gpio_reset_duration_us;
> > > > +		reset_pol = pdata->gpio_reset_polarity;
> > > > +
> > > > +		if (gpio_is_valid(pdata->gpio_reset)) {
> > > > +			ret = devm_gpio_request_one(
> > > > +				dev, pdata->gpio_reset, reset_pol
> > > > +				? GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW,
> > > > +				dev_name(dev));
> > > > +			if (!ret)
> > > > +				gpiod_reset = gpio_to_desc(pdata->gpio_reset);
> > > 
> > > If the gpio is valid then being unable to get it is an error.
> > 
> > I can't catch you, if the gpio is invalid, its descriptor will be NULL,
> > then, the code will not do any gpio operation.
> 
> When the platform_data provides a gpio (gpio_is_valid() is true) then
> you must use the gpio. If then devm_gpio_request_one() fails you must
> bail out.

I see.

> 
> > 
> > > 
> > > Do you need this platform_data stuff at all?
> > > 
> > 
> > If not, how can I cover the platform which does not use dts, but still
> > uses these kinds of HUBs?
> 
> You can't, but are there any non device tree platforms which want to use
> this driver?
> 

I thought there are i386 embedded devices, it may use the HUB, like this
driver tries to handle. I agree that we only handle dt in this driver
first until the non-dt user appears.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
