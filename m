From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [RFC v4 12/26] watchdog: renesas_wdt: Add R-Car Gen2 support
Date: Wed, 7 Feb 2018 23:53:56 +0100
Message-ID: <20180207225356.pgirh2ohdsv7xdne@katana>
References: <1517423070-24236-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1517423070-24236-13-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x2emqnqh5zo5pl5i"
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1517423070-24236-13-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju
List-Id: devicetree@vger.kernel.org


--x2emqnqh5zo5pl5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +#ifdef CONFIG_PM
> +static int rwdt_suspend(struct device *dev)
> +{
> +	struct platform_device *pdev;
> +	struct rwdt_priv *priv;
> +
> +	pdev = to_platform_device(dev);
> +	priv = platform_get_drvdata(pdev);

struct rwdt_priv *priv = dev_get_drvdata(dev);

?


> +	if (watchdog_active(&priv->wdev)) {
> +		rwdt_write(priv, priv->cks, RWTCSRA);
> +	}
> +	return 0;
> +}
> +
> +static int rwdt_resume(struct device *dev)
> +{
> +	struct platform_device *pdev;
> +	struct rwdt_priv *priv;
> +
> +	pdev = to_platform_device(dev);
> +	priv = platform_get_drvdata(pdev);

ditto

> +	if (watchdog_active(&priv->wdev)) {
> +		rwdt_write(priv, priv->cks | RWTCSRA_TME, RWTCSRA);
> +	}
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops rwdt_pm = {
> +	.suspend = rwdt_suspend,
> +	.resume = rwdt_resume,
> +};

Use SIMPLE_DEV_PM_OPS macro (see stmp3xxx_rtc_wdt.c for an example) for
more compact code and...

> +#ifdef CONFIG_PM
> +		.pm = &rwdt_pm,
> +#endif

... removing this ifdeffery?


--x2emqnqh5zo5pl5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlp7g38ACgkQFA3kzBSg
KbYnog/7BQsY8nwc8noFCm8FP2wPZmQ9mkLXkMz+xpFBzL2RJh5V60jwNfYdgqRH
523vlZJ7oJ3vFiOie5A29Xk3uQ6z9hybRyfoqEkdhTRV1GIl1iS4nZGzB5vuFHAb
sEaRyH4CfMOjpjlFNMoylJXNvqZO3SyIv/9JfNG0xTDTOOL2OabCgqo2hKC3qkfw
XFx2E/+UhGUXx24AjImWjM1u/98j5iubpXUqgML/N+M3youIrXloYSPjQ1aORSQR
zDuhk9H5WXcVUiyyyEzV2uC+rptqkoJAybYLjWM76rrrQRgoCw1Q68f3/aOBVza0
truSbQArJWKRMhjuW4wxdHeWlvEKlYfu2pHCB9lf3DScR4iW4DmaTtpQKiu9eUnm
/3V9Bs7345dpGf1sbtgIhMfGzDpKpM8xjNHHzsWMqAE9+kGVxgl4TouEedDh7t4Q
BkbgTKHcvaktebxXkCNeQIHrxqYAHGmySfZZC4BrsUtfJLX5yr72/SKT8LGpCS7O
5kpoil1jTz1Vkgx9l7c3tfTG4eX7p943dimpvr8K9MBUodCJAbsrzd/Wx446N8bx
1BX33C7EAJAmi9MWWWIUnTTLW2vwaqBJhiUDqKCcPI9N6jX1asgrPOITF8qxWjEW
oRuePWinnSbLgiU7Z/hOu0vVzftkQAHKbCqLw7wv86CZJBhY9hg=
=oLOg
-----END PGP SIGNATURE-----

--x2emqnqh5zo5pl5i--
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
