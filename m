From: Thomas Elste <thomas.elste-cSCHQGRfioA@public.gmane.org>
Subject: Re: [PATCH] regulator: tps65023: add device tree support
Date: Thu, 17 Sep 2015 10:43:35 +0200
Message-ID: <20150917104335.5464f8b5@pluto>
References: <1442324035-16414-1-git-send-email-thomas.elste@imms.de>
	<1442324035-16414-2-git-send-email-thomas.elste@imms.de>
	<20150916195612.GT12027@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150916195612.GT12027-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > +static struct regulator_init_data*
> > +	of_get_tps65023_platform_data(struct device *dev)
> > +{
> > +	struct regulator_init_data *reg_data;
> > +	struct device_node *np = dev->of_node;
> > +	struct device_node *regulators;
> > +	struct of_regulator_match *matches;
> > +	int idx, count, ret;
> > +
> > +	regulators = of_get_child_by_name(np, "regulators");
> > +	if (!regulators) {
> > +		dev_err(dev, "Regulator node not found\n");
> > +		return NULL;
> > +	}
> 
> There's now core support for this so no need to open code in the
> driver
> - set of_match and regulators_node in the regulator_desc instead.
Thanks for reviewing. I'll change the patch to matching regulator nodes
via regulator core code.

And I will use a separate patch for the binding document (just found
Documentation/devicetree/bindings/submitting-patches.txt).


Best regards
Thomas

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
