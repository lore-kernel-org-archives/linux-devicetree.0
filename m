From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 6/7] regulator: axp20x: make use of devm_regulator_set_register
Date: Tue, 17 Jun 2014 22:46:57 +0200
Message-ID: <20140617204657.GE19730@lukather>
References: <1402990723-28138-1-git-send-email-boris.brezillon@free-electrons.com>
 <1402990723-28138-7-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C94crkcyjafcjHxo"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB66TQKOQKGQEYYJSCUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402990723-28138-7-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--C94crkcyjafcjHxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2014 at 09:38:42AM +0200, Boris BREZILLON wrote:
> Make use of the devm_regulator_set_register instead of registering each
> regulator provided by the PMIC.
>=20
> This also solves a self dependency issue where one regulator of the PMIC
> is used as a supply for anoher regulator provided by the same PMIC.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/regulator/axp20x-regulator.c | 59 ++++++++++++++----------------=
------
>  1 file changed, 23 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp=
20x-regulator.c
> index d42bf6d..e8f0df7 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c
> @@ -301,66 +301,53 @@ static int axp20x_set_dcdc_workmode(struct regulato=
r_dev *rdev, int id, u32 work
> =20
>  static int axp20x_regulator_probe(struct platform_device *pdev)
>  {
> -	struct regulator_dev *rdev;
> +	struct regulator_set *rset;
>  	struct axp20x_dev *axp20x =3D dev_get_drvdata(pdev->dev.parent);
> -	struct regulator_config config =3D { };
> -	struct regulator_init_data *init_data;
> +	struct regulator_set_config config;
>  	struct of_regulator_match *matches;
> -	int nmatches;
> -	const struct regulator_desc *regulators;
> -	int nregulators;
>  	int ret, i;
>  	u32 workmode;
> =20
> +	memset(&config, 0, sizeof(config));
> +	config.dev =3D &pdev->dev;
> +	config.regmap =3D axp20x->regmap;
>  	if (axp20x->variant =3D=3D AXP221_ID) {
>  		matches =3D axp22x_matches;
> -		nmatches =3D ARRAY_SIZE(axp22x_matches);
> -		regulators =3D axp22x_regulators;
> -		nregulators =3D AXP22X_REG_ID_MAX;
> +		config.descs =3D axp22x_regulators;
> +		config.nregulators =3D AXP22X_REG_ID_MAX;
>  	} else {
>  		matches =3D axp20x_matches;
> -		nmatches =3D ARRAY_SIZE(axp20x_matches);
> -		regulators =3D axp20x_regulators;
> -		nregulators =3D AXP20X_REG_ID_MAX;
> +		config.descs =3D axp20x_regulators;
> +		config.nregulators =3D AXP20X_REG_ID_MAX;
>  	}
> +	config.matches =3D matches;
> =20
>  	/*
>  	 * Reset matches table (this table might have been modified by a
>  	 * previous AXP2xx device probe).
>  	 */
> -	for (i =3D 0; i < nmatches; i++) {
> +	for (i =3D 0; i < config.nregulators; i++) {
>  		matches[i].init_data =3D NULL;
>  		matches[i].of_node =3D NULL;
>  	}
> =20
> -	ret =3D axp20x_regulator_parse_dt(pdev, matches, nmatches);
> +	ret =3D axp20x_regulator_parse_dt(pdev, matches,
> +					config.nregulators);
>  	if (ret)
>  		return ret;
> =20
> -	for (i =3D 0; i < AXP20X_REG_ID_MAX; i++) {
> -		init_data =3D matches[i].init_data;
> +	rset =3D devm_regulator_set_register(&pdev->dev, &config);
> +	if (IS_ERR(rset))
> +		return PTR_ERR(rset);
> =20
> -		config.dev =3D &pdev->dev;
> -		config.init_data =3D init_data;
> -		config.regmap =3D axp20x->regmap;
> -		config.of_node =3D matches[i].of_node;
> -
> -		rdev =3D devm_regulator_register(&pdev->dev, &regulators[i],
> -					       &config);
> -		if (IS_ERR(rdev)) {
> -			dev_err(&pdev->dev, "Failed to register %s\n",
> -				regulators[i].name);
> -
> -			return PTR_ERR(rdev);
> -		}
> -
> -		ret =3D of_property_read_u32(matches[i].of_node, "x-powers,dcdc-workmo=
de",
> +	for (i =3D 0; i < rset->nregulators; i++) {
> +		ret =3D of_property_read_u32(config.matches[i].of_node,
> +					   "x-powers,dcdc-workmode",
>  					   &workmode);
> -		if (!ret) {
> -			if (axp20x_set_dcdc_workmode(rdev, i, workmode))
> -				dev_err(&pdev->dev, "Failed to set workmode on %s\n",
> -					regulators[i].name);
> -		}
> +		if (!ret &&
> +		    axp20x_set_dcdc_workmode(rset->regulators[i], i, workmode))
> +			dev_err(&pdev->dev, "Failed to set workmode on %s\n",
> +				config.descs[i].name);
>  	}
> =20
>  	return 0;
> --=20
> 1.8.3.2
>=20

It looks like you're modifying code you just introduced. You should
probably move this patch earlier on, so that you don't have to patch
your patch.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--C94crkcyjafcjHxo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJToKlBAAoJEBx+YmzsjxAgSYEQALLMmqnxfDnM3AqFDAMLCECW
XZXu2UQS/d6DAIq2lb58wwtrATXSm1nZ3hQJBkhbSfWpgUqYkd6UsZ0RSKRtZv1H
8rVUf69ZNJTWpfHXD2UQ5NF/AkYrgnOzHf8Bj4+6xq3x7JtkH1aiwaMwuHC6omba
ZVOOwHBs0GDbdYv8Un9Ks1C9e31WxXOaQaditGF/jNicVepYhjFXUDjlu5sy+bjr
VyTFdudAZLMdDoeaR7xrJCCXpVTxqVUw75J2lpQnJVlcBjwWxOM8t1biSsm94TA1
yjbqqNpyNbnFXQzRpVVdN1kbqsxHcSvaaX3sXC7K3/DemJAhTqAxx6pbFrC2X6ZY
qjZW09znTSOcJ6ts5qw9abVBEdRZ3yuKa2CbJPRtFE1kYPBksLrDmrOVNEGNS0o/
076R3wdG3oggvMR/kn6/oLWLpdOyH0SMdWuSHOt4wiPLyz5t+OhAp2ZaeX4yQrrV
k/1EqIkQiU+gwSaeBNSy8PdQLWjpL1PHYhQNs/JvSaMwcSxpuDrxUEXPow6r++0P
Actyj0mOefmJO+THcHQUABvOKYJMV0WTP94puSqyZlit6K1Kx3yWbCAVHsQ56iUX
HtseMU4qeRAJ1bYK4imncy0u224YedtSGY4l0EvFq+42w2b34bwjdfo6T0m1HQoS
16Egk9NEZptbClVOBgZ7
=4Utz
-----END PGP SIGNATURE-----

--C94crkcyjafcjHxo--
