From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: act8945a: add regulator driver for
 ACT8945A
Date: Fri, 15 Jan 2016 17:57:57 +0000
Message-ID: <20160115175757.GA6588@sirena.org.uk>
References: <1452218938-10621-1-git-send-email-wenyou.yang@atmel.com>
 <1452218938-10621-2-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D3uGefx/nfj0hkMF"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452218938-10621-2-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--D3uGefx/nfj0hkMF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 08, 2016 at 10:08:57AM +0800, Wenyou Yang wrote:

> +	np = of_get_child_by_name(pdev->dev.of_node, "regulators");
> +	if (!np) {
> +		dev_err(&pdev->dev, "regulator node not found\n");
> +		return -EINVAL;
> +	}
> +
> +	matches = act8945a_matches;
> +	num_matches = ARRAY_SIZE(act8945a_matches);
> +
> +	ret = of_regulator_match(&pdev->dev, np, matches, num_matches);

Don't open code this, use the core regulators_node and of_match
implementation instead.

> +		dev_info(act8945a_dev->dev, "%s regulator registered\n",
> +			desc->name);

This is just noise, please remove it - let the core handle notifying
users.

> +static int __init act8945a_pmic_init(void)
> +{
> +	return platform_driver_register(&act8945a_pmic_driver);
> +}
> +subsys_initcall(act8945a_pmic_init);

Please use module_platform_driver() unless there is a strong reason to
do otherwise.

--D3uGefx/nfj0hkMF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWmTMkAAoJECTWi3JdVIfQp2MH/i6gR0E1a9xNQf4pFHMn/r2p
ZtPLJOLBwpinGwmMkxUjCdKQaSTKsvvyy8AEj8tL7AQ2qbLjxagOfkjd5sqxa5ey
BUBRFRcDkDuEpSZvjXV3ualVSftQCPJZzT7jD5WYfWMHGgbbvs5uOhCO6H05Uacx
5KgmA1wIFW48167wvYbGlvDmlKHzKl3U3vAscFnOEwXLS+Th1bPAF9WG1Hf4WOTc
OU0NPKCS2objbdKK8ovtzHhipkKjyeHKZOFNKwkTR8IWorR+iTPX6wXjlM/kp6v1
nFCj1Xx6wQVF51PYFqMZ4IyI/x14wA3JJEqbJT4038Y7flOuZxQx9PQJcnnmoTw=
=6cFa
-----END PGP SIGNATURE-----

--D3uGefx/nfj0hkMF--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
