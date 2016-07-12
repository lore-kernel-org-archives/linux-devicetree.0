From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/6] libfdt: Add a subnodes iterator macro
Date: Tue, 12 Jul 2016 11:52:30 +1000
Message-ID: <20160712015230.GN16355@voom.fritz.box>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-2-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O27Gs9jTTFWz3gAR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160711195623.12840-2-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--O27Gs9jTTFWz3gAR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 09:56:18PM +0200, Maxime Ripard wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The fdt_for_each_subnode() iterator macro provided by this patch can be
> used to iterate over a device tree node's subnodes. At each iteration a
> loop variable will be set to the next subnode.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Code looks ok, but there are some nits in the comments.

> ---
>  libfdt/libfdt.h         | 25 +++++++++++++++++++++++++
>  tests/subnode_iterate.c |  8 ++------
>  2 files changed, 27 insertions(+), 6 deletions(-)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 36222fd4a6f4..0cf46872b54e 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -168,6 +168,31 @@ int fdt_first_subnode(const void *fdt, int offset);
>   */
>  int fdt_next_subnode(const void *fdt, int offset);
> =20
> +/**
> + * fdt_for_each_subnode - iterate over all subnodes of a parent

Parameter descriptions should go here.

> + *
> + * This is actually a wrapper around a for loop and would be used like s=
o:
> + *
> + *	fdt_for_each_subnode(fdt, node, parent) {

Parameter order hasn't been updated for code revisions.

> + *		...
> + *		use node
> + *		...
> + *	}

One gotcha with this is what happens if there's an error during the
iteration.  I suggest adding something like:
	if ((node < 0) && (node !=3D -FDT_ERR_NOTFOUND)) {
		/* error handling */
	}

to the example, to remind users that they should check for this.

> + *
> + * Note that this is implemented as a macro and node is used as iterator=
 in

s/node/@node/ - makes it stand out as a parameter.

> + * the loop. It should therefore be a locally allocated variable. The pa=
rent
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Remove for brevity.

> + * variable on the other hand is never modified, so it can be constant or
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Remove for brevity.

> + * even a literal.
> + *
> + * @node:	child node (int)
> + * @fdt:	FDT blob (const void *)
> + * @parent:	parent node (int)
> + */
> +#define fdt_for_each_subnode(node, fdt, parent)		\
> +	for (node =3D fdt_first_subnode(fdt, parent);	\
> +	     node >=3D 0;					\
> +	     node =3D fdt_next_subnode(fdt, node))
> +
>  /**********************************************************************/
>  /* General functions                                                  */
>  /**********************************************************************/
> diff --git a/tests/subnode_iterate.c b/tests/subnode_iterate.c
> index b9f379d5963c..0fb5c901ebd7 100644
> --- a/tests/subnode_iterate.c
> +++ b/tests/subnode_iterate.c
> @@ -48,9 +48,7 @@ static void test_node(void *fdt, int parent_offset)
>  	subnodes =3D cpu_to_fdt32(*prop);
> =20
>  	count =3D 0;
> -	for (offset =3D fdt_first_subnode(fdt, parent_offset);
> -	     offset >=3D 0;
> -	     offset =3D fdt_next_subnode(fdt, offset))
> +	fdt_for_each_subnode(offset, fdt, parent_offset)
>  		count++;
> =20
>  	if (count !=3D subnodes) {
> @@ -65,9 +63,7 @@ static void check_fdt_next_subnode(void *fdt)
>  	int offset;
>  	int count =3D 0;
> =20
> -	for (offset =3D fdt_first_subnode(fdt, 0);
> -	     offset >=3D 0;
> -	     offset =3D fdt_next_subnode(fdt, offset)) {
> +	fdt_for_each_subnode(offset, fdt, 0) {
>  		test_node(fdt, offset);
>  		count++;
>  	}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--O27Gs9jTTFWz3gAR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhE1eAAoJEGw4ysog2bOSUyoP/2n9LZ4KEduKODQAPLtkpnFP
QiPKOevkHm09iomCvgFlAzg5jt4ISO0HaK6Cqh7XaXH+ieXLjicnrANlalTmFY3g
hegrykA1+5IBhm5U1jlOONQE/DCdS7bf1/otpXYdiUteNDj8/3lr8fbsML53sniW
+voVnCOmtQhTxERzLOmn8GyA2bLhj47/u/O+ffJsSb7W60tfEWzOSsJ1LfneoihZ
T8/zxFyCdKffTC3u0vRtvlLw0EWhvjE4CG1NWYvUP+lWTmYahXK98ltmG1Y3p7Eo
Up+CsWD6JbG08sNCSx8otAp6Khq69C69JsVxL9ce2zr5HFQImbkGkPrPRv+WVOf9
XmraoQ5czgJKJQhYJ36fLIXFIwp0cWzUC5z2DG+lCyGF+Q4ktLdGLcivH8i4jiLe
/9mJuAvQQEAkxwD4ya+dnXyH/GWGKvRdWuZuCBIJi3Cnwnp/sU2/91oYErgMl1fu
7QLFkXc0VoRttD3GYFLpJpFcKocxup50v4B4cMDnTqvmK000EhTH4d6sy5mhoMqu
GPWaE5DjkC8uWk9gCS0GaZvnRe4dcdhpKXHQN07NxvgplO9r9KDiKMgm+HAWT/ZM
+uXeIV6kFpa488rO43TnASBoRaDnlP60zTCwwTjFHFTjEmDU/elV4zjPz9gQzBFF
y0h4UmD8q/Sh7ddelWZn
=fviD
-----END PGP SIGNATURE-----

--O27Gs9jTTFWz3gAR--
