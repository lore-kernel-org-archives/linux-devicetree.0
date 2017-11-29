From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v2 3/3] regulator: core: Balance coupled regulators
 voltages
Date: Wed, 29 Nov 2017 18:29:45 +0000
Message-ID: <20171129182945.t52kuz6ezogsdvej@sirena.org.uk>
References: <1508330822-8039-1-git-send-email-m.purski@samsung.com>
 <CGME20171018124737eucas1p2ed8002fa4910545e9d56a536303ffc12@eucas1p2.samsung.com>
 <1508330822-8039-4-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wwi4xzhjx66hxlqn"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508330822-8039-4-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--wwi4xzhjx66hxlqn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 18, 2017 at 02:47:02PM +0200, Maciej Purski wrote:

> +static void regulator_lock_supply_parents(struct regulator_dev *rdev)
> +{
> +	struct regulator_dev *supply = rdev_get_supply(rdev);
> +
> +	if (supply)
> +		regulator_lock_supply(supply);
> +}

These functions are fairly pointless as they're so small, and they're
misnamed as they only lock a single parent but the name suggests it's
going to lock multiple things (I'd expect all the coupled regulators or
something from the name).

> +	/*
> +	 * If the regulator is coupled with other regulators, we have to
> +	 * balance their voltages to keep the max_spread constraint.
> +	 */
> +	if (rdev->coupled_desc)
> +		regulator_balance_coupled(rdev->coupled_desc);

Just put the check into regulator_balance_coupled() rather than doing it
at every call site.

> +	/*
> +	 * If the regulator is coupled, return after changing consumer demands
> +	 * without changing voltage. This will be handled outside the function
> +	 * by regulator_balance_coupled()
> +	 */
> +	if (rdev->coupled_desc)
> +		goto out;
> +
> +	ret = regulator_set_voltage_rdev(regulator->rdev, min_uV, max_uV);
> +	if (ret < 0)
> +		goto out2;

Where is the elsewhere?  I'm worried this is going to make things more
confusing.

--wwi4xzhjx66hxlqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAloe/JgACgkQJNaLcl1U
h9AGEwf9GPDs7KNX0q4OcbIaztgJk/snxn/8BvCxFYGFNL1ymwr6U/BZf96n2WVp
HYYwP2akvO44tHGGp+g5CBXUrwQUPiqf68aFs0TBEVOe8YqvbA8Fhp3UpQe43fKx
X6zZo6kFHastQl9cDGlhCDsrDfjgNOoX3sSuQbtMhcf53h6+x91DnItvbt97ORwa
VPbJX2b9jW7acoDmTaUksnvde9bmx3/g/Tk/uEK8EVsT41pO7sCwkrgMokw+XTUO
Va3Ifma5bC4UyiZz5ew/9f/YDtuLti0hUDwsfOUtJawPcPzvvKxII9qPuJQDMZ0J
qyrQZ7CkhwmQpgJJTBYW98hhfuWC2A==
=jKun
-----END PGP SIGNATURE-----

--wwi4xzhjx66hxlqn--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
