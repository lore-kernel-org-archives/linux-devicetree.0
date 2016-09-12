From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Mon, 12 Sep 2016 19:56:33 +0100
Message-ID: <20160912185633.GH27946@sirena.org.uk>
References: <20160906190524.GB79728@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x7gJcYyRf5ZnuMVj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160906190524.GB79728-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--x7gJcYyRf5ZnuMVj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2016 at 12:05:24PM -0700, Matthias Kaehlcke wrote:

> On some boards it's possible that transitioning the PWM regulator
> downwards too fast will trigger the over voltage protection (OVP) on the
> regulator.  This is because until the voltage actually falls there is a
> time when the requested voltage is much lower than the actual voltage.

So your PWM regulators are not very good and overshooting?  Do you have
any numbers on this - what values do you end up setting for both the
delay and safe fall percentages?

> We'll fix this OVP problem by allowing users to specify the maximum
> voltage that we can safely fall.  Apparently this maximum safe voltage
> should be specified as a percentage of the current voltage.  The
> regulator will then break things into separate steps with a delay in
> between.

I'd like to see some more thorough analysis than just an "apparently"
here.  It's making the code more fiddly for something very handwavy.

> @@ -2753,8 +2753,6 @@ static int _regulator_do_set_voltage(struct regulat=
or_dev *rdev,
>  	int old_selector =3D -1;
>  	int old_uV =3D _regulator_get_voltage(rdev);
> =20
> -	trace_regulator_set_voltage(rdev_get_name(rdev), min_uV, max_uV);
> -
>  	min_uV +=3D rdev->constraints->uV_offset;
>  	max_uV +=3D rdev->constraints->uV_offset;
> =20
> @@ -2842,11 +2840,53 @@ no_delay:
>  				     (void *)data);
>  	}
> =20
> -	trace_regulator_set_voltage_complete(rdev_get_name(rdev), best_val);
> -
>  	return ret;

Let's remove some trace points too because...?  These *are* the actual
voltage changes in the device, we're just splitting things up into a
series of transitions.

> +static int _regulator_set_voltage(struct regulator_dev *rdev,
> +				     int min_uV, int max_uV)
> +{
> +	int safe_fall_percent =3D rdev->constraints->safe_fall_percent;
> +	int slowest_decay_rate =3D rdev->constraints->slowest_decay_rate;
> +	int orig_uV =3D _regulator_get_voltage(rdev);
> +	int uV =3D orig_uV;
> +	int ret;
> +
> +	trace_regulator_set_voltage(rdev_get_name(rdev), min_uV, max_uV);
> +
> +	 /* If we're rising or we're falling but don't need to slow; easy */
> +	if (min_uV >=3D uV || !safe_fall_percent)

Indentation is broken, the two lines above don't agree with each other.

> +	ret =3D of_property_read_u32(np, "regulator-slowest-decay-rate", &pval);
> +	if (!ret)
> +		constraints->slowest_decay_rate =3D pval;
> +	else
> +		constraints->slowest_decay_rate =3D INT_MAX;

The documentation said this is mandatory if we have a safe fall rate
specified but the code says it's optional and we'll silently default to
an absurdly high rate instead (it's odd that a large number in a field
marked slowest is fast BTW).  Complaining loudly seems better than
ignoring the error.

> +	/* We use the value as int and as divider; sanity check */
> +	if (constraints->slowest_decay_rate =3D=3D 0) {
> +		pr_err("%s: regulator-slowest-decay-rate must not be 0\n",
> +			np->name);
> +		constraints->slowest_decay_rate =3D INT_MAX;
> +	} else if (constraints->slowest_decay_rate > INT_MAX) {
> +		pr_err("%s: regulator-slowest-decay-rate (%u) too big\n",
> +			np->name, constraints->slowest_decay_rate);
> +		constraints->slowest_decay_rate =3D INT_MAX;
> +	}

This should be with the parsing of slowest-decay-rate and checked only
if we have a safe-fall-percent, there's no error if the value is omitted.

> +	if (constraints->safe_fall_percent > 100) {
> +		pr_err("%s: regulator-safe-fall-percent (%u) > 100\n",
> +			np->name, constraints->safe_fall_percent);
> +		constraints->safe_fall_percent =3D 0;
> +       }

Again indentation is borked here, I think you have tab/space issues.

> +	if (constraints->safe_fall_percent &&
> +		!constraints->slowest_decay_rate) {
> +		pr_err("%s: regulator-slowest-decay-rate requires "
> +			"regulator-safe-fall-percent\n", np->name);

Don't align the second line of the condition with the body of the if,
that just makes things hard to read - do what the rest of the code does
and align with the (.

Don't split text messages over multiple lines, it makes it impossible to
grep for the error as printed.

--x7gJcYyRf5ZnuMVj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX1vpgAAoJECTWi3JdVIfQjGMH/2R5bjiH10vU1+/EWcnp0mSA
0pm7el+VCoeLVK5f7Ds3zkg/MgayN/97k7/WA5Xe/37mHQAmAbasKip7dDSOu9eQ
+XkFUfKF2sZ/3LUzdF9hmcEPZ7N3OpKlUXzK+n3faW8PkCjAymnAXUtQmk68bo8o
eSq+VPD3IgZNGB/ipfFx1ZExrXbVvFNa5GVS2j8gyLibXfyrmUI2aW/M63ZL9wyP
E9TTT4ehVT7vl7hy+B7Qa01dpDcrTkmeWUisOtLIviGbpbskcIl2UjFAgDeSFBW2
iUlS0qJUWfIbZ/2D9ZB04GYdp+MZWqmQzZerihio3nLORXZCOKzjjXY6nSSOS20=
=otxX
-----END PGP SIGNATURE-----

--x7gJcYyRf5ZnuMVj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
