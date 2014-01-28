From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 14/20] watchdog: orion: Add support for Armada 370 and
 Armada XP SoC
Date: Tue, 28 Jan 2014 07:27:50 -0300
Message-ID: <20140128102750.GA13052@localhost>
References: <1390836440-12744-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390836440-12744-15-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140127173624.GT15937@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140127173624.GT15937-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 27, 2014 at 05:36:24PM +0000, Russell King - ARM Linux wrot=
e:
[..]
> > +static int armadaxp_wdt_clock_init(struct platform_device *pdev,
> > +				   struct orion_watchdog *dev)
> > +{
> > +	int ret;
> > +
> > +	dev->clk =3D of_clk_get_by_name(pdev->dev.of_node, "fixed");
> > +	if (IS_ERR(dev->clk))
> > +		return PTR_ERR(dev->clk);
> > +	ret =3D clk_prepare_enable(dev->clk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Enable the fixed watchdog clock input */
> > +	atomic_io_modify(dev->reg + TIMER_CTRL,
> > +			 WDT_AXP_FIXED_ENABLE_BIT,
> > +			 WDT_AXP_FIXED_ENABLE_BIT);
> > +
> > +	dev->clk_rate =3D clk_get_rate(dev->clk);
> > +	return 0;
> > +}
>=20
> Doesn't this result in dev->clk being leaked?  Or at least a differen=
ce
> in the way dev->clk needs to be cleaned up between these two function=
s?
>=20

Yes, indeed.

> I think it would be better in this case to use the standard clk_get()=
 in
> the first function and always use clk_put()... until there is a devm_=
*
> version of the of_clk_get* functions.
>=20

Sound good.

Thanks,
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
