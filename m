From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/4] regulator: Add set_voltage_time op
Date: Mon, 12 Sep 2016 19:32:30 +0100
Message-ID: <20160912183230.GF27946@sirena.org.uk>
References: <20160906190315.GC92391@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uTCAFClMX+U9tLbX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160906190315.GC92391-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--uTCAFClMX+U9tLbX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2016 at 12:03:15PM -0700, Matthias Kaehlcke wrote:

Whatever you're using to send these is not threading things as expected
and is adding a random HTML segment to the end of the e-mails - you
probably want to look at this.  If you're trying to use gmail via the
web interface you want to avoid that, it's got a tendency to mangle
things.

> -	/* Call set_voltage_time_sel if successfully obtained old_selector */
> -	if (ret =3D=3D 0 && !rdev->constraints->ramp_disable && old_selector >=
=3D 0
> -		&& old_selector !=3D selector) {
> +	if (ret !=3D 0 || rdev->constraints->ramp_disable)
> +		goto no_delay;

You probably want to do the refactoring for splitting out decisions
about old_selector separately, it'll make the diff clearer.

> -		delay =3D rdev->desc->ops->set_voltage_time_sel(rdev,
> -						old_selector, selector);

> +		delay =3D rdev->desc->ops->set_voltage_time_sel(
> +			rdev, old_selector, selector);

Coding style - there's no need to put the rdev on the new line and the
arguments should be more indented.  Look at how the original was
indented...

> +	/* Insert any necessary delays */
> +	if (delay >=3D 1000) {
> +		mdelay(delay / 1000);
> +		udelay(delay % 1000);
> +	} else if (delay) {
> +		udelay(delay);
> +	}
> +
> +no_delay:

Why were the gotos there?

> @@ -2993,54 +3005,58 @@ int regulator_set_voltage_time(struct regulator *=
regulator,
>  {
>  	struct regulator_dev *rdev =3D regulator->rdev;
>  	const struct regulator_ops *ops =3D rdev->desc->ops;
> -	int old_sel =3D -1;
> -	int new_sel =3D -1;
> -	int voltage;
> -	int i;
> =20
> -	/* Currently requires operations to do this */
> -	if (!ops->list_voltage || !ops->set_voltage_time_sel
> -	    || !rdev->desc->n_voltages)
> -		return -EINVAL;
> +	if (ops->set_voltage_time) {
> +		return ops->set_voltage_time(rdev, old_uV, new_uV);
> +	} else if (ops->set_voltage_time_sel) {
> +		int old_sel =3D -1;
> +		int new_sel =3D -1;
> +		int voltage;
> +		int i;
> =20
> -	for (i =3D 0; i < rdev->desc->n_voltages; i++) {
> -		/* We only look for exact voltage matches here */
> -		voltage =3D regulator_list_voltage(regulator, i);

The diff and I expect the resulting code would be a lot clearer if we
just left most of the function indented as it is and simply directly
returned set_voltage_time().  Which is what we do anyway so no need to
reindent the rest of the code.

> +int regulator_set_voltage_time_op(struct regulator_dev *rdev,
> +				int old_uV, int new_uV)
>  {
>  	unsigned int ramp_delay =3D 0;
> -	int old_volt, new_volt;
> =20
>  	if (rdev->constraints->ramp_delay)
>  		ramp_delay =3D rdev->constraints->ramp_delay;
> @@ -3052,6 +3068,28 @@ int regulator_set_voltage_time_sel(struct regulato=
r_dev *rdev,
>  		return 0;
>  	}
> =20
> +	return DIV_ROUND_UP(abs(new_uV - old_uV), ramp_delay);
> +}
> +EXPORT_SYMBOL_GPL(regulator_set_voltage_time_op);

This is getting very messy.  Having the handling of the ramp delay DT
properties in the operation that the driver in theory implements is
making things harder than they should be (and we seem to have some
broken drivers that don't do one or both of the ramp delays).  I'm not
sure this series is the place to fully fix that but it'd be good to
start that refactoring by not requiring the op be set and instead just
doing this implementation by default.  That way there's less stuff to
clean up later on.

--uTCAFClMX+U9tLbX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX1vS9AAoJECTWi3JdVIfQTaoH/RbCYZjPFRJrxtPXbYuLzu+a
SHbPSOnwhB/wFAL/roZRgS0yYIDwnonR2YYHKpBumjTVRbw0HTMAqrglpwGW4cFB
dIWP6+twIvBm/rI1aff4lkAV1mvg/2UiYobLfGsecuX0O/Z6eOa2EkXW9Jo/vRor
70TDZB0aL/Sd4hcSTrm6CDuhIUQRl+jKWvqJVWTOfmUhNhNDzuBQpeFmQB0W9rUQ
1oZcl/JL5984ecuHv686ukUlbw/MqtywxIQkW/SBpK1G9IxafFuz305UI7SGjNo4
cYZB4O3E9/E73CDMEMwBf/w5x+CoOZDR1uBYkEDtTPnll1lLARclZAUoONIaeso=
=T3Cn
-----END PGP SIGNATURE-----

--uTCAFClMX+U9tLbX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
