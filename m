From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Introduce fdt_setprop_alloc() method
Date: Fri, 14 Jul 2017 19:16:48 +1000
Message-ID: <20170714091648.GD17539@umbus.fritz.box>
References: <1499894626-25699-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1499894626-25699-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2017 at 12:23:46AM +0300, Pantelis Antoniou wrote:
> In some cases you need to add a property but the contents of it
> are not known at creation time, merely the extend of it.
>=20
> This method allows you to create a property of a given size
> which will be set to zero while a pointer to the property data
> will be provided.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Not a bad idea, but it should be named fdt_setprop_placeholder() to
match the existing fdt_property_placeholder() (which does basically
the same thing for sequential write mode).

> ---
>  libfdt/fdt_rw.c | 21 +++++++++++++++++++++
>  libfdt/libfdt.h | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 8b487f6..c66b16a 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -288,6 +288,27 @@ int fdt_setprop(void *fdt, int nodeoffset, const cha=
r *name,
>  	return 0;
>  }
> =20
> +int fdt_setprop_alloc(void *fdt, int nodeoffset, const char *name,
> +		      int len, void **prop_data)
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
> +	if (prop_data)
> +		*prop_data =3D prop->data;
> +	return 0;
> +}
> +
>  int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
>  		   const void *val, int len)
>  {
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index a248b1b..e01c645 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1449,6 +1449,38 @@ int fdt_setprop(void *fdt, int nodeoffset, const c=
har *name,
>  		const void *val, int len);
> =20
>  /**
> + * fdt_setprop _alloc- allocate space for a property
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of the node whose property to change
> + * @name: name of the property to change
> + * @len: length of the property value
> + * @prop_data: return pointer to property data
> + *
> + * fdt_setprop_alloc() allocatesthe named property in the given node.
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
> +int fdt_setprop_alloc(void *fdt, int nodeoffset, const char *name,
> +		      int len, void **prop_data);
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

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlloi/0ACgkQbDjKyiDZ
s5J1hxAApVwk/1I0oNBjfiqTkXqvR4j1PF/C62ykl3ldWLyBIKv+JAIqMXlVzNQu
WZ7WaDXdc4Qv/iBEBu4Vrkh+5a+9oVep05oqSuH+W+CpMZd9nd1kSTiZQXdyfgt3
FFWjZD2bHMQyv3nd8NQ6+BjPqzcl6JxOpEzq1KGMr3V/PWq6NVukw3P0c1Zq+cEk
TabzhXlhY4B2KsJI901CNXz5YHU1b24LHfVdGPheO4T6xr6sqtkE9NN29YcjuwTb
ev1PQIJv59N+V8HzfRBWh9IQyvwNAeQ3i7reHwddtjBD1ZQN2GeHmuJsyyYOClel
lZtwujCLo2EnbtuFvpB/eIx6pBpTEzTn4ABojYtZclXnzREXDCs8q6mn5eV44MVN
7NibI8gvOFTnM5ib6/g5F3nJyDV0s3QB0g/ciEySFenWpvQ2LLlF9JUZnnvPj2Be
Pt9XlOUZGEbV838GyZkQVpYZS1OWqKW1PIb8I7beoogwOcUaZtq96fE+EGxNDKsw
zPWSgi2lSHz6D0V/lJe3OLvQT2Ii1ThMHlWLeP6DAZohhwkq+T5IakNjeDtImLuu
WQZ1qfHofGlwBMT851rbCV+frOoYE7TVeuZUgPSyQ7+r8GSOAUb2TECTxdVAMe5U
PF0b/bCYNr7Sd1hIgZ1/SKVfDLYT0dwzL5kXp58kcgF65fHwJqE=
=XZrB
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--
