From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/8] regulator: MT6397: Add support for MT6397
 regulator
Date: Fri, 28 Nov 2014 15:22:47 +0000
Message-ID: <20141128152247.GR7712@sirena.org.uk>
References: <1417146874-5232-1-git-send-email-flora.fu@mediatek.com>
 <1417146874-5232-4-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9GzRb0CqzA06KMG9"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1417146874-5232-4-git-send-email-flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yi>
List-Id: devicetree@vger.kernel.org


--9GzRb0CqzA06KMG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2014 at 11:54:29AM +0800, Flora Fu wrote:

> @@ -96,5 +97,4 @@ obj-$(CONFIG_REGULATOR_WM8350) +=3D wm8350-regulator.o
>  obj-$(CONFIG_REGULATOR_WM8400) +=3D wm8400-regulator.o
>  obj-$(CONFIG_REGULATOR_WM8994) +=3D wm8994-regulator.o
> =20
> -
>  ccflags-$(CONFIG_REGULATOR_DEBUG) +=3D -DDEBUG

Random whitespace change here...

> +	/* For HW design, buck voltage control register has two parts.
> +	 * part 1: vsel_reg for register mode
> +	 * part 2: voselon_reg or hw control mode
> +	 * Both parts should be updated and sync when user set voltage.
> +	 */

Why does nothing else in the driver know about this "hw control mode" -
what does it actually mean, shouldn't it affect some of the other
operations?

> +	ret =3D regmap_update_bits(rdev->regmap, info->desc.vsel_reg,
> +		info->desc.vsel_mask, sel);
> +	if (ret !=3D 0) {
> +		dev_err(&rdev->dev, "Failed to update vsel: %d\n", ret);
> +		return ret;
> +	}
> +	ret =3D regmap_update_bits(rdev->regmap, info->voselon_reg,

Missing blank line between these blocks.

> +static int mt6397_buck_get_voltage_sel(struct regulator_dev *rdev)
> +{

> +static int mt6397_regulator_is_enabled(struct regulator_dev *rdev)
> +{

To repeat my comments on the last version: please use the generic regmap
operations rather than copying them.

> +	np =3D of_node_get(pdev->dev.parent->of_node);
> +	if (!np)
> +		return -EINVAL;
> +
> +	regulators =3D of_get_child_by_name(np, "regulators");

To further repeat my previous review comments:

| Define regulators_node and of_match in the regulator desc and you can
| remove both this table and all your DT matching code in the driver, the
| core will handle it for you.

Please don't ignore review comments.

--9GzRb0CqzA06KMG9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUeJNGAAoJECTWi3JdVIfQuWoH/jYZ78/0hq8D2jvV/qB6YYc2
SR2UIn5Hy4g1+O/gkyC108xKxfQz0EW5C595VOGWni6GP4qGvBJNsEXIc/bg32Z2
CVbUeEccj34Xu5U38HR6HR2xUuIJFmKOeHjGWe2hImfC/QfitWphbnHtcIVVzkFX
LUj1L9V/9q9lGKGzinWjiN2WB/7SMW1IJPJfbeoIdNRMV6lvnFZKCd/V/sUw/De3
HOqZ0PsdM7COkpm873alMPG3q2aM4usq17SZKso8Xr3Hh9xcgEQTEalRHINnLes/
Txvyc2rAZJNAYmnndsjhtznMREtD9Ej0+NSOvAj/RQzv0q6kMH4q3PUlT/wZK/w=
=MlFV
-----END PGP SIGNATURE-----

--9GzRb0CqzA06KMG9--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
