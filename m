From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/4] regulator: core: Parse coupled regulators
 properties
Date: Tue, 12 Dec 2017 11:35:11 +0000
Message-ID: <20171212113511.GF16323@sirena.org.uk>
References: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
 <CGME20171207094753eucas1p27b835787f92a1da8c46b9a2692376288@eucas1p2.samsung.com>
 <1512639975-22241-4-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512639975-22241-4-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2017 at 10:46:14AM +0100, Maciej Purski wrote:

> +static int check_coupled_regulators_array(struct coupling_desc *c_desc,
> +					  int index)
> +{

> +	/* Different number of regulators coupled */
> +	if (of_count_phandle_with_args(node, "regulator-coupled-with", 0) !=3D
> +				      (n_coupled - 1))
> +		return -EINVAL;

This is still DT only code in the core file, we really need the core to
not know anything about DT so that we know that we can support this
feature with other firmwares if we need to.  Just move all the parsing
code into the of_regulator.c then have a second step that goes through
and validates extra stuff like the presence of set voltage operations in
the generic code.

> +		if (c_desc->coupled_rdevs[i]->constraints->max_spread !=3D
> +		    rdev->constraints->max_spread) {
> +			rdev_err(rdev, "coupled regulators max_spread mismatch\n");
> +			goto err;
> +		}

It's better to print out failing values when things go wrong - it really
helps people debug their DTs if the error messages are specific about
what went wrong.  This applies to a bunch of the errors here.

> +	mutex_lock(&regulator_list_mutex);
> +	regulator_resolve_coupling(rdev);
> +	mutex_unlock(&regulator_list_mutex);
> +

I'd really expect us to be failing to probe if we run into an error.
Otherwise we could end up doing bad things to the hardware at runtime
later on, or confusing ourselves and crashing with partially set up
datastructures.  It's also not 100% clear to me how we handle the case
where only some of the coupled regulators have probed.

> diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
> index 2f3218b..6290384 100644
> --- a/drivers/regulator/internal.h
> +++ b/drivers/regulator/internal.h
> @@ -16,6 +16,8 @@
>  #ifndef __REGULATOR_INTERNAL_H
>  #define __REGULATOR_INTERNAL_H
> =20
> +#include <linux/regulator/driver.h>
> +

Why do we need this?

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlovvu8ACgkQJNaLcl1U
h9DpJQf+JyzI1Orv714Bsa/Q3UWTpgnF59Qa8vSJpvh4zXeN3kgW2oR48AtugiL/
1hVtfNja1jhCftVzSYitbQ9sMqy1PK1DTBUBDpPLQqmaPbvJ9Nv+DzoIGQ8/eoq+
9t3sMfp1Dtg428A/XOg1R/Ec1xy40wHJM5R3RpCSqkgFkT7rlVBXo2ESJQwgOBzY
rmo+GdmZzKCFcmAtqrNNTYumOw+mL7GMCIWvNx73oGeEfA1xH2AFKPzSmMVjFmxb
G2GwDA5EGTZiLxJDnICLwjCQWBHUAQ9GXpXDlT7YWPqWhqYbLbug8k+8x9+GvD72
4JbN5iydnsj1MA7sGcxrLVhK6li8WQ==
=Y8VD
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
