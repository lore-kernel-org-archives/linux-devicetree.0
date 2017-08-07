From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdt: Allow stacked overlays phandle references
Date: Mon, 7 Aug 2017 15:01:57 +1000
Message-ID: <20170807050157.GB3940@umbus.fritz.box>
References: <1501520996-3366-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501520996-3366-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2017 at 08:09:56PM +0300, Pantelis Antoniou wrote:
> This patch enables an overlay to refer to a previous overlay's
> labels by performing a merge of symbol information at application
> time.
>=20
> In a nutshell it allows an overlay to refer to a symbol that a previous
> overlay has defined. It requires both the base and all the overlays
> to be compiled with the -@ command line switch so that symbol
> information is included.
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
>  libfdt/fdt_overlay.c | 225 +++++++++++++++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 203 insertions(+), 22 deletions(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index ceb9687..a4f81f0 100644
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
> @@ -630,6 +641,172 @@ static int overlay_merge(void *fdt, void *fdto)
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

Should only do this for root_sym =3D=3D NOTFOUND, not for other error
conditions.


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
> +		/* verify it's a string property (terminated by a single \0) */
> +		if (path_len < 1 || memchr(path, '\0', path_len) !=3D &path[path_len -=
 1])
> +			return -FDT_ERR_BADVALUE;
> +
> +		/* format: /<fragment-name>/__overlay__/<relative-subnode-path> */
> +
> +		if (*path !=3D '/')
> +			return -FDT_ERR_BADVALUE;
> +
> +		/* verify that no stray \0 exist in the property */
> +		if (strlen(path) !=3D path_len - 1)
> +			return -FDT_ERR_BADOVERLAY;

Redundant with the revised string check above.

> +		/* get fragment name first */
> +		s =3D strchr(path + 1, '/');
> +		if (!s)
> +			return -FDT_ERR_BADOVERLAY;
> +
> +		frag_name =3D path + 1;
> +		frag_name_len =3D s - path - 1;
> +
> +		/* verify format; safe since "s" lies in \0 terminated prop */
> +		len =3D strlen("/__overlay__/");
> +		if (strlen(s) < len || memcmp(s, "/__overlay__/", len))

You can derive strlen(s) from path_len and frag_name_len, to avoid the
call to strlen().

> +			return -FDT_ERR_NOTFOUND;

Should be BADOVERLAY.

> +
> +		rel_path =3D s + len;
> +		rel_path_len =3D strlen(rel_path);

Again, you can avoid this strlen().

> +
> +		/* find the fragment index in which the symbol lies */
> +		ret =3D fdt_subnode_offset_namelen(fdto, 0, frag_name,
> +					       frag_name_len);
> +		/* not found? */
> +		if (ret < 0)
> +			return ret;

NOTFOUND should become BADOVERLAY here.

> +		fragment =3D ret;
> +
> +		/* an __overlay__ subnode must exist */
> +		ret =3D fdt_subnode_offset(fdto, fragment, "__overlay__");
> +		if (ret < 0)
> +			return ret;

And here.

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
> +		} else
> +			len =3D strlen(target_path);

Braces around both if/else branches, if they're around either, please.

> +
> +		ret =3D fdt_setprop_placeholder(fdt, root_sym, name,
> +				len + (len > 1) + rel_path_len + 1, &p);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* again in case setprop_placeholder changed it */
> +		ret =3D overlay_get_target(fdt, fdto, fragment, &target_path);

You only need to do this if !target_path - if you already have the
target_path, you don't actually need the offset of the target.

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
> @@ -654,6 +831,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
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

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmH9EIACgkQbDjKyiDZ
s5JXEBAA4riNKSIcUT69ORMlkglwJbzam4r2RPPkM7blvTsbqazIMkITe6K7F3mq
eiysQb7zjCD+p3rVbBHrjHkd6ofLZjxLmrxERO0Ew/bP0ciwLe8Ww1xSE+5uAViS
VfjRZmTfnVVGWqUDIoWTfG72Am5V6u2Ca/XTREVwchr64aivb+Yd20or/MgF8IZq
jIRAKZR2i58cG/F0UeRcteZcsrWYprgEoMKsrf3XaSbTVUtd/GfoWJXEKjxWvKT6
loy8MD+QEgUF8/pHQMXdbHmEGmu6t2e3RFQHT00J9gb+hNb0CD1WBdOuGC3O3IMd
IMkivEQJl+TQGur7W8O/DYUU631yxqHq8i4r72pdQWxw8HZl/oytt6vTahmi7/va
FwVoiiqs8DHIGSHNJTh1l3VF7Q7SQXJ06iN0RwHo0+jt8cbpFZRA2Ee7CzprBOkW
wTw/LH/LyURAprjsESOVdjFfujWZZvI2RHgts7XU+8GT+OYHNdaAgQU3hTv/lEul
dwgc0mNC5WoauwaOCzOB0f5sYUUYlWJM1IFZ3vdrsRE28NogX+QMRtG64r0vpgi2
doGytlghuSqRkva7x7qj5Apk9YxxcRVzfkRaOXUULZyAB1Cods40fIm/mlxwCM5Y
z9I2ekvd0sBiMOtr6H9bgmY7Gfq9HuEvlcv9TkPGdwwC0cV/5Tg=
=q3xq
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
