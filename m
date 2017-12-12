From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/4] regulator: core: Balance coupled regulators
 voltages
Date: Tue, 12 Dec 2017 11:54:27 +0000
Message-ID: <20171212115427.GG16323@sirena.org.uk>
References: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
 <CGME20171207094754eucas1p1528c6c30135124430a5c703eb81de8d2@eucas1p1.samsung.com>
 <1512639975-22241-5-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f5QefDQHtn8hx44O"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512639975-22241-5-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--f5QefDQHtn8hx44O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2017 at 10:46:15AM +0100, Maciej Purski wrote:

> @@ -2447,10 +2482,9 @@ static int _regulator_is_enabled(struct regulator_=
dev *rdev)
>  	return rdev->desc->ops->is_enabled(rdev);
>  }
> =20
> -static int _regulator_list_voltage(struct regulator *regulator,
> -				    unsigned selector, int lock)
> +static int _regulator_list_voltage(struct regulator_dev *rdev,
> +				   unsigned selector, int lock)
>  {

Please split this refactoring of _list_voltage() into a separate patch
for ease of review.  It can go in separately which will make this change
smaller and easier to review.

> @@ -2928,6 +2961,35 @@ static int regulator_set_voltage_unlocked(struct r=
egulator *regulator,
>  	if (ret < 0)
>  		goto out2;
> =20
> +	/*
> +	 * If the regulator is not coupled just set voltage normally, else
> +	 * return after changing consumer demands without changing voltage.
> +	 * This will be handled outside the function
> +	 * by regulator_balance_coupled()
> +	 */
> +	if (!rdev->coupling_desc) {
> +		ret =3D regulator_set_voltage_rdev(regulator->rdev,
> +						 min_uV, max_uV);
> +		if (ret < 0)
> +			goto out2;
> +	}

As I think I said on the previous version I'm not enthusiastic about
having two separate code paths for setting the voltage, it makes it much
more likely that things will break especially given how rare coupled
regulators are.  It would be cleaner to make uncoupled regulators just
be a special case of coupled regulators, that way more of the code is
shared.  To that end I'd adjust the code so that we always have a
coupling descriptor and then handle the case where there's only one
regulator described in there.

--f5QefDQHtn8hx44O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlovw3IACgkQJNaLcl1U
h9C9lwf/RQhhuU0Mh0v0rdWO1U9/Z262z3tkPLJ2N56TbCbLG/2AmpvvsFxEtNR3
GnlpedBKASMaVa8laIXqLzs1p93nRMkrhAUXx9DKroLU5Rdzrns6VmA+mD0DkV/8
0qXFD23JNyvnQej8wipBUmHO+kqbpdt3orjmdwlpp13qtsWGPXhG3ey2y4u+3E8i
HQOhn7XWbCAiyOGwYrX2MbowWIDl5/d7aO1JMyR7PT58Fumi+x3/VTSOeH8FdgO+
20GCtM9nrYXxzMYTQIgvkyuyL/+vEY1Aat+rZfB68+q9rUqsc2LTBXjvmrAWjjo2
PCfw/BbLp0E+U2R+lkRKz+KinU+zxQ==
=c3bH
-----END PGP SIGNATURE-----

--f5QefDQHtn8hx44O--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
