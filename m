From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 5/8] libfdt: Add fdt_setprop_inplace_namelen_partial
Date: Mon, 1 Aug 2016 13:36:42 +1000
Message-ID: <20160801033642.GV2588@voom.fritz.box>
References: <20160729095551.13592-1-maxime.ripard@free-electrons.com>
 <20160729095551.13592-6-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l5oECiFRo5dp+2y7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160729095551.13592-6-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--l5oECiFRo5dp+2y7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2016 at 11:55:48AM +0200, Maxime Ripard wrote:
> Add a function to modify inplace only a portion of a property..
>=20
> This is especially useful when the property is an array of values, and you
> want to update one of them without changing the DT size.
>=20
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied, though I made a couple of tiny tweaks, see below.

> ---
>  libfdt/fdt_wip.c        | 29 +++++++++++++++++++++++++----
>  libfdt/libfdt.h         | 21 +++++++++++++++++++++
>  tests/setprop_inplace.c | 10 ++++++++++
>  tests/testdata.h        |  3 +++
>  4 files changed, 59 insertions(+), 4 deletions(-)
>=20
> diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> index c5bbb68d3273..a6e158d1889a 100644
> --- a/libfdt/fdt_wip.c
> +++ b/libfdt/fdt_wip.c
> @@ -55,21 +55,42 @@
> =20
>  #include "libfdt_internal.h"
> =20
> +int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
> +					const char *name, int namelen,
> +					uint32_t idx, const void *val,
> +					int len)
> +{
> +	void *propval;
> +	int proplen;
> +
> +	propval =3D fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
> +					&proplen);
> +	if (!propval)
> +		return proplen;
> +
> +	if (proplen < (len + idx))
> +		return -FDT_ERR_NOSPACE;
> +
> +	memcpy((unsigned char *)propval + idx, val, len);

The unsigned qualifier is not necessary, so I removed it.

> +	return 0;
> +}
> +
>  int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
>  			const void *val, int len)
>  {
> -	void *propval;
> +	const void *propval;
>  	int proplen;
> =20
> -	propval =3D fdt_getprop_w(fdt, nodeoffset, name, &proplen);
> +	propval =3D fdt_getprop(fdt, nodeoffset, name, &proplen);
>  	if (! propval)
>  		return proplen;
> =20
>  	if (proplen !=3D len)
>  		return -FDT_ERR_NOSPACE;
> =20
> -	memcpy(propval, val, len);
> -	return 0;
> +	return fdt_setprop_inplace_namelen_partial(fdt, nodeoffset, name,
> +						   strlen(name), 0,
> +						   val, len);
>  }
> =20
>  static void _fdt_nop_region(void *start, int len)
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 0189350fb32f..e534a34355a4 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1079,6 +1079,27 @@ int fdt_size_cells(const void *fdt, int nodeoffset=
);
>  /* Write-in-place functions                                           */
>  /**********************************************************************/
> =20
> +/**
> + * fdt_setprop_inplace_namelen_partial - change a property's value,
> + *                                       but not its size
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of the node whose property to change
> + * @name: name of the property to change
> + * @namelen: number of characters of name to consider
> + * @index: index of the property to change in the array

I changed this comment to match the new function signature.

> + * @val: pointer to data to replace the property value with
> + * @len: length of the property value
> + *
> + * Identical to fdt_setprop_inplace(), but modifies the given property
> + * starting from the given index, and using only the first characters
> + * of the name. It is useful when you want to manipulate only one value =
of
> + * an array and you have a string that doesn't end with \0.
> + */
> +int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
> +					const char *name, int namelen,
> +					uint32_t idx, const void *val,
> +					int len);
> +
>  /**
>   * fdt_setprop_inplace - change a property's value, but not its size
>   * @fdt: pointer to the device tree blob
> diff --git a/tests/setprop_inplace.c b/tests/setprop_inplace.c
> index daef182d0b28..80447a0b13ab 100644
> --- a/tests/setprop_inplace.c
> +++ b/tests/setprop_inplace.c
> @@ -83,5 +83,15 @@ int main(int argc, char *argv[])
>  	strp =3D check_getprop(fdt, 0, "prop-str", xlen+1, xstr);
>  	verbose_printf("New string value is \"%s\"\n", strp);
> =20
> +	err =3D fdt_setprop_inplace_namelen_partial(fdt, 0, "compatible",
> +						  strlen("compatible"), 4,
> +						  TEST_STRING_4_PARTIAL,
> +						  strlen(TEST_STRING_4_PARTIAL));
> +	if (err)
> +		FAIL("Failed to set \"compatible\": %s\n", fdt_strerror(err));
> +
> +	check_getprop(fdt, 0, "compatible", strlen(TEST_STRING_4_RESULT) + 1,
> +		      TEST_STRING_4_RESULT);
> +
>  	PASS();
>  }
> diff --git a/tests/testdata.h b/tests/testdata.h
> index 576974dddee8..3588778ad159 100644
> --- a/tests/testdata.h
> +++ b/tests/testdata.h
> @@ -21,6 +21,9 @@
>  #define TEST_STRING_2	"nastystring: \a\b\t\n\v\f\r\\\""
>  #define TEST_STRING_3	"\xde\xad\xbe\xef"
> =20
> +#define TEST_STRING_4_PARTIAL	"foobar"
> +#define TEST_STRING_4_RESULT	"testfoobar"
> +
>  #define TEST_CHAR1	'\r'
>  #define TEST_CHAR2	'b'
>  #define TEST_CHAR3	'\0'

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--l5oECiFRo5dp+2y7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXnsPKAAoJEGw4ysog2bOSyQcQAKv6xokPp1liAGVutz8yb59k
0R8FTtFuWx9Xx+X9rzydLdPCl2E1DQ3YOTgF2X1wyawpks0wI++MDWfEPIHxMEy9
eNBrOtVsoidZAzd+Umd0s99hc8iOv9dGoN2fRa6jsjI9sr/WFaC0MdgaNGFmmrt5
/5B3Q1vyAiaOvGYzYf4hFq9PvpKi6IWtwAzVDgDl/p1i4qEJqt8z0mpHSYGt8ynY
k0DQUK4MuyLgGYHbjaLY8J3aq3p9+3bHLyKkcmQSc0civ75ay6Gfq0SQEoU5r7Lb
sjD7dkgsNsr8gR+jSTlYwce/ImjW3z1Kk+UFAyaceldqRlpt82eCrs7PP6k6uuOu
eK3R/qCXwvGyBOON3HQ+O8HIqVfz29tbHIXgWKyce7Nn1b0Y96BWff2Js0dUdSkC
fTG18chfFKYXkvDwOq9aG6xVEpuyF/J+hgBLNYj0k5QM92wvv6bY4Qy5Q46UMy7d
NtP1Bm1iUS1PYitpYRRAm4fV8ZE6xuChE43D5bRYcfoQEFBmiVfJm+mV/Sm1/dgT
C8vWxwq7Cxtrt5NaS0hSAgnVZVNzA6fd04QGnMqAoMvBRUWmpIGO9n1tX8rYnnhy
ThSp3OhUOs6WolLLoJH3a4ERWcynL5dWO01DkthvKMB/4KBr5yJ84L39Qa+b1SK8
i8Km6QRiRMgJVA66CsFL
=w28Q
-----END PGP SIGNATURE-----

--l5oECiFRo5dp+2y7--
