From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] regulator: max14577: Add regulator driver for Maxim
 14577
Date: Wed, 13 Nov 2013 13:23:38 +0000
Message-ID: <20131113132338.GG878@sirena.org.uk>
References: <1384328457-5147-1-git-send-email-k.kozlowski@samsung.com>
 <1384328457-5147-5-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XaUbO9McV5wPQijU"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384328457-5147-5-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--XaUbO9McV5wPQijU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2013 at 08:40:57AM +0100, Krzysztof Kozlowski wrote:

> +static inline int max14577_reg_set_safeout(struct regmap *rmap, int on)
> +{
> +	u8 reg_data = (on ? 0x1 << CTRL2_SFOUTORD_SHIFT : 0x0);

The ternery operator is rarely helpful for legibility.

> +	case MAX14577_SAFEOUT:
> +		max14577_read_reg(rmap, MAX14577_REG_CONTROL2, &reg_data);
> +		return (reg_data & CTRL2_SFOUTORD_MASK) != 0;

regulator_is_enabled_regmap() and the other helpers should be used for
this regulator.

> +static int max14577_reg_disable(struct regulator_dev *rdev)
> +{
> +	int rid = rdev_get_id(rdev);
> +
> +	switch (rid) {
> +	case MAX14577_CHARGER:
> +		return max14577_reg_set_charging(rdev->regmap, 0);
> +	case MAX14577_SAFEOUT:
> +		return max14577_reg_set_safeout(rdev->regmap, 0);
> +	default:
> +		return -EINVAL;
> +	}
> +}

This sort of indirection isn't adding anything, just make the ops
directly callable (and in the case of SAFEOUT use the helpers).

> +static int max14577_reg_get_current_limit(struct regulator_dev *rdev)
> +{
> +	if (rdev_get_id(rdev) != MAX14577_CHARGER)
> +		return -EINVAL;
> +
> +	return max14577_reg_calc_charge_current(rdev->regmap);

Just inline the function, it's only called once.

> +	if (rdev_get_id(rdev) != MAX14577_CHARGER)
> +		return -EINVAL;
> +
> +	dev_info(max14577->dev, "Requested current <%d, %d>\n", min_uA, max_uA);

Don't spam the logs like this, there's problems like this throughout the
rest of the code.

> +static int max14577_regulator_dt_parse_pdata(struct platform_device *pdev,
> +					struct max14577_platform_data *pdata)

No DT binding document.

> +static int max14577_regulator_probe(struct platform_device *pdev)
> +{
> +	struct max14577_regulator *max14577_reg;
> +	struct max14577 *max14577 = dev_get_drvdata(pdev->dev.parent);
> +	struct max14577_platform_data *pdata = dev_get_platdata(max14577->dev);
> +	int i, ret, size;
> +	struct regulator_config config = {};
> +
> +	if (!pdata) {
> +		dev_err(&pdev->dev, "No platform data found.\n");
> +		return -ENODEV;
> +	}
> +
> +	if (max14577->dev->of_node) {
> +		ret = max14577_regulator_dt_parse_pdata(pdev, pdata);
> +		if (ret)
> +			return ret;
> +	}

The driver insists on platform data but then requires DT...

> +	size = sizeof(struct regulator_dev *) * pdata->num_regulators;
> +	max14577_reg->regulators = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);

You shouldn't be getting the number of regulators from platform data,
the number of regulators physically present in the silicon isn't going
to vary.

> +		max14577_reg->regulators[i] =
> +			regulator_register(&supported_regulators[id], &config);

devm_regulator_register().

> +subsys_initcall(max14577_regulator_init);

Why is this subsys_initcall()?

--XaUbO9McV5wPQijU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSg31XAAoJELSic+t+oim9mQMP/iaIE+XFVm4IMPX20hKTygkW
IEbdwZjeXO04mc1jBV5CtQ9YSCO8sV0DtwumVlBAfGZOcZXThZ21VmO2Xcd+95+e
W9db39JS4cY5hPfrU7IFg+WOMhLt5VHGWj2F8YgU72oQ3xsYzaFLr/IHGngVhyen
eFibDIHG/2WSKDpeUvcWARgSDkuKBqg5ZpHSU07cxPQV9IY/iFRCSuXfnZ0L/GRb
HkIHqY0z5sfNXigCCFhxPao88IgVshvy5qrOYyglmoioaELQOA8Vr38yC2ynLz+X
wbzKU3hXQjW7FRa4cZF+mkBSPwSpS5D8eXDoe3UPU9+uTATGtHd6jE+ST5MbCmcS
kB7SmQC6oiFR4Njm9w4dUl47cVSZVgJeziakRwqqC8b5ll7b+BJiXq24SJ16+6oG
9jqmhlNnWfntBTZbO/usJUOrXOGV63+AepdfHnE36R5xCfrzBM/IwIUFOu9RSSfd
wT/FfyBGL+VBbPdSydWOD+e8x9IOIgiO8jmeKeUWQGQBhJ1KFHO+aP6rPaEZ5Oyw
4LkLKqF3cRrxniOh2nHCI0FFSbAFFCJmmPQxCl1AlzXdLmiBcNudHNUjv9ewu+z1
PGBLsCZhYlSM921aIQ2vpb7JZaIu+ZcfhhZ6YzaqCjqwJ9WgCzfaPxZfMpQjm/pj
3RVhXm3ZTzlFYVcIxCvQ
=p7gt
-----END PGP SIGNATURE-----

--XaUbO9McV5wPQijU--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
