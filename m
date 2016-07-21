From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 1/6] libfdt: Add a subnodes iterator macro
Date: Thu, 21 Jul 2016 11:59:35 +1000
Message-ID: <20160721015934.GB31439@voom.fritz.box>
References: <20160720142044.27527-1-maxime.ripard@free-electrons.com>
 <20160720142044.27527-2-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160720142044.27527-2-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2016 at 04:20:39PM +0200, Maxime Ripard wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The fdt_for_each_subnode() iterator macro provided by this patch can be
> used to iterate over a device tree node's subnodes. At each iteration a
> loop variable will be set to the next subnode.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Some nits in the comment..

> ---
>  libfdt/libfdt.h         | 27 +++++++++++++++++++++++++++
>  tests/subnode_iterate.c |  8 ++------
>  2 files changed, 29 insertions(+), 6 deletions(-)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 36222fd4a6f4..70ec39c7104c 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -168,6 +168,33 @@ int fdt_first_subnode(const void *fdt, int offset);
>   */
>  int fdt_next_subnode(const void *fdt, int offset);
> =20
> +/**
> + * fdt_for_each_subnode - iterate over all subnodes of a parent

Parameter descriptions generally go first.

> + *
> + * This is actually a wrapper around a for loop and would be used like s=
o:
> + *
> + *	fdt_for_each_subnode(node, fdt, parent) {
> + *		if ((node < 0) && (node !=3D -FDT_ERR_NOT_FOUND)) {
> + *			Error handling
> + *		}

This error handling needs to go *after* the for block.

> + *
> + *		Use node
> + *		...
> + *	}
> + *
> + * Note that this is implemented as a macro and @node is used as
> + * iterator in the loop. The parent variable be constant or even a
                                               ^ insert "may"

> + * literal.
> + *
> + * @node:	child node (int)

Probably worth noting it as (int, lvalue).

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

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXkCyGAAoJEGw4ysog2bOSiacP/3hZkIx7h5Ht7X4y8C6uCLYU
bBcOX8FeMYj1Wn7pC46OMKQp1R094QS6Nq71c3KxAqWjx8oR1JiaNU6/0o/HbqvJ
tqszUjJrQZYZEfu+l861mm4PePNFHxk676OFbz90U114Y0jB3QvLFYx+fTusDZ+S
GQhj7yTayU4JTsje60Cu/8XZnd02LYNPUEq7fz//gktMo9AfebHjadmbbrJgs8Ge
lYN1YGQkFFdCFqpN6WtTSa7FNjOLuRs90zEit6XufKnQvsLs/Qb2QAkINLUW6P/r
ojyi4bZSZglXuXYtkydT6NWT++XGA5CTnfwMxRj65d5Z0QeqQliNWhKX+tCR0fgg
Ya3D54PBf+Kfz4qrqC49v8Psm3bdD5jgkgIZBQVsLRctApr/jcrQKZiNDqz+kpI/
9TVH+/fNylIsNf405Fm+1Ud3/zfi6LbzIo+p3NTZOWi5PjfkVH6Z9x+RiBrR1NKQ
2tYIy92KXe+rrIzkqPUAhl5LNobSaHekkkkoJUo8nF3sfCpiUoGRWmahMCfrnG6A
SnXEnlN8Xp2Ks8W5MGHXcRfBJLp29Lb7FYA/WvsVFxti6lfBThZKUrVbzN9eP3vp
eWuB6tfXrWXgWUA3ucoZtKrRLkXa7OqJnJJ9fLWSy+ATOiKuib7vQV3oVOk5Yr7a
k8RkJo/FzBHcJIUmSheq
=21fk
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
