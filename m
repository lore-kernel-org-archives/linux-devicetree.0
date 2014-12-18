From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/8] watchdog: st_wdt: Add new driver for ST's LPC
 Watchdog
Date: Thu, 18 Dec 2014 08:26:52 +0000
Message-ID: <20141218082652.GP13885@x1>
References: <1418834727-1602-1-git-send-email-lee.jones@linaro.org>
 <1418834727-1602-7-git-send-email-lee.jones@linaro.org>
 <20141217180251.GA29914@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141217180251.GA29914-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, David Paris <david.paris-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 17 Dec 2014, Guenter Roeck wrote:
> On Wed, Dec 17, 2014 at 04:45:25PM +0000, Lee Jones wrote:
> > Signed-off-by: David Paris <david.paris-qxv4g6HH51o@public.gmane.org>
> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> Hi Lee and David,
>=20
> I still have a couple of comments below. Sorry I didn't catch those e=
arlier.
>=20
> Thanks,
> Guenter
>=20
> > ---
> >  drivers/watchdog/Kconfig  |  13 ++
> >  drivers/watchdog/Makefile |   1 +
> >  drivers/watchdog/st_wdt.c | 323 ++++++++++++++++++++++++++++++++++=
++++++++++++
> >  3 files changed, 337 insertions(+)
> >  create mode 100644 drivers/watchdog/st_wdt.c

Chopping all the crud.

[...]

> > +static struct of_device_id st_wdog_match[] =3D {
> > +	{
> > +		.compatible =3D "st,stih407-lpc",
> > +		.data =3D (void *)&stih407_syscfg,
>=20
> Nitpick: typecast to and from void * is not necessary.

Actually that's not true, but it is superfluous in this case.

I will fix-up.

[...]

> > +static int st_wdog_probe(struct platform_device *pdev)
> > +{
> > +	const struct of_device_id *match;
> > +	struct device_node *np =3D pdev->dev.of_node;
> > +	struct st_wdog *st_wdog;
> > +	struct regmap *regmap;
> > +	struct resource *res;
> > +	struct clk *clk;
> > +	void __iomem *base;
> > +	uint32_t mode;
> > +	int ret;

[...]

> > +	clk =3D clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(clk)) {
> > +		dev_err(&pdev->dev, "Unable to request clock\n");
> > +		return PTR_ERR(clk);
> > +	}
> > +	clk_prepare_enable(st_wdog->clk);
>=20
> How does this work ? st_wdog->clk isn't set yet.

Great spot.  That should be 'clk'.

It works because the LPC clk is already on.

> > +
> > +	st_wdog->dev		=3D &pdev->dev;
> > +	st_wdog->base		=3D base;
> > +	st_wdog->clk		=3D clk;
> > +	st_wdog->syscfg->regmap =3D regmap;
> > +	st_wdog->warm_reset	=3D of_property_read_bool(np, "st,warm_reset"=
);
> > +	st_wdog->clkrate	=3D clk_get_rate(st_wdog->clk);
> > +
> > +	if (!st_wdog->clkrate) {
> > +		dev_err(&pdev->dev, "Unable to fetch clock rate\n");
>=20
> I think this is missing
> 	clk_disable_unprepare();
> 	clk_put();
>=20
> Same for the rest of the error path handling below.

Actually instead of clk_put we should be using s/clk_get/devm_clk_get/.

You're right about the error paths.  I will enforce a better one.

Thanks.

[...]

> > +#ifdef CONFIG_PM
>=20
> I think this needs to be CONFIG_PM_SLEEP.
> Another option might be to drop the #ifdef entirely and use
> __maybe_unused instead.

Hmmm... what version is this?

[2 mins pass]

Oh rubbish.  I've been a silly boy!

[spoiler alert: take a look at the end of the RTC driver patch]

Will be fixed in v3.

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
