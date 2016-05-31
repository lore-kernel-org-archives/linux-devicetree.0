From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/4] libfdt: Add iterator over properties
Date: Tue, 31 May 2016 10:53:47 +1000
Message-ID: <20160531005347.GG17226@voom.fritz.box>
References: <1464337729-7821-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464337729-7821-4-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rltfBdJX5ToILDSK"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464337729-7821-4-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--rltfBdJX5ToILDSK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2016 at 10:28:47AM +0200, Maxime Ripard wrote:
> Implement a macro based on fdt_first_property_offset and
> fdt_next_property_offset that provides a convenience to iterate over all
> the properties of a given node.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Looks, ok but a couple of nits:

1) Needs a testcase.

2) I prefer the convention that in for_each_XX style macros, the first
argument should be the "loop counter" (i.e. the property offset in
this case).

3) Please make the offset parameter called 'offset' or
'property_offset', and change the macro name to
'fdt_for_each_property_offset'.  I know this is pedantic, but the
naming convention is designed to repeatedly remind the user that
offsets are offsets and so *cannot* be used as persistent handles.

> ---
>  libfdt/libfdt.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 331f32dd04b5..6589e08db7ab 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -456,6 +456,30 @@ int fdt_first_property_offset(const void *fdt, int n=
odeoffset);
>  int fdt_next_property_offset(const void *fdt, int offset);
> =20
>  /**
> + * fdt_for_each_property - iterate over all properties of a node
> + * @fdt:	FDT blob (const void *)
> + * @node:	node offset (int)
> + * @property:	property offset (int)
> + *
> + * This is actually a wrapper around a for loop and would be used like s=
o:
> + *
> + *	fdt_for_each_property(fdt, node, property) {
> + *		...
> + *		use property
> + *		...
> + *	}
> + *
> + * Note that this is implemented as a macro and property is used as
> + * iterator in the loop. It should therefore be a locally allocated
> + * variable. The node variable on the other hand is never modified, so
> + * it can be constant or even a literal.
> + */
> +#define fdt_for_each_property(fdt, node, property)		\
> +	for (property =3D fdt_first_property_offset(fdt, node);	\
> +	     property >=3D 0;					\
> +	     property =3D fdt_next_property_offset(fdt, property))
> +
> +/**
>   * fdt_get_property_by_offset - retrieve the property at a given offset
>   * @fdt: pointer to the device tree blob
>   * @offset: offset of the property to retrieve

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rltfBdJX5ToILDSK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXTOCbAAoJEGw4ysog2bOS0swP/R7nPwp7eO9wwV/VharMwmLg
AFlzyFV9BCAX/naALMUCuz3O2tEW0kDNO7xQgf9Tz6OcNkx4CRaMd9XCthP4ttVI
D1N9Jch6XiGrCovp63TzWBJ+IjIB4huP+6vfss+dRp7VWrFm/p+zhCUXhhKG/0os
i33NYMd31EdhbOo68rcO4byMX8NwKvru35mTsbgaQ2wViDXocYGE0bt9HT3a0NBH
ixIG0Vrywq0sB6N3YkynmOmw3W1C81q2Lyy/DGmY3L1/HhIi0IpiPgYOrwFmN5VB
iIKnvzZy00wg3p8CCYYakJFqpWEnmHpwmMSCmSubnT3+m53QD31SD/hU95CQZ7Y2
euLK1sD8Om5ta5YVQ/YNyUooVD59IUub/ETpebmNsjF0sIGItF4S4/Y3oanQpaGZ
E+AoTMMtoj3e3IVyVPOXct3M8p3knjs6i7OwQLtsgt5csa86LlcIIUpF+6LPqo5k
3+d5yIRr4Rjpjaiu8bYNsSfFcz/YCv2x63C8er8wMfZSiP45QV6R+LZF6yDAxC87
LKd9IOflWFhSQbJlClz6PM8gcOs3kDUngqbCdpSl3t7cLxtVnup/V5f6jMZ1xZxN
LNRSXJcdgvYb6mErRAGRVibWDOid8102I39AKx+fJ1OaIZVJiLe5lI5JxR0tHpsJ
GyTBAVl8A76z5OCZdj4f
=Gygb
-----END PGP SIGNATURE-----

--rltfBdJX5ToILDSK--
