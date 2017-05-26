From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/6] regulator: hi6421v530: add driver for hi6421v530
 voltage regulator
Date: Fri, 26 May 2017 12:38:22 +0100
Message-ID: <20170526113822.xsmk5lsrvzmqyljm@sirena.org.uk>
References: <20170526063518.21246-1-guodong.xu@linaro.org>
 <20170526063518.21246-5-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i5xer5qsq2f3wzuk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170526063518.21246-5-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, lgirdwood@gmail.com, khilman@baylibre.com, arnd@arndb.de, gregory.clement@free-electrons.com, olof@lixom.net, thomas.petazzoni@free-electrons.com, yamada.masahiro@socionext.com, riku.voipio@linaro.org, treding@nvidia.com, krzk@kernel.org, eric@anholt.net, damm+renesas@opensource.se, ard.biesheuvel@linaro.org, linus.walleij@linaro.org, geert+renesas@glider.be, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hw.wangxiaoyin@hisilicon.com
List-Id: devicetree@vger.kernel.org


--i5xer5qsq2f3wzuk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2017 at 02:35:16PM +0800, Guodong Xu wrote:

Overall this driver needs quite a lot of modernization, it's at least a
couple of years out of date in how it's using the framework - there's
barely any use of helpers.  It does look like it should be fairly easy
to get it up to date though, it's mostly going to be a case of deleting
code that's reimplementing helpers rather than anything else.

> +/*
> + * struct hi6421c530_regulator_pdata - Hi6421V530 regulator data
> + * of platform device.
> + * @lock: mutex to serialize regulator enable
> + */
> +struct hi6421v530_regulator_pdata {
> +	struct mutex lock;
> +};

This isn't platform data so it probably shouldn't be called pdata.  I
also can't tell what the lock is protecting, every use seems to be a
call to regmap_update_bits() which is atomic anyway - could we just drop
the whole thing?

> +static int hi6421v530_regulator_enable(struct regulator_dev *rdev)
> +{
> +	struct hi6421v530_regulator_pdata *pdata;
> +	int ret =3D 0;
> +
> +	pdata =3D dev_get_drvdata(rdev->dev.parent);
> +	mutex_lock(&pdata->lock);
> +
> +	ret =3D regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
> +			rdev->desc->enable_mask,
> +			1 << (ffs(rdev->desc->enable_mask) - 1));
> +
> +	mutex_unlock(&pdata->lock);
> +	return ret;
> +}

This looks like it should be able to use the regmap helpers for all the
enable operations rather than open coding. =20

> +static int hi6421v530_regulator_set_voltage(struct regulator_dev *rdev,
> +						unsigned int sel)
> +{
> +	struct hi6421v530_regulator_pdata *pdata;
> +	int ret =3D 0;
> +
> +	pdata =3D dev_get_drvdata(rdev->dev.parent);
> +	mutex_lock(&pdata->lock);
> +
> +	ret =3D regmap_update_bits(rdev->regmap, rdev->desc->vsel_reg,
> +				rdev->desc->vsel_mask,
> +				sel << (ffs(rdev->desc->vsel_mask) - 1));

Same for all the voltage operations :(

> +	rdev->constraints->valid_modes_mask =3D info->mode_mask;
> +	rdev->constraints->valid_ops_mask |=3D
> +			REGULATOR_CHANGE_VOLTAGE | REGULATOR_CHANGE_MODE;

The driver should *never* modify constraints, it's up to the machine
integration to say what can be supported on a given board.

> +	np =3D of_get_child_by_name(dev->parent->of_node, "regulators");
> +	if (!np)
> +		return -ENODEV;
> +
> +	ret =3D of_regulator_match(dev, np,
> +				 hi6421v530_regulator_match,
> +				 ARRAY_SIZE(hi6421v530_regulator_match));

Don't open code this, use of_match and regulators_node.

--i5xer5qsq2f3wzuk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlkoE60ACgkQJNaLcl1U
h9A/ggf9GB7edTsYsikyIVRAo1/YF3eMDJWiBwaD44OWVv3FfFytf2hbSaEKvdEB
MA9+HnQQNGVkVjY2idSgdiQ0cCLtVNQ5CM+puEQpX/URIx2fsA8etlo44ibX/VJq
TAfaY1MYMW1dwZbqUSqAnFvLhDIhEnFl1EDvn/5VBJ75leNnPU18IWt/OxHWt8XF
U+S8XnRQcesOfEKqRbLs+zblJEnDr8rVH8gHoCToO8Xt04XlKA8fMqsZvkiHwMNa
a3lCZPv9ch7Qoz5H8D6sIcmchE14QKB70EGXcHb0EzVjvPlwIsPPGxqgzL2ByCeu
g+hNFDqAQia/h4Bu6YV6IOS6qhT7ng==
=Tm/y
-----END PGP SIGNATURE-----

--i5xer5qsq2f3wzuk--
