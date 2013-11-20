From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/5] mfd: max14577: Add max14577 MFD driver core
Date: Wed, 20 Nov 2013 15:31:03 +0000
Message-ID: <20131120153103.GG2674@sirena.org.uk>
References: <1384956732-19526-1-git-send-email-k.kozlowski@samsung.com>
 <1384956732-19526-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mOr7kNv8EL30+EI+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384956732-19526-2-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--mOr7kNv8EL30+EI+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2013 at 03:12:08PM +0100, Krzysztof Kozlowski wrote:

> +static irqreturn_t max14577_irq_thread(int irq, void *data)
> +{
> +	struct max14577 *max14577 =3D data;
> +	u8 irq_reg[MAX14577_IRQ_REGS_NUM] =3D {0};
> +	u8 tmp_irq_reg[MAX14577_IRQ_REGS_NUM] =3D {};
> +	int i, cur_irq;
> +
> +	max14577_bulk_read(max14577->regmap, MAX14577_REG_INT1,
> +			&tmp_irq_reg[MAX14577_IRQ_INT1],
> +			MAX14577_IRQ_REGS_NUM);

All this interrupt handling looks like a straight copy of the regmap
code?

> +int max14577_irq_resume(struct max14577 *max14577)
> +{
> +	int ret =3D 0;
> +
> +	if (max14577->irq && max14577->irq_domain)
> +		ret =3D max14577_irq_thread(0, max14577);

Are you sure that this is not going to race nastily if the interrupt
goes off during resume?

> +
> +	return ret >=3D 0 ? 0 : ret;

This check isn't a triumph of legibility. =20

> +	if (IS_ERR_OR_NULL(pdata)) {
> +		dev_err(&i2c->dev, "No platform data found: %ld\n",
> +				PTR_ERR(pdata));
> +		return -EINVAL;
> +	}

Why IS_ERR_OR_NULL().

> +#else
> +#define max14577_suspend	NULL
> +#define max14577_resume		NULL
> +#endif /* CONFIG_PM */

You don't need these since you use SIMPLE_DEV_PM_OPS().

> +#else
> +#define max14577_dt_match	NULL
> +#endif

Similarly here.

--mOr7kNv8EL30+EI+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSjNW0AAoJELSic+t+oim9UHcP/juvH6z5rgAZCBSYcZT0Pjb8
dpSowLbq2TELYc5s0KH3JkuGaNfZE5Qlo5B0s/4UxtlLUtTwbm9TmFvh/H90BV7R
kMEOWSmhoHZwKukZtpxuaD9ygyW17ard/+d19e3qNuT2JwdAbXvqvwgEI0w2Jgmz
SC30QYzguzGNwGDixUq6hbarHPb/G7sxSn06zYWDGlRl2CJLdno5Sz4+8hrGMfuO
Vi9CzhdeI2vhRW6f6O9sB9TTkyKEWumWnc2oKoOUUpi5yEVGnXRu5+4xwK6UJ/hC
4VyRPekg81pVap8+TiFmJMlvEAI45NH3DQWMsDvl0g63/JORNq66esJKXuichv1L
YK7h1RvL42tSdw8uTKChF7XEpFUM8nobPblnRiR8Ke3HsPSfRVBdBJfwCDtQZQvv
+9CMinYecsOOlgq3K5C90Xfn30C5HXfVKpHi8EhHjjI/tD5o78asd5+pYmx1Cfa5
HYLBC0Z1eTzlKosXCX7D7DMvG5mY2DUTB6bHUAjOEnf4lF6MSsctV4iFeN/plAFz
kVUr0+q1CsY/QjThHazRMkbBsPPoQMhGFize2UO6mdgyvscNVur4jfoKxh5Ng3Em
InL+RxoSyEjBk++ntB3pWQDnTDQ0Pp15/jNu3pjuxqH4QzKdcre80n+yjYXV+pZN
/MiqXqSmN2fLoSnRLlH6
=E4WA
-----END PGP SIGNATURE-----

--mOr7kNv8EL30+EI+--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
