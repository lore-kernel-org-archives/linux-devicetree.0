From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/7] regulator: MT6397: Add support for MT6397 regulator
Date: Mon, 17 Nov 2014 23:40:12 +0000
Message-ID: <20141117234012.GE22111@sirena.org.uk>
References: <1416210027-5562-1-git-send-email-flora.fu@mediatek.com>
 <1416210027-5562-4-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="imjhCm/Pyz7Rq5F2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416210027-5562-4-git-send-email-flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Dongdong Cheng <dongdong.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2014 at 03:40:23PM +0800, Flora Fu wrote:

This looks mostly good but there are a few fairly straightfoward things:

> @@ -725,5 +725,11 @@ config REGULATOR_WM8994
>  	  This driver provides support for the voltage regulators on the
>  	  WM8994 CODEC.
> =20
> +config REGULATOR_MT6397
> +	tristate "MediaTek MT6397 PMIC"
> +	depends on MFD_MT6397
> +	help
> +	   This driver provides support for the voltage regulators on the Media=
Tek MT6397 PMIC.
> +
>  endif

Keep this and the Makefile sorted.

> +static int mt6397_buck_set_voltage_sel(struct regulator_dev *rdev, unsig=
ned sel)
> +{


> +	vosel =3D info->buck_conf.vosel_reg;
> +	voselon =3D info->buck_conf.voselon_reg;
> +	vosel_mask =3D info->buck_conf.vosel_mask;

Please use the standard way of specifying data even if you can't use the
standard function.

> +
> +	ret =3D regmap_update_bits(rdev->regmap, vosel, vosel_mask, sel);
> +	if (ret !=3D 0) {
> +		dev_err(&rdev->dev, "Failed to update vosel: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D regmap_update_bits(rdev->regmap, voselon, vosel_mask, sel);
> +	if (ret !=3D 0) {
> +		dev_err(&rdev->dev, "Failed to update vosel_on: %d\n", ret);
> +		return ret;
> +	}
> +	return 0;

You should add comments here explaining what's going on - it's very
strange to have to write the same value to two different registers and
the names of the registers look suspicously like this is something to do
with a suspend mode...

Missing blank line before the return too.

> +static int mt6397_buck_get_voltage_sel(struct regulator_dev *rdev)
> +{

You could use the regmap based helper for this.

> +static int mt6397_ldo_set_voltage_sel(struct regulator_dev *rdev, unsign=
ed sel)
> +{

The LDO operations appear to be identical to the standard regmap
helpers, please use them.

> +	if (is_fixed)
> +		return 0;

You should use the standard fixed voltage regulator support rather than=20

> +static int mt6397_regulator_is_enabled(struct regulator_dev *rdev)
> +{

Again this looks like it should be using helpers.

> +#define MT6397_REGULATOR_OF_MATCH(_name, _id)			\
> +[MT6397_ID_##_id] =3D {						\
> +	.name =3D #_name,						\
> +	.driver_data =3D &mt6397_regulators[MT6397_ID_##_id],	\
> +}

Define regulators_node and of_match in the regulator desc and you can
remove both this table and all your DT matching code in the driver, the
core will handle it for you.

> +	if ((reg_value & 0xFF) =3D=3D MT6397_REGULATOR_ID91) {
> +		j =3D MT6397_ID_VCAMIO;
> +		mt6397_regulator_matches[j].init_data->constraints.min_uV =3D
> +		1000000;
> +		mt6397_regulators[j].desc.volt_table =3D ldo_volt_table5_v2;
> +	}

Use a switch statement, that way other variants can be added more
easily.

--imjhCm/Pyz7Rq5F2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUaodbAAoJECTWi3JdVIfQRbsIAIS19O6HdHxuY4s95wHXapxJ
J5WGr2+DiVqEAQVW4PxUUtOGpbks3TM3nRP35va8Pu7xfZQ1A9m+cPEiHLKYoj6G
qbXKM25cSBfkZ/i/c9FmdUI06X5GPdE6INUswxLvWLGZMZl9Pw9QtbYHbedvhUFa
wF5TP0XJrT0XA0yXfAW5Ce3ccwNsPTFw1eX8SJKKE+ShVbSzYmvKBVEmdloZWgr4
yGFeb1mUm2o5Yhpbt8a6z+YrWlshSGUHBDiR01HGlFUHYaOpqHQhgaPIxjhzBKzP
Fs7GqMduqCTIDu/lxjZaeucP+sLsQ6KpiYeWBFLwqptxiuPWYf5ISuFF0OGUlXw=
=9Hzy
-----END PGP SIGNATURE-----

--imjhCm/Pyz7Rq5F2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
