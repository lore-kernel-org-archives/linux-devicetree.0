From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Introduce fdt_setprop_placeholder() method
Date: Wed, 26 Jul 2017 15:15:03 +1000
Message-ID: <20170726051503.GE8978@umbus.fritz.box>
References: <1501003461-2421-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lLbDBsvWahy0xqFJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501003461-2421-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--lLbDBsvWahy0xqFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2017 at 08:24:21PM +0300, Pantelis Antoniou wrote:
> In some cases you need to add a property but the contents of it
> are not known at creation time, merely the extend of it.
>=20
> This method allows you to create a property of a given size
> which will be set to zero while a pointer to the property data
> will be provided.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Almost there, couple of details to fix.

> ---
>  libfdt/fdt_rw.c | 21 +++++++++++++++++++++
>  libfdt/libfdt.h | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 8b487f6..2b4432f 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -288,6 +288,27 @@ int fdt_setprop(void *fdt, int nodeoffset, const cha=
r *name,
>  	return 0;
>  }
> =20
> +int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
> +			    int len, void **prop_data)
> +{
> +	struct fdt_property *prop;
> +	int err;
> +
> +	FDT_RW_CHECK_HEADER(fdt);
> +
> +	err =3D _fdt_resize_property(fdt, nodeoffset, name, len, &prop);
> +	if (err =3D=3D -FDT_ERR_NOTFOUND)
> +		err =3D _fdt_add_property(fdt, nodeoffset, name, len, &prop);
> +	if (err)
> +		return err;
> +
> +	if (len)
> +		memset(prop->data, 0, len);

I don't think we want the memset - the caller is expected to overwrite
the content anyway.  That also patches fdt_property_placeholder()
which doesn't clear the allocated space.

> +	if (prop_data)
> +		*prop_data =3D prop->data;

Likewise, I'd make the prop_data parameter mandatory, so no need for a
NULL check.  Again, this patches fdt_property_placeholder().

You can probably also simplify the existing fdt_setprop() function a
little by using fdt_setprop_placeholder() within it.

> +	return 0;
> +}
> +
>  int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
>  		   const void *val, int len)
>  {
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index a248b1b..7ea9a0c 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1449,6 +1449,38 @@ int fdt_setprop(void *fdt, int nodeoffset, const c=
har *name,
>  		const void *val, int len);
> =20
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
> + *
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

--lLbDBsvWahy0xqFJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll4JVQACgkQbDjKyiDZ
s5JX0hAA4mmFH5ET4b7eb1LC0P+9hWPLb8ERjEzlyL05DgjdqnTnvnyRy0K8NfTd
GYcRnRtPFm2QkECMonPntlSsTBy0quMIIhZ5OAWmNqVDR9gZVnycDqvw+zbFPQQB
WD+oyr/qRJEU+jBox2OCRHAqN92eFUvtswxr0sl5shYAF0cX0mwkrDKy9H2yDjJZ
aDPbrYEcjeamU0VGiMDCdxryjqGogXpJ8mxeUfzqLq4/simKB82dhEWbYVYsJ9YA
th3hA1d4T0g5SVK4Pcrj4uUl0RFdhHE+816/+TvJON6eOVgGNTR/fKWYtyCvIgSp
GPx4TUnWMHKPEkCLVJYg8/3KfCB/SpfAF8BWI+t5GaGll9bUMaSo9VSJ5MtXyx1b
ChEU8Jy/mBsTeI3/KDiVRCzIASTteLtb3i/5YvKBpKFoidGgVgl25BLAXzTeQvjT
5TF6IJli/CQkbRNcRVK64eNzEDT1fylLszfJ3Bqi++DlrbOPMD2IHa4WSVv7euDB
jPj0PbNmiJjXIs2OB9U/SM1/8ck9rDlyYz7GcrE8CKnzqO9kZYao7BRx6zepBkCK
BSe23roHRoSnH5nEHOyPGJ2zQ/7i0dQQaROLyAyw2FlzoBsyWDbHFUW7tP3Z08zq
bn4tf/D0+/iNyO48FbAggXcULOdJ1neXJKgiM23Zfb3YshqZh8k=
=gTC6
-----END PGP SIGNATURE-----

--lLbDBsvWahy0xqFJ--
