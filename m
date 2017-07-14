From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] fdt: Allow stacked overlays phandle references
Date: Fri, 14 Jul 2017 20:22:58 +1000
Message-ID: <20170714102258.GE17539@umbus.fritz.box>
References: <1499894659-25775-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1499894659-25775-2-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="47eKBCiAZYFK5l32"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1499894659-25775-2-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--47eKBCiAZYFK5l32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2017 at 12:24:18AM +0300, Pantelis Antoniou wrote:
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
>  .gitignore           |   1 +
>  libfdt/fdt_overlay.c | 131 +++++++++++++++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 131 insertions(+), 1 deletion(-)
>=20
> diff --git a/.gitignore b/.gitignore
> index 545b899..f333c28 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -15,3 +15,4 @@ lex.yy.c
>  /fdtput
>  /patches
>  /.pc
> +/fdtoverlay
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index ceb9687..fb17ef2 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -590,7 +590,7 @@ static int overlay_apply_node(void *fdt, int target,
>   *
>   * overlay_merge() merges an overlay into its base device tree.
>   *
> - * This is the final step in the device tree overlay application
> + * This is the next to last step in the device tree overlay application
>   * process, when all the phandles have been adjusted and resolved and
>   * you just have to merge overlay into the base device tree.
>   *
> @@ -630,6 +630,131 @@ static int overlay_merge(void *fdt, void *fdto)
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
> +	char *buf;
> +	void *p;
> +
> +	root_sym =3D fdt_subnode_offset(fdt, 0, "__symbols__");
> +	ov_sym =3D fdt_subnode_offset(fdto, 0, "__symbols__");
> +
> +	/* if neither exist we can't update symbols, but that's OK */
> +	if (root_sym < 0 || ov_sym < 0)
> +		return 0;

This isn't correct.  If ov_sym isn't there, then indeed there is
nothing to do, but if root_sym is not there, you should create it.

> +
> +	/* iterate over each overlay symbol */
> +	fdt_for_each_property_offset(prop, fdto, ov_sym) {
> +

Stray blank line.

> +		path =3D fdt_getprop_by_offset(fdto, prop, &name, &path_len);
> +		if (!path)
> +			return path_len;
> +
> +		/* skip autogenerated properties */

Comment isn't correct.  *Everything* in __symbols__ will typically be
autogenerated.  'name' probably is a special case, but I'm a bit
surprised it's there anyway, I though we only generated that for
really old dtb versions.

> +		if (!strcmp(name, "name"))
> +			continue;
> +
> +		/* format: /<fragment-name>/__overlay__/<relative-subnode-path> */
> +
> +		if (*path !=3D '/')
> +			return -FDT_ERR_BADVALUE;
> +
> +		/* get fragment name first */
> +		s =3D strchr(path + 1, '/');
> +		if (!s)
> +			return -FDT_ERR_BADVALUE;
> +
> +		frag_name =3D path + 1;
> +		frag_name_len =3D s - path - 1;
> +
> +		/* verify format */
> +		len =3D strlen("/__overlay__/");
> +		if (strncmp(s, "/__overlay__/", len))
> +			return -FDT_ERR_NOTFOUND;

This isn't correct, you're assuming the property is nul terminated
(which it should be, but you can't count on).  Instead you should
compare path_len versus the length of /__overlay__/, then you can just
memcmp() to see if the right thing is there.

> +
> +		rel_path =3D s + len;
> +		rel_path_len =3D strlen(rel_path);

Again, this should be determined from path_len, not using strlen.
That said, it might be worth doing a memchr() to make sure there
aren't stray \0s in the path.

> +
> +		/* find the fragment index in which the symbol lies */
> +		fdt_for_each_subnode(fragment, fdto, 0) {
> +
> +			s =3D fdt_get_name(fdto, fragment, &len);
> +			if (!s)
> +				continue;
> +
> +			/* name must match */
> +			if (len =3D=3D frag_name_len && !memcmp(s, frag_name, len))
> +				break;
> +		}
> +
> +		/* not found? */
> +		if (fragment < 0)
> +			return -FDT_ERR_NOTFOUND;

The entire loop above can be replaced with an
fdt_subnode_offset_namelen().

> +
> +		/* an __overlay__ subnode must exist */
> +		ret =3D fdt_subnode_offset(fdto, fragment, "__overlay__");
> +		if (ret < 0)
> +			return ret;

NOTFOUND is probably not the error code you want in this context.

> +
> +		/* get the target of the fragment */
> +		ret =3D overlay_get_target(fdt, fdto, fragment);
> +		if (ret < 0)
> +			return ret;

An error here should probably be translated to FDT_ERR_INTERNAL, since
we've already verified the targets of each fragment can be resolved
earlier in the application process.

> +		target =3D ret;
> +
> +		len =3D fdt_get_path_len(fdt, target);
> +
> +		ret =3D fdt_setprop_alloc(fdt, root_sym, name,
> +				len + (len > 1) + rel_path_len + 1, &p);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* again in case setprop_alloc changed it */
> +		ret =3D overlay_get_target(fdt, fdto, fragment);
> +		if (ret < 0)
> +			return ret;
> +		target =3D ret;
> +
> +		buf =3D p;
> +		if (len > 1) { /* target is not root */
> +			ret =3D fdt_get_path(fdt, target, buf, len + 1);
> +			if (ret < 0)
> +				return ret;
> +
> +		} else
> +			len--;
> +
> +		buf[len] =3D '/';
> +		memcpy(buf + len + 1, rel_path, rel_path_len);
> +		buf[len + 1 + rel_path_len] =3D '\0';

You know (or rather, you can and should verify) that the rel_path is
\0 terminated, so you can copy the \0 in the same memcpy() rather than
adding it extra.

> +	}
> +
> +	return 0;
> +}
> +
>  int fdt_overlay_apply(void *fdt, void *fdto)
>  {
>  	uint32_t delta =3D fdt_get_max_phandle(fdt);
> @@ -654,6 +779,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
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

--47eKBCiAZYFK5l32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAllom38ACgkQbDjKyiDZ
s5KgcBAA5mGF0EhopU5nJst29CYi/GGHVr2ictFDShcII4rlMD77iPqgwXyo9Ke3
jT5D0J5x57NNOIku91fd/q0g7gn0M+93Gr30myYuf7KeES7aq6hm/TKeztqooBkA
GiKzRjC197tBeUS15cFyWhIPGpBG6WEdfBEP3QydTLAZmxdWquJ4aiL3ckOVU0dv
1BtJAzYFhW29iA62OCNjKCWtvWacbmfvm0NzH6Tthmsvx0eMt1zshI6wHRuLVddN
Ynv8NOXzyqLbnelKtW7P4fY8uqAn1zVb2/fxSQolRgONvp5sTTQ3guSRsDbgdps3
lxJ7bJPJJpi0d90RUeMk/jnyAlmR5R9TTrkWDY3tWviQdRq1iEPbglv9q09bk/Tg
V+sGNdxOMxcF25s7ANFsbozNzehqDT8ghDcBpfDcUQWblXHNqOwVDsmRRuhpBqD5
FQXa2Ll4lvVlr26Sxy24NYGFNNrZMK4i4Camo1rJuVXzsPzKEl75wBtbt/Y7YAU9
b+9ytNCgqaOIxlb8hJAA9SwxWW4YWDFK+ruqHgEIuS5sVC5PWvGtC9cEZSBl/TTb
xfMPD9YQifSxqgmprfeXkRvGLADXbLptsihtURa5vk8jMR0ju+jSQDpFzgZnRn41
gKtCStWTJXuBD+h1Gu0A5bOOMCtaFUNZD4Zo77OTac0jsqgKLS0=
=5wfr
-----END PGP SIGNATURE-----

--47eKBCiAZYFK5l32--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
