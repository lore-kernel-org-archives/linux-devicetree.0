From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [RFC v4 12/26] watchdog: renesas_wdt: Add R-Car Gen2 support
Date: Mon, 12 Feb 2018 10:31:06 +0000
Message-ID: <TY1PR06MB0895E25D31BA11A42F24DF80C0F70@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1517423070-24236-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1517423070-24236-13-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180207225356.pgirh2ohdsv7xdne@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180207225356.pgirh2ohdsv7xdne@katana>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>l
List-Id: devicetree@vger.kernel.org

Hello Wolfram,

thank you for your feedback!

> Subject: Re: [RFC v4 12/26] watchdog: renesas_wdt: Add R-Car Gen2 support
>
>
> > +#ifdef CONFIG_PM
> > +static int rwdt_suspend(struct device *dev)
> > +{
> > +struct platform_device *pdev;
> > +struct rwdt_priv *priv;
> > +
> > +pdev =3D to_platform_device(dev);
> > +priv =3D platform_get_drvdata(pdev);
>
> struct rwdt_priv *priv =3D dev_get_drvdata(dev);
>
> ?

will change

>
>
> > +if (watchdog_active(&priv->wdev)) {
> > +rwdt_write(priv, priv->cks, RWTCSRA);
> > +}
> > +return 0;
> > +}
> > +
> > +static int rwdt_resume(struct device *dev)
> > +{
> > +struct platform_device *pdev;
> > +struct rwdt_priv *priv;
> > +
> > +pdev =3D to_platform_device(dev);
> > +priv =3D platform_get_drvdata(pdev);
>
> ditto

will change

>
> > +if (watchdog_active(&priv->wdev)) {
> > +rwdt_write(priv, priv->cks | RWTCSRA_TME, RWTCSRA);
> > +}
> > +return 0;
> > +}
> > +
> > +static const struct dev_pm_ops rwdt_pm =3D {
> > +.suspend =3D rwdt_suspend,
> > +.resume =3D rwdt_resume,
> > +};
>
> Use SIMPLE_DEV_PM_OPS macro (see stmp3xxx_rtc_wdt.c for an example) for
> more compact code and...
>
> > +#ifdef CONFIG_PM
> > +.pm =3D &rwdt_pm,
> > +#endif
>
> ... removing this ifdeffery?

will take out the ifdeffery


Thanks,
Fabrizio



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
