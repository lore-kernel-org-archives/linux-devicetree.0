From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: initial clock driver for TWL6030
Date: Wed, 30 Jul 2014 18:50:33 +0100
Message-ID: <20140730175033.GA17528@sirena.org.uk>
References: <1406728949-7560-1-git-send-email-sassmann@kpanic.de>
 <1406728949-7560-3-git-send-email-sassmann@kpanic.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="58l+liMhP3+87v+P"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1406728949-7560-3-git-send-email-sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, peter.ujfalusi-l0cyMroinI0@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org


--58l+liMhP3+87v+P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 30, 2014 at 04:02:29PM +0200, Stefan Assmann wrote:

> +static int twl6030_clk32kg_is_prepared(struct clk_hw *hw)
> +{
> +	struct twl6030_desc *desc = to_twl6030_desc(hw);
> +
> +	return desc->enabled;
> +}

Why not just check the register map - can't the register be cached?  If
that's not possible a comment would be good.

> +static int of_twl6030_clk32kg_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct clk *clk;
> +	int ret = 0;
> +
> +	if (!node)
> +		return -ENODEV;
> +
> +	clk = clk_get(&pdev->dev, "clk32kg");

devm_clk_get()?

> +	if (IS_ERR(clk))
> +		ret = -EPROBE_DEFER;

Shouldn't the provided return code be being used?

> +	else
> +		clk_prepare(clk);

Why is the clock driver defaulting to enabling the clock, and if it
needs to shouldn't it be doing a prepere_enable() even if the enable
happens not to do anything to the hardware?  Otherwise child clocks
might get confused.

The return value is also not being checked.

--58l+liMhP3+87v+P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2TBmAAoJELSic+t+oim9muIP/ie+pHPmirfRYp4gimECI4V0
BcKVfOb6guc9K7hUjRSDdM3iPCPxr75bJ9hDrP56VMQGZn3daCydCCwXW0c88zs4
jhMuefFH0glGgfWbWOHvR8Du98hhfL/UP1tKoEMk4J2/tmaGlfXbj2U6V8dIzQT5
atcpludXMxCroS/f0LpWQi4J6tEPiFfCGtCV6yb3qui3KoCwTpUjTz4Fuj6fe/mJ
L0rAD6hj9nVudjf2beMHHDD0ogiBzPcKj1mchEl/3g82PSuYUZeTUYdYHAFbTxum
aQwSdQ7QnuqyIvkcPxhbhLmwPaxThKW0wCLsBP+zo7oNOD+giujonaaqppHYyDtW
OE0R+2BxVsAFyz5HXlMIaEltU7AvFuWhrgQr1D9gH3pfLMDhPcI5J7MOltVcuzVq
r+sQ7nm3Wjib81+9OHkxwhLSSUmi2AKwLNsrLtBrILP03oY9dPWCyqKpdoZjmwg2
zS6DYqbtePbKk32TrQbMJGkJeLxsOaeC9XIndCgJEayISz5dTMbhDJ0eBh6Ua+eZ
aIngvhLZej5XhRZEthhF7zSdgl0VCbfcmoehJKs7YZCXnolDg8/uoOmyUGzghmrs
QBB7UfISozGE29AWPoYCaBfPjUmUUvHLysuxvAXBR4sOuZC5v4kxn5wWhxIMU0zD
FPBRc0g+HbiruN2RsbR5
=3WV3
-----END PGP SIGNATURE-----

--58l+liMhP3+87v+P--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
