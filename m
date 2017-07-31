From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 1/2] fdt: Allow stacked overlays phandle references
Date: Mon, 31 Jul 2017 23:32:18 +1000
Message-ID: <20170731133218.GK2652@umbus.fritz.box>
References: <1501003476-2480-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1501003476-2480-2-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HSQ3hISbU3Um6hch"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501003476-2480-2-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--HSQ3hISbU3Um6hch
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2017 at 08:24:35PM +0300, Pantelis Antoniou wrote:
> This patch enables an overlay to refer to a previous overlay's
> labels by performing a merge of symbol information at application
> time.
>=20
> In a nutshell it allows an overlay to refer to a symbol that a previous
> overlay has defined. It requires both the base and all the overlays
> to be compiled with the -@ command line switch so that symbol
> information is included.

Sorry I've taken so long to review this spin.  There's a few nits
left, but it's very close to ready.

>=20
> base.dts
> --------
>=20
> 	/dts-v1/;
> 	/ {
> 		foo: foonode {
> 			foo-property;
> 		};
> 	};
>=20
> 	$ dtc -@ -I dts -O dtb -o base.dtb base.dts
>=20
> bar.dts
> -------
>=20
> 	/dts-v1/;
> 	/plugin/;
> 	/ {
> 		fragment@1 {
> 			target =3D <&foo>;
> 			__overlay__ {
> 				overlay-1-property;
> 				bar: barnode {
> 					bar-property;
> 				};
> 			};
> 		};
> 	};
>=20
> 	$ dtc -@ -I dts -O dtb -o bar.dtb bar.dts
>=20
> baz.dts
> -------
>=20
> 	/dts-v1/;
> 	/plugin/;
> 	/ {
> 		fragment@1 {
> 			target =3D <&bar>;
> 			__overlay__ {
> 				overlay-2-property;
> 				baz: baznode {
> 					baz-property;
> 				};
> 			};
> 		};
> 	};
>=20
> 	$ dtc -@ -I dts -O dtb -o baz.dtb baz.dts
>=20
> Applying the overlays:
>=20
> 	$ fdtoverlay -i base.dtb -o target.dtb bar.dtb baz.dtb
>=20
> Dumping:
>=20
> 	$ fdtdump target.dtb
> 	/ {
>             foonode {
>                 overlay-1-property;
>                 foo-property;
>                 linux,phandle =3D <0x00000001>;
>                 phandle =3D <0x00000001>;
>                 barnode {
>                     overlay-2-property;
>                     phandle =3D <0x00000002>;
>                     linux,phandle =3D <0x00000002>;
>                     bar-property;
>                     baznode {
>                         phandle =3D <0x00000003>;
>                         linux,phandle =3D <0x00000003>;
>                         baz-property;
>                     };
>                 };
>             };
>             __symbols__ {
>                 baz =3D "/foonode/barnode/baznode";
>                 bar =3D "/foonode/barnode";
>                 foo =3D "/foonode";
>             };
> 	};
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  libfdt/fdt_overlay.c | 197 +++++++++++++++++++++++++++++++++++++++++++++=
------
>  1 file changed, 175 insertions(+), 22 deletions(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index ceb9687..e6fe058 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -39,6 +39,7 @@ static uint32_t overlay_get_target_phandle(const void *=
fdto, int fragment)
>   * @fdt: Base device tree blob
>   * @fdto: Device tree overlay blob
>   * @fragment: node offset of the fragment in the overlay
> + * @pathp: pointer which receives the path of the target (or NULL)
>   *
>   * overlay_get_target() retrieves the target offset in the base
>   * device tree of a fragment, no matter how the actual targetting is
> @@ -49,37 +50,47 @@ static uint32_t overlay_get_target_phandle(const void=
 *fdto, int fragment)
>   *      Negative error code on error
>   */
>  static int overlay_get_target(const void *fdt, const void *fdto,
> -			      int fragment)
> +			      int fragment, char const **pathp)
>  {
>  	uint32_t phandle;
> -	const char *path;
> -	int path_len;
> +	const char *path =3D NULL;
> +	int path_len =3D 0, ret;
> =20
>  	/* Try first to do a phandle based lookup */
>  	phandle =3D overlay_get_target_phandle(fdto, fragment);
>  	if (phandle =3D=3D (uint32_t)-1)
>  		return -FDT_ERR_BADPHANDLE;
> =20
> -	if (phandle)
> -		return fdt_node_offset_by_phandle(fdt, phandle);
> +	/* no phandle, try path */
> +	if (!phandle) {
> +		/* And then a path based lookup */
> +		path =3D fdt_getprop(fdto, fragment, "target-path", &path_len);
> +		if (path)
> +			ret =3D fdt_path_offset(fdt, path);
> +		else
> +			ret =3D path_len;
> +	} else
> +		ret =3D fdt_node_offset_by_phandle(fdt, phandle);
> =20
> -	/* And then a path based lookup */
> -	path =3D fdt_getprop(fdto, fragment, "target-path", &path_len);
> -	if (!path) {
> -		/*
> -		 * If we haven't found either a target or a
> -		 * target-path property in a node that contains a
> -		 * __overlay__ subnode (we wouldn't be called
> -		 * otherwise), consider it a improperly written
> -		 * overlay
> -		 */
> -		if (path_len =3D=3D -FDT_ERR_NOTFOUND)
> -			return -FDT_ERR_BADOVERLAY;
> +	/*
> +	* If we haven't found either a target or a
> +	* target-path property in a node that contains a
> +	* __overlay__ subnode (we wouldn't be called
> +	* otherwise), consider it a improperly written
> +	* overlay
> +	*/
> +	if (ret < 0 && path_len =3D=3D -FDT_ERR_NOTFOUND)
> +		ret =3D -FDT_ERR_BADOVERLAY;
> +
> +	/* return on error */
> +	if (ret < 0)
> +		return ret;
> =20
> -		return path_len;
> -	}
> +	/* return pointer to path (if available) */
> +	if (pathp)
> +		*pathp =3D path ? path : NULL;
> =20
> -	return fdt_path_offset(fdt, path);
> +	return ret;
>  }
> =20
>  /**
> @@ -590,7 +601,7 @@ static int overlay_apply_node(void *fdt, int target,
>   *
>   * overlay_merge() merges an overlay into its base device tree.
>   *
> - * This is the final step in the device tree overlay application
> + * This is the next to last step in the device tree overlay application
>   * process, when all the phandles have been adjusted and resolved and
>   * you just have to merge overlay into the base device tree.
>   *
> @@ -618,7 +629,7 @@ static int overlay_merge(void *fdt, void *fdto)
>  		if (overlay < 0)
>  			return overlay;
> =20
> -		target =3D overlay_get_target(fdt, fdto, fragment);
> +		target =3D overlay_get_target(fdt, fdto, fragment, NULL);
>  		if (target < 0)
>  			return target;
> =20
> @@ -630,6 +641,144 @@ static int overlay_merge(void *fdt, void *fdto)
>  	return 0;
>  }
> =20
> +/**
> + * overlay_symbol_update - Update the symbols of base tree after a merge
> + * @fdt: Base Device Tree blob
> + * @fdto: Device tree overlay blob
> + *
> + * overlay_symbol_update() updates the symbols of the base tree with the
> + * symbols of the applied overlay
> + *
> + * This is the last step in the device tree overlay application
> + * process, allowing the reference of overlay symbols by subsequent
> + * overlay operations.
> + *
> + * returns:
> + *      0 on success
> + *      Negative error code on failure
> + */
> +static int overlay_symbol_update(void *fdt, void *fdto)
> +{
> +	int root_sym, ov_sym, prop, path_len, fragment, target;
> +	int len, frag_name_len, ret, rel_path_len;
> +	const char *s;
> +	const char *path;
> +	const char *name;
> +	const char *frag_name;
> +	const char *rel_path;
> +	const char *target_path;
> +	char *buf;
> +	void *p;
> +
> +	ov_sym =3D fdt_subnode_offset(fdto, 0, "__symbols__");
> +
> +	/* if no overlay symbols exist no problem */
> +	if (ov_sym < 0)
> +		return 0;
> +
> +	root_sym =3D fdt_subnode_offset(fdt, 0, "__symbols__");
> +
> +	/* it no root symbols exist we should create them */
> +	if (root_sym < 0) {
> +		root_sym =3D fdt_add_subnode(fdt, 0, "__symbols__");
> +		if (root_sym < 0)
> +			return root_sym;
> +	}
> +
> +	/* iterate over each overlay symbol */
> +	fdt_for_each_property_offset(prop, fdto, ov_sym) {
> +		path =3D fdt_getprop_by_offset(fdto, prop, &name, &path_len);
> +		if (!path)
> +			return path_len;
> +
> +		/* verify it's a string property (terminated with \0) */
> +		if (path_len < 1 || path[path_len - 1] !=3D '\0')
> +			return -FDT_ERR_BADVALUE;

That's probably enough to be safe, but checking that memchr(path,
'\0', prop_len) points at the last byte of the property would be more
complete.

> +
> +		/* format: /<fragment-name>/__overlay__/<relative-subnode-path> */
> +
> +		if (*path !=3D '/')
> +			return -FDT_ERR_BADVALUE;
> +
> +		/* verify that no stray \0 exist in the property */
> +		if (strlen(path) !=3D path_len - 1)
> +			return -FDT_ERR_BADVALUE;
> +
> +		/* get fragment name first */
> +		s =3D strchr(path + 1, '/');
> +		if (!s)
> +			return -FDT_ERR_BADVALUE;

BADOVERLAY for these two, I think.  These values are part of the
overlay's structural information, rather than a value for direct
client consumption.

> +
> +		frag_name =3D path + 1;
> +		frag_name_len =3D s - path - 1;
> +
> +		/* verify format; safe since "s" lies in \0 terminated prop */
> +		len =3D strlen("/__overlay__/");
> +		if (strncmp(s, "/__overlay__/", len))

memcmp is simpler here.

> +			return -FDT_ERR_NOTFOUND;
> +
> +		rel_path =3D s + len;
> +		rel_path_len =3D strlen(rel_path);
> +
> +		/* find the fragment index in which the symbol lies */
> +		ret =3D fdt_subnode_offset_namelen(fdto, 0, frag_name,
> +					       frag_name_len);
> +		/* not found? */
> +		if (ret < 0)
> +			return ret;
> +		fragment =3D ret;
> +
> +		/* an __overlay__ subnode must exist */
> +		ret =3D fdt_subnode_offset(fdto, fragment, "__overlay__");
> +		if (ret < 0)
> +			return ret;
> +
> +		/* get the target of the fragment */
> +		ret =3D overlay_get_target(fdt, fdto, fragment, &target_path);
> +		if (ret < 0)
> +			return ret;
> +		target =3D ret;
> +
> +		/* if we have a target path use */
> +		if (!target_path) {
> +			ret =3D fdt_get_path_len(fdt, target);

Given the mess of trying to resolve the path for a phandle target,
using this is reasonable.  However, I think it should be a local
function, not exported to discourage use of a really inefficient
approach.

> +			if (ret < 0)
> +				return ret;
> +			len =3D ret;
> +		} else
> +			len =3D strlen(target_path);
> +
> +		ret =3D fdt_setprop_placeholder(fdt, root_sym, name,
> +				len + (len > 1) + rel_path_len + 1, &p);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* again in case setprop_placeholder changed it */
> +		ret =3D overlay_get_target(fdt, fdto, fragment, &target_path);
> +		if (ret < 0)
> +			return ret;
> +		target =3D ret;
> +
> +		buf =3D p;
> +		if (len > 1) { /* target is not root */
> +			if (!target_path) {
> +				ret =3D fdt_get_path(fdt, target, buf, len + 1);
> +				if (ret < 0)
> +					return ret;
> +			} else
> +				memcpy(buf, target_path, len + 1);
> +
> +		} else
> +			len--;
> +
> +		buf[len] =3D '/';
> +		memcpy(buf + len + 1, rel_path, rel_path_len);
> +		buf[len + 1 + rel_path_len] =3D '\0';
> +	}
> +
> +	return 0;
> +}
> +
>  int fdt_overlay_apply(void *fdt, void *fdto)
>  {
>  	uint32_t delta =3D fdt_get_max_phandle(fdt);
> @@ -654,6 +803,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
>  	if (ret)
>  		goto err;
> =20
> +	ret =3D overlay_symbol_update(fdt, fdto);
> +	if (ret)
> +		goto err;
> +
>  	/*
>  	 * The overlay has been damaged, erase its magic.
>  	 */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HSQ3hISbU3Um6hch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll/MV8ACgkQbDjKyiDZ
s5Lo5A//VgwNU5T2d8kPqcM4mqJkOtTHUkXimKjW7OS+5FrwdlfMcY/Mj6nPGpKs
0O1WyMgtZDVYDJaLjUTqkNdiMvJGixOVouNnflL+TElPyhxIakNhiWEWCJ0EIHhJ
UsY8uKApp6ah69lJbk5vofbsGYskr66tFYTnMz+FQmYAp7358ir3vi+/httsW4Q3
yfDnzk5kgeLTWcsOKCZfpufZpWEU39lNP61Y2OWz8Ej66WGznmruT7RnbXdPGK+1
vXclPfs8qLPUFtkZl/8/dflboLap2gzZxOfKMJLXkLC2DT7g5hhh0487FmQK6E4W
Q4JRoKOZLh+jZOat1xjZDoeH8IcWxFKuPFcg0a+wcALBpzweSkGdFKlfBu/osBq1
xikhQmOr8l30Ijw/C0kMmr1bjJX5cOajGZJjQ8Gm+ckZtC+MHDKZFWlU6fzL4PSU
AGgoF+FpWi9tmflPKWKoVx23PZZxXDn87QObPcFPnyYd6OhpUUSomC9q3Tk0YcPV
6GCXHHsduv0HorGUbZuyO/2dfhliPVnXyJBG/h3c7/3a4r75MfffdzrRgAPO9Sg1
ZS+MzHiYN6cfzJ6Lq7PmqDs9FUgkaJuBp1fpTmSocddwtCD+CEtCCcOg+5DvvPYE
ljXCTNQyMIiRcRJYK7WOJKAkjztiez38FG+WyqFnTPo6hfm/Q1o=
=tcW0
-----END PGP SIGNATURE-----

--HSQ3hISbU3Um6hch--
