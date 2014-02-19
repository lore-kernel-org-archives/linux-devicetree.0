From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/5] regulator: add bcm590xx regulator driver
Date: Wed, 19 Feb 2014 13:52:32 +0900
Message-ID: <20140219045232.GD2669@sirena.org.uk>
References: <1392765432-9111-1-git-send-email-mporter@linaro.org>
 <1392765432-9111-4-git-send-email-mporter@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DiN016b2AKplKC+S"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392765432-9111-4-git-send-email-mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--DiN016b2AKplKC+S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 18, 2014 at 06:17:10PM -0500, Matt Porter wrote:

> +static struct of_device_id bcm590xx_of_match[] = {
> +	{ .compatible = "brcm,bcm59056-regs", },
> +	{ }
> +};

This looks pretty much OK however I am in general suspicious of MFDs
that have subdevices like this in the DT - it doesn't seem like this is
a reusable device which can appear anywhere else so you're pretty much
just representing the way that Linux splits things up here rather than a
reusable IP that can reasonably have a separate binding.

If you had a binding which did something like enumerate the individual
IP blocks as individual devices that'd be more interesting, I could see
for example that a different PMIC might have a different set of register
compatible regulator IPs laid out.  It looks like that might be doable,
but it's in no way essential.

--DiN016b2AKplKC+S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTBDiNAAoJELSic+t+oim9V6cQAJXssEgqanUNT7Ae2wPNcBfJ
VioNgTtjR0ydeeu2ve4SxN4IdR0HzhyVrUHXB6lYHEkmbgu8bYTCT3xJIUmKsnKH
tel1aoWFyy3S5Zdm8ffZId5emwaafCLUnICRxrIdPP1/tBZfzZq7Tl3h2h+gYUxo
H0xdZnbs2s50r4rS9G2aSp5x2ybSePb+Nen7hFmMe2M2Y+CkzOu97zx0MHjK7vCx
AnxdXhRPIgP4ANnREfvnL4kKVZfIq2smIoNDhjY66HHkKL4Zuj89zoWoNovgBy2C
xdhXm46n0wm6MZxfdGWjVL2wr4NgU10KXFhtld1UQa/VO3LQGyk+MziOEfXfLm88
EPBEbgTdl/MQ1tVByLfefExf7/i136s72O0rDI/cr754xbSkhWyY/YOGpd9O6m79
gvxGzabqu6Kw9UwgpGXaB+z8rZBkVXcFuQ6HH7MUZZZOpfokVppugrQO+7fZzuag
j/2yvwyCAcWvfa3VS0noUToeB8JYt3aVvBaZ7ctkEJhjoz4ZBTIoTcaX0DXoCoya
6UVAjO1uYyWcDCqqV6i4T972k+XFdSdAP32OqjuzwVzigOZZcS5LUsVD9dWzRevK
lf8dX9bpqpogrJy2DoSrDyNGWjZI1AQBd4XNXgF5fCYqzFAg66kzd3hb4Y5vb2G/
TyAL+HrK5sII2hXEozpR
=0uB6
-----END PGP SIGNATURE-----

--DiN016b2AKplKC+S--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
