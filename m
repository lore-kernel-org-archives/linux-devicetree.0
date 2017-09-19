From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: core: Add coupled regulators mechanism
Date: Tue, 19 Sep 2017 14:09:44 +0100
Message-ID: <20170919130944.ldoskrm54tx2oemd@sirena.co.uk>
References: <1505723992-11772-1-git-send-email-m.purski@samsung.com>
 <CGME20170918084022eucas1p1398f18c5c90535ce484e3952fae80882@eucas1p1.samsung.com>
 <1505723992-11772-2-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vhzcojvceyk3bhky"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1505723992-11772-2-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--vhzcojvceyk3bhky
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2017 at 10:39:51AM +0200, Maciej Purski wrote:
> On Odroid XU3/4 and other Exynos5422 based boards there is a case, that
> different devices on the board are supplied by different regulators
> with non-fixed voltages. If one of these devices temporarily requires
> higher voltage, there might occur a situation that the spread between
> two devices' voltages is so high, that there is a risk of changing
> 'high' and 'low' states on the interconnection between devices powered
> by those two regulators.
>=20
> Keeping spread between those voltages below defined max_spread should
> be handled by the framework. Information required to do so is obtained
> from the device tree. On each voltage change the core should find the
> best voltages which suit all consumers' demands and max_spread.
> Then set them for a coupled regulator also.

This leads me none the wiser as to how this will be implemented which
makes this rather hard to review, especially since this appears to have
a lot of random refactoring mixed in with it.

> +static int regulator_set_voltage_safe(struct regulator_dev *rdev,
> +				      int min_uV, int max_uV);

Why would we want a way to set voltages that isn't safe?

> @@ -2181,6 +2183,8 @@ static int _regulator_enable(struct regulator_dev *=
rdev)
>  		/* Fallthrough on positive return values - already enabled */
>  	}
> =20
> +	if (rdev->coupled_desc)
> +		rdev->coupled_desc->enable_count++;
>  	rdev->use_count++;
> =20
>  	return 0;

There's no locking here, and we appear to take no action when these
counts change - do we need to bother with this at all?

> +	/* check if changing voltage won't interfere with other
> +	 * consumers' demands
> +	 */
>  	ret =3D regulator_check_consumers(rdev, &min_uV, &max_uV);
>  	if (ret < 0)
>  		goto out2;

These extra comments that are being added are pretty much all readouts
of the name of the function that's being called (and many of them are
misformatted)...

> +static int regulator_set_voltage_safe(struct regulator_dev *rdev, int mi=
n_uV,
> +					   int max_uV)
> +{

=2E..which is a bit ironic given that this isn't documented at all :/

> +static int regulator_set_coupled_voltage(struct coupled_reg_desc *c_desc)
> +{
> +	struct regulator_dev **c_rdevs =3D c_desc->coupled_rdevs;
> +	int max_spread =3D c_desc->max_spread;
> +	int best_volt[2] =3D { };
> +	int actual_volt[2];
> +	int min_volt, max_volt;
> +	int ret =3D 0, i, max;
> +	int ready =3D 0;
> +
> +	/* Get voltages desired by all consumers of the coupled regulator */
> +	for (i =3D 0; i < 2; i++) {

It appears we can't couple more than two regulators?

> +	max_volt =3D max(best_volt[0], best_volt[1]);
> +	min_volt =3D min(best_volt[0], best_volt[1]);

So the maximum and minimum are the *least* constrained?

> +			max_possible =3D actual_volt[(i + 1) % 2] + max_spread;
> +			min_possible =3D actual_volt[(i + 1) % 2] - max_spread;

I'm lost, this magic array indexing is just illegible.

--vhzcojvceyk3bhky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnBFxcACgkQJNaLcl1U
h9AJoAf8Cn+ke2nDgwDF5/YIAcGDO2ii7I3IK8zuvYYH/X8dE6RRMfE8THEiyKSq
ACJ1BTh5L3+auNKGdllPdX2+vYJAZHYNqGaB3YXnU6iTEsSDAX+G/55dTwXmRbEn
v26nWK6H5SClZPRCnlVd7fkmvJNMH9CVWL6lM+wl18c3wbF0k85sBR9TJwd/oCcN
96j6GwlLrv6HsupBTDSvlWclqmq/u+v8cT1DiUWp8svHWwY5TGhO+KjAcaiAVELU
0A32NQU0Zz3B61evCsabnfIqB3V6PWf/qNakxnbWvohWOUWURbm9jQSioAd6ZAbF
GQNILihVw/gafqk15noifre6TsLSzA==
=SncR
-----END PGP SIGNATURE-----

--vhzcojvceyk3bhky--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
