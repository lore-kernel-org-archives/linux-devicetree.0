From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/5] regulators: tps65912: Add regulator driver for
 the TPS65912 PMIC
Date: Fri, 25 Sep 2015 11:05:33 -0700
Message-ID: <20150925180533.GN30445@sirena.org.uk>
References: <1443106374-4126-1-git-send-email-afd@ti.com>
 <1443106374-4126-5-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iym2iLi12j4kk03o"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443106374-4126-5-git-send-email-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--iym2iLi12j4kk03o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 24, 2015 at 09:52:53AM -0500, Andrew F. Davis wrote:

> +static int tps65912_regulator_probe(struct platform_device *pdev)
> +{
> +	struct tps65912 *tps = dev_get_drvdata(pdev->dev.parent);
> +	struct regulator_init_data *init_data;
> +	const struct tps_info *template;
> +	struct regulator_dev *rdev;
> +	const struct of_device_id *match;
> +	struct regulator_config config = { };
> +	int id;
> +
> +	match = of_match_device(tps65912_regulator_of_match_table, &pdev->dev);
> +	if (!match)
> +		return -ENODEV;
> +
> +	template = match->data;
> +	id = template->id;
> +	init_data = of_get_regulator_init_data(&pdev->dev, pdev->dev.of_node,
> +					       &regulators[id]);

Don't open code this stuff, use the core DT matching in the
regulator_desc instead.

Please also use subject lines mathcing the style for the subsystem.

--iym2iLi12j4kk03o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWBYzsAAoJECTWi3JdVIfQIjUH/igUNLPhNPkPVL5uY/fWMsxh
i1H+ayv2p/GzZPaPHvAenZc8jzqXjFaTkzNmhhggoSHypfubvxi9833NH93j9t2e
zNHD9deFHCdLtB6truqIpYODQGAMcnerno4Ba/0unDOROTWPxPAkazY8YmO6STHz
r6TNFWNYJl0JityJ/DXj/FC3TRZJ/VbgvNxv6qdxXo9cwhCBOXCMiAoxUMOVIKXg
mM4I29R9QQ46R2lBrG7WKYNHGW0ayuQ5tTZuTK7oPwd0A5eYoFsuqVaiuRS7PL1u
wD+yFA6v29A5EjeoomRpySVTXPaaLhoNgvJW4DdP9T9uXfpuXO6KqFc6pLH5Mhk=
=ZFLK
-----END PGP SIGNATURE-----

--iym2iLi12j4kk03o--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
