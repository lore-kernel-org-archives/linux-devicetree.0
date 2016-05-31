From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/4] libfdt: Add a subnodes iterator macro
Date: Tue, 31 May 2016 10:47:19 +1000
Message-ID: <20160531004719.GF17226@voom.fritz.box>
References: <1464337729-7821-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464337729-7821-3-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KvB7u8NuoXBZIbZd"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464337729-7821-3-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--KvB7u8NuoXBZIbZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2016 at 10:28:46AM +0200, Maxime Ripard wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The fdt_for_each_subnode() iterator macro provided by this patch can be
> used to iterate over a device tree node's subnodes. At each iteration a
> loop variable will be set to the next subnode.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Looks good, but needs a testcase.  Extending subnode_iterate would
probably make sense.

> ---
>  libfdt/libfdt.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 36222fd4a6f4..331f32dd04b5 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -168,6 +168,31 @@ int fdt_first_subnode(const void *fdt, int offset);
>   */
>  int fdt_next_subnode(const void *fdt, int offset);
> =20
> +/**
> + * fdt_for_each_subnode - iterate over all subnodes of a parent
> + *
> + * This is actually a wrapper around a for loop and would be used like s=
o:
> + *
> + *	fdt_for_each_subnode(fdt, node, parent) {
> + *		...
> + *		use node
> + *		...
> + *	}
> + *
> + * Note that this is implemented as a macro and node is used as iterator=
 in
> + * the loop. It should therefore be a locally allocated variable. The pa=
rent
> + * variable on the other hand is never modified, so it can be constant or
> + * even a literal.
> + *
> + * @fdt:	FDT blob (const void *)
> + * @node:	child node (int)
> + * @parent:	parent node (int)
> + */
> +#define fdt_for_each_subnode(fdt, node, parent)		\
> +	for (node =3D fdt_first_subnode(fdt, parent);	\
> +	     node >=3D 0;					\
> +	     node =3D fdt_next_subnode(fdt, node))
> +
>  /**********************************************************************/
>  /* General functions                                                  */
>  /**********************************************************************/

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KvB7u8NuoXBZIbZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXTN8XAAoJEGw4ysog2bOSnmAP/2ONKYrWLwGRZvspxImazv7o
8xw6qT6/IavDR4GXMfkTBy0LduO4AkRrcQy/yQtmmLooROl6qHdCNG9zAkRuTEIz
s0i0E/BpvdMuX0wnLPPYAyQaBzpGzKzLCddHEGD88dGaKlUnv1kkjEiBShzq9iOy
8E4Arox/bkF3pKthogXvWqvFATj5MIswBRohTwOhl74iBleCTUlK5Vo9ama7ydxD
9ueadxHYHrC5WWs63+4HBUEGYF0tN8w8ElpXkUmpoNLG6CHgWJLJpJduR4b7rvpY
P70CIwkXbzzYjcUL22gFRb7LcnlctlLhi8pEJ6oRmx7l0iC3Ooe/VBkEMowBM0r/
LZ102YQaXo3cQuadtmiZr8zTjnkmn0kVBMSWETauZ+pYJORIH4Mj2Nnhmc4r5C41
OlLVIicnQZxt9g9nP1cECL6VI2GdsmzmlM40tegF13UQvMMif/gXxDEfW4M3VOeM
prF9I9mT3g8vXGPoJpDWp183p7dTj6f2YG2YSD0CrgEVr+psFXN8sRnfBBx+uFEq
A3sP+M6OScWPOA8dIR5Z1dOw0uMtO/EgTsVBqhC8eOrL+2NNtt8mYmgaKgwZKdij
wCPkjFhnkr69aumwoXrKH0ckNvAgaHrJY3tBM267IUMQ9BgqeWhl/M1RUqTeJBbp
3GzUv/oltuaeoOvY82Kv
=pEyR
-----END PGP SIGNATURE-----

--KvB7u8NuoXBZIbZd--
