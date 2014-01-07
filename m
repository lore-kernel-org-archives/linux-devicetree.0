From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] reset: Add GPIO support to reset controller
 framework
Date: Tue, 07 Jan 2014 10:52:21 +0100
Message-ID: <1389088341.4815.9.camel@pizza.hi.pengutronix.de>
References: <1389030903-27684-1-git-send-email-p.zabel@pengutronix.de>
	 <1389030903-27684-2-git-send-email-p.zabel@pengutronix.de>
	 <20140106181422.GS3144@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140106181422.GS3144@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Am Montag, den 06.01.2014, 19:14 +0100 schrieb Maxime Ripard:
> > +struct reset_control *gpio_reset_control_get(struct device *dev, const char *id)
> > +{
> > +	const char *assert_prop = "reset-initially-asserted";
> 
> I guess you meant reset-boot-asserted here, right?

Yes, thank you.

> > +	const char *gpio_con_id = "reset";
> > +	struct reset_controller_dev *rcdev;
> > +	struct reset_control *rstc;
> > +	struct gpio_desc *gpiod;
> > +	bool asserted = false;
> > +	char scratch[48];
> > +	int ret;
> > +
> > +	if (id) {
> > +		snprintf(scratch, 48, "%s-reset-boot-asserted", id);
> > +		assert_prop = scratch;
> > +	}
> > +
> > +	asserted = of_property_read_bool(dev->of_node, assert_prop);
> > +
> > +	if (id) {
> > +		snprintf(scratch, 48, "%s-reset", id);
> > +		gpio_con_id = scratch;
> > +	}
> > +
> > +	gpiod = gpiod_get(dev, gpio_con_id);
> > +	if (IS_ERR(gpiod)) {
> > +		dev_err(dev, "Failed to get GPIO reset: %ld\n", PTR_ERR(gpiod));
> > +		return ERR_CAST(gpiod);
> > +	}
> > +
> > +	ret = gpiod_direction_output(gpiod, asserted);
> > +	if (ret < 0)
> > +		goto err_put;
> 
> What happens if the GPIO is active low? I see no way in your binding
> and driver to give that information, and that would change the
> behaviour quite a bit.

I was under the (wrong) impression that gpiod_direction_output takes a
logical value as gpiod_set_value does. Will fix that.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
