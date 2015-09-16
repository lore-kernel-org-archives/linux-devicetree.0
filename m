From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: tps65023: add device tree support
Date: Wed, 16 Sep 2015 20:56:12 +0100
Message-ID: <20150916195612.GT12027@sirena.org.uk>
References: <1442324035-16414-1-git-send-email-thomas.elste@imms.de>
 <1442324035-16414-2-git-send-email-thomas.elste@imms.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/IQVaKKkotH/ITY5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1442324035-16414-2-git-send-email-thomas.elste-cSCHQGRfioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Elste <thomas.elste-cSCHQGRfioA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--/IQVaKKkotH/ITY5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 15, 2015 at 03:33:55PM +0200, Thomas Elste wrote:

> +static struct regulator_init_data*
> +	of_get_tps65023_platform_data(struct device *dev)
> +{
> +	struct regulator_init_data *reg_data;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *regulators;
> +	struct of_regulator_match *matches;
> +	int idx, count, ret;
> +
> +	regulators = of_get_child_by_name(np, "regulators");
> +	if (!regulators) {
> +		dev_err(dev, "Regulator node not found\n");
> +		return NULL;
> +	}

There's now core support for this so no need to open code in the driver
- set of_match and regulators_node in the regulator_desc instead.

--/IQVaKKkotH/ITY5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV+clcAAoJECTWi3JdVIfQG74H/318H5uaTRRL/JWgPPMMf4Tu
6ODviKHVg5SvS8K9Lj/rXG7HjLNOF7xtStdhZ5xQvjFOVyF9Z74XrYJBxRLRkkDU
KPcnNYDlZ/ZvOiLl3gddPGk8iK4iHUIh54ERp+XoOnQf/Dr/Lzb+6hFT8iqCeC4v
I7mq5xCWfYj7c3SUX+VdLXOnHLIsmaWZEIJzFSu/i3/ZouYXaHvu21IsotcwjDQP
XUO0/efMlQcrJUBQeHYpCTfiQ0ae/C9h5lwUmi+I1pyulrByfRIM2lHhVTAMP+gm
j1nen2zgKCRz9d4AGcCM7XRqQ6GLB7isb6qUtX3q5WYGD1KNIE+xne20sAqoQEs=
=3trV
-----END PGP SIGNATURE-----

--/IQVaKKkotH/ITY5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
