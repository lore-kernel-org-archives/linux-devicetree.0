From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 5/6] libfdt: Add fdt_setprop_inplace_namelen_partial
Date: Tue, 12 Jul 2016 21:45:20 +1000
Message-ID: <20160712114520.GB16355@voom.fritz.box>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-6-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pS0IeWLqOQV1qy0L"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160711195623.12840-6-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pS0IeWLqOQV1qy0L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 09:56:22PM +0200, Maxime Ripard wrote:
> Add a function to modify inplace only a portion of a property..
>=20
> This is especially useful when the property is an array of values, and you
> want to update one of them without changing the DT size.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Now it just needs some testcases..

> ---
>  libfdt/fdt_wip.c | 29 +++++++++++++++++++++++++----
>  libfdt/libfdt.h  | 21 +++++++++++++++++++++
>  2 files changed, 46 insertions(+), 4 deletions(-)
>=20
> diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> index c5bbb68d3273..fd53e0b67416 100644
> --- a/libfdt/fdt_wip.c
> +++ b/libfdt/fdt_wip.c
> @@ -55,21 +55,42 @@
> =20
>  #include "libfdt_internal.h"
> =20
> +int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
> +					const char *name, int namelen,
> +					uint32_t index, const void *val,
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
> +	if (proplen < (len + index))
> +		return -FDT_ERR_NOSPACE;
> +
> +	memcpy((unsigned char *)propval + index, val, len);
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
> index 1da2c540b607..a22a16b6878a 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1072,6 +1072,27 @@ int fdt_size_cells(const void *fdt, int nodeoffset=
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
> +					uint32_t index, const void *val,
> +					int len);
> +
>  /**
>   * fdt_setprop_inplace - change a property's value, but not its size
>   * @fdt: pointer to the device tree blob

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pS0IeWLqOQV1qy0L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhNhQAAoJEGw4ysog2bOSPjsP/Am/G6fWeNjcA2ckGVhK16s4
kcLcXvWZJ82/sxfetzyoCdRrTcELYiTtahUouf6ENkeSgSwXumRKhvdQqj3o9PV4
FxotQgU0i1kEynxveUfJldh/HgBh5NjRlEvL65XoY5bqkHvBSmEoGD/RUWZn9Moi
0LqeilZYewPHqD8EhX0Ah9TwbqdsS5S3aF4fEfnfx0TexBz1SwyYR2xU8zcMNbXV
+8ezSBplIy9bn7uMgEhOcgPLeloDoOWFv+5dnlVab4Q4vRSlox4EKsGt4f6EgND7
+N10cLoj1wRnlrrk3zIM8F0pZmB6O26G7o+UDqguC1L5I1oEw519x9NhveuvbIXM
/IpgC+vJDgN7sF3RuCh6eG06Y7rIVc63JI0e6upe/5g3HeldPY4WVhu/l5L6F3zO
9+55y3jmYGJ7WsF1tzsKHRvbTk4MkyZIdb2Se08Poj1RxC98w2XeZJaAjAQlH6+L
cLbTKBmKHL/qDczFikEesMbjkjgWCryM7Wcs7BEW9STgTR3JfCU7ONMo//NzCxyU
stQDGmfphXQLpXu93zagvaWQk1yyXu2nTKxeK+9rlVD+R8v3afebV7u8Q49Vo8sS
uq3TtaAw1KNA8esw5fw7q1E7MxpoUy6Vgl0Xi6prFrEJIR6SVsy/cZdMpQPgIGLy
GWnsZ4x0U2FiC8xOL7JT
=UefU
-----END PGP SIGNATURE-----

--pS0IeWLqOQV1qy0L--
