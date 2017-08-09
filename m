From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdt: Allow stacked overlays phandle references
Date: Wed, 9 Aug 2017 17:29:38 +1000
Message-ID: <20170809072938.GO13670@umbus.fritz.box>
References: <1502108769-11203-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jx/LfW4V5TfZLeq7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1502108769-11203-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jx/LfW4V5TfZLeq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 07, 2017 at 03:26:09PM +0300, Pantelis Antoniou wrote:
> This patch enables an overlay to refer to a previous overlay's
> labels by performing a merge of symbol information at application
> time.
>=20
> In a nutshell it allows an overlay to refer to a symbol that a previous
> overlay has defined. It requires both the base and all the overlays
> to be compiled with the -@ command line switch so that symbol
> information is included.

Applied, thanks.

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
>  libfdt/fdt_overlay.c | 228 +++++++++++++++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 206 insertions(+), 22 deletions(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index ceb9687..bd81241 100644
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
> @@ -630,6 +641,175 @@ static int overlay_merge(void *fdt, void *fdto)
>  	return 0;
>  }
> =20
> +static int get_path_len(const void *fdt, int nodeoffset)
> +{
> +	int len =3D 0, namelen;
> +	const char *name;
> +
> +	FDT_CHECK_HEADER(fdt);
> +
> +	for (;;) {
> +		name =3D fdt_get_name(fdt, nodeoffset, &namelen);
> +		if (!name)
> +			return namelen;
> +
> +		/* root? we're done */
> +		if (namelen =3D=3D 0)
> +			break;
> +
> +		nodeoffset =3D fdt_parent_offset(fdt, nodeoffset);
> +		if (nodeoffset < 0)
> +			return nodeoffset;
> +		len +=3D namelen + 1;
> +	}
> +
> +	/* in case of root pretend it's "/" */
> +	if (len =3D=3D 0)
> +		len++;
> +	return len;
> +}
> +
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
> +	const char *s, *e;
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
> +	if (root_sym =3D=3D -FDT_ERR_NOTFOUND)
> +		root_sym =3D fdt_add_subnode(fdt, 0, "__symbols__");
> +
> +	/* any error is fatal now */
> +	if (root_sym < 0)
> +		return root_sym;
> +
> +	/* iterate over each overlay symbol */
> +	fdt_for_each_property_offset(prop, fdto, ov_sym) {
> +		path =3D fdt_getprop_by_offset(fdto, prop, &name, &path_len);
> +		if (!path)
> +			return path_len;
> +
> +		/* verify it's a string property (terminated by a single \0) */
> +		if (path_len < 1 || memchr(path, '\0', path_len) !=3D &path[path_len -=
 1])
> +			return -FDT_ERR_BADVALUE;
> +
> +		/* keep end marker to avoid strlen() */
> +		e =3D path + path_len;
> +
> +		/* format: /<fragment-name>/__overlay__/<relative-subnode-path> */
> +
> +		if (*path !=3D '/')
> +			return -FDT_ERR_BADVALUE;
> +
> +		/* get fragment name first */
> +		s =3D strchr(path + 1, '/');
> +		if (!s)
> +			return -FDT_ERR_BADOVERLAY;
> +
> +		frag_name =3D path + 1;
> +		frag_name_len =3D s - path - 1;
> +
> +		/* verify format; safe since "s" lies in \0 terminated prop */
> +		len =3D sizeof("/__overlay__/") - 1;
> +		if ((e - s) < len || memcmp(s, "/__overlay__/", len))
> +			return -FDT_ERR_BADOVERLAY;
> +
> +		rel_path =3D s + len;
> +		rel_path_len =3D e - rel_path;
> +
> +		/* find the fragment index in which the symbol lies */
> +		ret =3D fdt_subnode_offset_namelen(fdto, 0, frag_name,
> +					       frag_name_len);
> +		/* not found? */
> +		if (ret < 0)
> +			return -FDT_ERR_BADOVERLAY;
> +		fragment =3D ret;
> +
> +		/* an __overlay__ subnode must exist */
> +		ret =3D fdt_subnode_offset(fdto, fragment, "__overlay__");
> +		if (ret < 0)
> +			return -FDT_ERR_BADOVERLAY;
> +
> +		/* get the target of the fragment */
> +		ret =3D overlay_get_target(fdt, fdto, fragment, &target_path);
> +		if (ret < 0)
> +			return ret;
> +		target =3D ret;
> +
> +		/* if we have a target path use */
> +		if (!target_path) {
> +			ret =3D get_path_len(fdt, target);
> +			if (ret < 0)
> +				return ret;
> +			len =3D ret;
> +		} else {
> +			len =3D strlen(target_path);
> +		}
> +
> +		ret =3D fdt_setprop_placeholder(fdt, root_sym, name,
> +				len + (len > 1) + rel_path_len + 1, &p);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (!target_path) {
> +			/* again in case setprop_placeholder changed it */
> +			ret =3D overlay_get_target(fdt, fdto, fragment, &target_path);
> +			if (ret < 0)
> +				return ret;
> +			target =3D ret;
> +		}
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
> @@ -654,6 +834,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
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

--jx/LfW4V5TfZLeq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmKueAACgkQbDjKyiDZ
s5LnuQ/+JBo5kY9iyU95ZB+XrLxJZ4DpD5rICX37JaGXxOyJJcXK/JitHA4daLKD
LDP7HFJxoV0zHgjtXjqht+3+0zr0mdb2OPs9H1tr+rbhRzsXLwWvzGObpQMLTQGQ
csCUPk/cAfGHBD7UPhHtMGKKQqvl1vfMwwmdIyuVAUAwm3UwXUYxkJra0QdjhLaS
Xk3msp26RgK9kB0mwrzPxQRMssE7hVVhC3AVbTQLwwGhb7l9gCM9mIvwGJJzxtrD
SSbx9lgJeYMYw+6Jm+6myxerUJEoaR4N6QkMFmpjAyKd3tO4rsU1J+crLgF4mmZv
2Ikn1tAIhzQsDeJ+i0XrcA2yYkud0cXX3xUn+XRHnny+YVD4Cd25ftmrkpSFxKBc
NZp96BNPMJas7xSM+9e+4IJlHZHEgtzp2kdLwvQghmxWACnwliJ+D3aVmJtXjekC
15VMKcX2Bkm2GyrKr3fQgU8AaDtsFY7E455l2V5DSSapuPCWZ9pG+/lbIHkPqnZQ
8pKDirCRQUf8vXpgA/0eBAufCOS0eJ+vPJNaAcCK4Kirtrhf0lZVg/WKBsaMCMMh
dAH9/scCeovrRNLdqUqlK3XaPY5OeFPBPYnKpU+yDTZNaqSDKxbz0c3YLB0SBVqU
+J9RZUE2K9K9jU4VV2lVKe+38FzG12Q0EEXMNkiv4Cc18wDUIpA=
=yrTE
-----END PGP SIGNATURE-----

--jx/LfW4V5TfZLeq7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
