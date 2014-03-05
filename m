From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/5] ARM: imx6: gpc: Add PU power domain for GPU/VPU
Date: Wed, 5 Mar 2014 19:05:15 +0800
Message-ID: <20140305110513.GM8784@S2101-09.ap.freescale.net>
References: <1393603427-6199-1-git-send-email-p.zabel@pengutronix.de>
 <1393603427-6199-3-git-send-email-p.zabel@pengutronix.de>
 <20140305065649.GJ8784@S2101-09.ap.freescale.net>
 <1394013924.16929.14.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394013924.16929.14.camel-+qGW7pzALmz7o/J7KWpOmN53zsg1cpMQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 05, 2014 at 11:05:24AM +0100, Philipp Zabel wrote:
> > > +static int imx_gpc_probe(struct platform_device *pdev)
> > > +{
> > > +	struct regulator *pu_reg;
> > > +	struct clk *clk;
> > > +	bool is_off;
> > > +	int ret, i;
> > > +
> > > +	pu_reg = devm_regulator_get(&pdev->dev, "pu");
> > > +	if (IS_ERR(pu_reg)) {
> > > +		ret = PTR_ERR(pu_reg);
> > > +		dev_err(&pdev->dev, "failed to get pu regulator: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* The regulator is initially enabled */
> > > +	ret = regulator_enable(pu_reg);
> > > +	if (ret < 0) {
> > > +		dev_err(&pdev->dev, "failed to enable pu regulator: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +	imx6q_pu_domain.base.of_node = pdev->dev.of_node;
> > 
> > How does this work with !CONFIG_PM build?
> 
> Since I removed the regulator-always-on property from the PU regulator
> in the device tree, if CONFIG_PM is disabled, we have to request and
> enable pu_reg here. Otherwise the regulator framework will helpfully
> turn it off (imx6q-cpufreq never enables pu_reg).
> With the PU regulator disabled, the system would hang as soon as the
> CODA VPU or one of the Vivante GPU cores is accessed if !CONFIG_PM.

Sorry, I should have been more specific.  My question is how stuff like
imx6q_pu_domain are available for !CONFIG_PM build, since they are only
defined in #ifdef CONFIG_PM right above imx_gpc_probe().

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
