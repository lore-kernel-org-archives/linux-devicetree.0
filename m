From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Introduce fdt_setprop_placeholder() method
Date: Thu, 27 Jul 2017 17:35:46 +1000
Message-ID: <20170727073546.GE7970@umbus.fritz.box>
References: <1501080418-26548-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a1QUDc0q7S3U7/Jg"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501080418-26548-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--a1QUDc0q7S3U7/Jg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2017 at 05:46:58PM +0300, Pantelis Antoniou wrote:
> In some cases you need to add a property but the contents of it
> are not known at creation time, merely the extend of it.
>=20
> This method allows you to create a property of a given size
> which will be set to zero while a pointer to the property data
> will be provided.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
[snip]
>  /**
> + * fdt_setprop _placeholder - allocate space for a property
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of the node whose property to change
> + * @name: name of the property to change
> + * @len: length of the property value
> + * @prop_data: return pointer to property data
> + *
> + * fdt_setprop_placeholer() allocates the named property in the given no=
de.
> + * If the property exists it is resized. In either case it filled with
> + * zeroes and if a prop_data argument is provided a pointer to the
> + * property data is returned.

Doc comment hasn't been updated to reflect the latest chnages (not zeroed).

> + * This function may insert or delete data from the blob, and will
> + * therefore change the offsets of some existing nodes.
> + *
> + * returns:
> + *	0, on success
> + *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
> + *		contain the new property value
> + *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
> + *	-FDT_ERR_BADLAYOUT,
> + *	-FDT_ERR_BADMAGIC,
> + *	-FDT_ERR_BADVERSION,
> + *	-FDT_ERR_BADSTATE,
> + *	-FDT_ERR_BADSTRUCTURE,
> + *	-FDT_ERR_BADLAYOUT,
> + *	-FDT_ERR_TRUNCATED, standard meanings
> + */
> +int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
> +			    int len, void **prop_data);
> +
> +/**
>   * fdt_setprop_u32 - set a property to a 32-bit integer
>   * @fdt: pointer to the device tree blob
>   * @nodeoffset: offset of the node whose property to change

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--a1QUDc0q7S3U7/Jg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll5l9IACgkQbDjKyiDZ
s5LMfg//RpfOMCJo1fTw+zeUNtDWGw9lOONX0WkVmdivU/rD6SyXBS61BLGyQ+e+
FoLtFvY/AtOBx6DTPUaicp7NrKu/D/2FAmvMZVhIQ2qRbe2XhmhdAMRKuJWTuDnh
Amqe3JKUJcKqvFsGv9FN0TJDLmMCFWwfcmoUKRJXJZzJ3DKL1Hhr/B9glVZ8izeN
7pGXY9Dgu5PEYdZiSzsamS3uQSQ78eJedIzJmF3eaYv3JNaoL8eeNMHpru0LhBof
53KdVxhNYE1BlgYZ6BGqqGRHBK6VzBgwDAfMRFoc4BetO5FjHPCixFELl5y9HO+O
xeDrT4hbK190X/4B/n1AmjcdV2FEVMUysqwRkDgBM9wHV3v8ZFqNbifEApp0NV5q
uHYvOeix3LMkKH0YoSI/1O4yWrJpNOnI7w4FiV9qPjp8PTUv8yFGMkcQmkBYhE7o
QjqWsCzU1wvxW6eDvI/bPUn+dYSYNJMZwgurvqCyE7sbvA2eJ4aVS64oc6m/COeo
8exd6cg6rwSYDerleW/AwHH0YZcW85pUD6gDYjbu8H8fbX5CzW0E5IDQhq7NX4EG
nVJueCzd3VLg+etfoZFi2utMgboUvSHvzfsob/OJqJkuxBKunPg3LjGtUeaFwN36
szQkxQrz8GNfAS7FKIELumaaaKThxwvr3hduWGossLuA+p1Oipw=
=HALe
-----END PGP SIGNATURE-----

--a1QUDc0q7S3U7/Jg--
