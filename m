From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Introduce fdt_setprop_placeholder() method
Date: Fri, 28 Jul 2017 14:43:37 +1000
Message-ID: <20170728044337.GN3098@umbus.fritz.box>
References: <1501173191-652-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gWRamliw218YCZO9"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501173191-652-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gWRamliw218YCZO9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 07:33:11PM +0300, Pantelis Antoniou wrote:
> In some cases you need to add a property but the contents of it
> are not known at creation time, merely the extend of it.
>=20
> This method allows you to create a property of a given size
> which will be set to zero while a pointer to the property data
> will be provided.

Commit message still incorrectly refers to zeroing the property.

I've corrected it and applied.  But review comments are not sed
scripts - you're supposed to see what changes logically follow from
those suggested and make those as well.

> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  libfdt/fdt_rw.c | 20 +++++++++++++++++---
>  libfdt/libfdt.h | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+), 3 deletions(-)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 8b487f6..5c3a2bb 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -269,8 +269,8 @@ int fdt_set_name(void *fdt, int nodeoffset, const cha=
r *name)
>  	return 0;
>  }
> =20
> -int fdt_setprop(void *fdt, int nodeoffset, const char *name,
> -		const void *val, int len)
> +int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
> +			    int len, void **prop_data)
>  {
>  	struct fdt_property *prop;
>  	int err;
> @@ -283,8 +283,22 @@ int fdt_setprop(void *fdt, int nodeoffset, const cha=
r *name,
>  	if (err)
>  		return err;
> =20
> +	*prop_data =3D prop->data;
> +	return 0;
> +}
> +
> +int fdt_setprop(void *fdt, int nodeoffset, const char *name,
> +		const void *val, int len)
> +{
> +	void *prop_data;
> +	int err;
> +
> +	err =3D fdt_setprop_placeholder(fdt, nodeoffset, name, len, &prop_data);
> +	if (err)
> +		return err;
> +
>  	if (len)
> -		memcpy(prop->data, val, len);
> +		memcpy(prop_data, val, len);
>  	return 0;
>  }
> =20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index a248b1b..313c72a 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1449,6 +1449,37 @@ int fdt_setprop(void *fdt, int nodeoffset, const c=
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
> + * If the property exists it is resized. In either case a pointer to the
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

--gWRamliw218YCZO9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll6wPYACgkQbDjKyiDZ
s5J6iw//dc5HjV0+SYmGh7AqzR+JCCxazeh/GOjjBydADbXYpE5vRvXZTDJt51SR
cK2ClLbgL2ivW0Bbg1tE/FAks2Bv35PvsXyd2X2Z/igu/m42lOsEoYju4ECW4YFo
VWGIK5z4GX6vLMOVZfMlyRaPI3X4FxdNTur6MftwF1PFGKd05IJjgNSQTr2OJN+0
C5stdoLpzflSUg4y4afvnsWWgJOJab5ajTjoPNcJxPaSP6O2hGTRLZd+9Wzhr3GK
lhtHV5vZxALCr2OdLZ1g7SX7klpErO3DUKQLJrjXuSRtxDzgX1p8qAqB7oINC7cj
m6+eBHwJWjMIcbHBz6UORhR4f5CZURH0VmX2PBhyQ/HDZ0a2Xo99N7YncgVGrVMA
B5qxBDlKzD55GTsY8oZ7SkHWEROwUoWj/sm3wl6HwSQ4kHKhGZXrFx8sZsuIQm8R
3d1gya55cXwDsuza7QCDy4rDELzyvlvLAKll1chWUGEmhKlBG69uuK/bjigJGbOO
35WAmzM01EPP3tgVGWHOMjUpIPuO+q2p0qMMKN69FaQmW2uWzmjvInna1qxn+TxC
zpURfBfuDfsKgSkNOeekCQ4Vl2rGp6V5pCtowu6yIcUKQmONAOisNwMXujdt7GRg
0iN5S2bAEiBUVrDQt9nUUl7FlV9DhgGHr1caTSIJSV/vd/h+tYg=
=TV+q
-----END PGP SIGNATURE-----

--gWRamliw218YCZO9--
