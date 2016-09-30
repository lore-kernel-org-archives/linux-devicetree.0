From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 1/4] libfdt: Add new errors for the overlay code
Date: Fri, 30 Sep 2016 11:43:49 +1000
Message-ID: <20160930014349.GU30519@umbus.fritz.box>
References: <20160929112908.4468-1-maxime.ripard@free-electrons.com>
 <20160929112908.4468-2-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jllsgs4PL/sXFNaa"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160929112908.4468-2-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jllsgs4PL/sXFNaa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2016 at 01:29:05PM +0200, Maxime Ripard wrote:
> Add a few new error codes to report the failure conditions we might
> encounter in the overlay application code:
>    - FDT_ERR_BADFIXUP, when an overlay fixup property is not properly
>      formatted.
>    - FDT_ERR_BADOVERLAY, when an overlay cannot be parsed, even though its
>      structure is correct

So, my thought had been to combine all problems with the overlay for
fixup formatting into a single error code BADOVERLAY.

I'm not opposed to splitting that up more, but there should be a
coherent guideline about what's BADFIXUP and what's BADOVERLAY.

>    - FDT_ERR_NOPHANDLES, when we ran out of available phandles and we
>      cannot use a new phandle without either using an invalid one (-1 or
>      0), or one already used.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  libfdt/fdt_strerror.c |  3 +++
>  libfdt/libfdt.h       | 15 ++++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
> index e6c3ceee8c58..70a36291466f 100644
> --- a/libfdt/fdt_strerror.c
> +++ b/libfdt/fdt_strerror.c
> @@ -76,6 +76,9 @@ static struct fdt_errtabent fdt_errtable[] =3D {
>  	FDT_ERRTABENT(FDT_ERR_BADVERSION),
>  	FDT_ERRTABENT(FDT_ERR_BADSTRUCTURE),
>  	FDT_ERRTABENT(FDT_ERR_BADLAYOUT),
> +	FDT_ERRTABENT(FDT_ERR_BADFIXUP),
> +	FDT_ERRTABENT(FDT_ERR_BADOVERLAY),
> +	FDT_ERRTABENT(FDT_ERR_NOPHANDLES),
>  };
>  #define FDT_ERRTABSIZE	(sizeof(fdt_errtable) / sizeof(fdt_errtable[0]))
> =20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index ecb11fc9e985..81907815fda1 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -126,7 +126,20 @@
>  	 * value. For example: a property expected to contain a string list
>  	 * is not NUL-terminated within the length of its value. */
> =20
> -#define FDT_ERR_MAX		15
> +#define FDT_ERR_BADFIXUP	16
> +	/* FDT_ERR_BADFIXUP: One of the device tree overlay fixup is
> +	 * not formatted properly. */
> +
> +#define FDT_ERR_BADOVERLAY	17
> +	/* FDT_ERR_BADOVERLAY: The device tree overlay, while
> +	 * correctly structured, cannot be applied due to some
> +	 * unexpected or missing value, property or node. */
> +
> +#define FDT_ERR_NOPHANDLES	18
> +	/* FDT_ERR_NOPHANDLES: The device tree doesn't have any
> +	 * phandle available anymore without causing an overflow */
> +
> +#define FDT_ERR_MAX		18
> =20
>  /**********************************************************************/
>  /* Low-level functions (you probably don't need these)                */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jllsgs4PL/sXFNaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX7cNVAAoJEGw4ysog2bOS+x8QALnWE1tL2kvxaqlV7PLiAcXI
uHSdOQsW8MJrlU/Kph6teOjyMYH0j91qJofaL0w+enI+2/qPx8C9PwJaD+l93HQc
4gs3f3Ffs/9NQL3IlCFeSjKLiGKsFYBAtCxNkXVqyBbsdx1HPjgv8pSbhWE9YDpd
phmXVxrNG/L67Y5lQZ+Qead2kawavGT51Fg7Hh3j3E6vRG7Ze5y/AQ8N6xir+tOr
NuIYf/Tynm38FBquiZ5cjMaIxdKinrw/UqrR5ODlB+lQ/KRY0RbmIHi/DAfwecTG
85G8qy+w6Tppf4UbAoYsPZLZd8lkHM2sXzuCwTQw+HMX5kJH6YeUK+tky2UIGUR8
PVRsLrh5pSekN6TE74fRD+enSK0VQamwl1avN/2GJp3I7sl9UTUMm6zbyn9pXAbW
AWz4Nm1RGyXYRW2YEpU2ONdvNb1qr95tdevJHQNWlS8BN78FwS2IwFM01ZY6LmpZ
gtje7Gm6HKtAbE9de2lBdcGwTWWKT7Ofe39ptaZ0hWCi908onelVbJOlNHzI77iK
laLD5ozAQW6FmLJ7949ALKEW00xZ5o4Kb4EJhyxN8I33VdSuY0pbyiZJLw1YLZS8
keqg7sHd3rHVdSKxlltmsyyn7RbBVxQFBaqykUt2AK9jjTGA4E2cWAzbJOydkE4h
+yvs6nbM3sEko54vYUcp
=zgl3
-----END PGP SIGNATURE-----

--jllsgs4PL/sXFNaa--
