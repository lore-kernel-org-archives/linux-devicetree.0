From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] fdt: Allow stacked overlays phandle references
Date: Sat, 15 Jul 2017 17:39:39 +1000
Message-ID: <20170715073939.GJ17539@umbus.fritz.box>
References: <1499894659-25775-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1499894659-25775-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20170714102258.GE17539@umbus.fritz.box>
 <1500033397.19864.32.camel@hp800z>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jIYo0VRlfdMI9fLa"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1500033397.19864.32.camel@hp800z>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jIYo0VRlfdMI9fLa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 02:56:37PM +0300, Pantelis Antoniou wrote:
> Hi David,
>=20
> On Fri, 2017-07-14 at 20:22 +1000, David Gibson wrote:
> > On Thu, Jul 13, 2017 at 12:24:18AM +0300, Pantelis Antoniou wrote:
> > > This patch enables an overlay to refer to a previous overlay's
> > > labels by performing a merge of symbol information at application
> > > time.
> > >=20
> > > In a nutshell it allows an overlay to refer to a symbol that a previo=
us
> > > overlay has defined. It requires both the base and all the overlays
> > > to be compiled with the -@ command line switch so that symbol
> > > information is included.
> > >=20
> > > base.dts
> > > --------
> > >=20
> > > 	/dts-v1/;
> > > 	/ {
> > > 		foo: foonode {
> > > 			foo-property;
> > > 		};
> > > 	};
> > >=20
> > > 	$ dtc -@ -I dts -O dtb -o base.dtb base.dts
> > >=20
> > > bar.dts
> > > -------
> > >=20
> > > 	/dts-v1/;
> > > 	/plugin/;
> > > 	/ {
> > > 		fragment@1 {
> > > 			target =3D <&foo>;
> > > 			__overlay__ {
> > > 				overlay-1-property;
> > > 				bar: barnode {
> > > 					bar-property;
> > > 				};
> > > 			};
> > > 		};
> > > 	};
> > >=20
> > > 	$ dtc -@ -I dts -O dtb -o bar.dtb bar.dts
> > >=20
> > > baz.dts
> > > -------
> > >=20
> > > 	/dts-v1/;
> > > 	/plugin/;
> > > 	/ {
> > > 		fragment@1 {
> > > 			target =3D <&bar>;
> > > 			__overlay__ {
> > > 				overlay-2-property;
> > > 				baz: baznode {
> > > 					baz-property;
> > > 				};
> > > 			};
> > > 		};
> > > 	};
> > >=20
> > > 	$ dtc -@ -I dts -O dtb -o baz.dtb baz.dts
> > >=20
> > > Applying the overlays:
> > >=20
> > > 	$ fdtoverlay -i base.dtb -o target.dtb bar.dtb baz.dtb
> > >=20
> > > Dumping:
> > >=20
> > > 	$ fdtdump target.dtb
> > > 	/ {
> > >             foonode {
> > >                 overlay-1-property;
> > >                 foo-property;
> > >                 linux,phandle =3D <0x00000001>;
> > >                 phandle =3D <0x00000001>;
> > >                 barnode {
> > >                     overlay-2-property;
> > >                     phandle =3D <0x00000002>;
> > >                     linux,phandle =3D <0x00000002>;
> > >                     bar-property;
> > >                     baznode {
> > >                         phandle =3D <0x00000003>;
> > >                         linux,phandle =3D <0x00000003>;
> > >                         baz-property;
> > >                     };
> > >                 };
> > >             };
> > >             __symbols__ {
> > >                 baz =3D "/foonode/barnode/baznode";
> > >                 bar =3D "/foonode/barnode";
> > >                 foo =3D "/foonode";
> > >             };
> > > 	};
> > >=20
> > > Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  .gitignore           |   1 +
> > >  libfdt/fdt_overlay.c | 131 +++++++++++++++++++++++++++++++++++++++++=
+++++++++-
> > >  2 files changed, 131 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/.gitignore b/.gitignore
> > > index 545b899..f333c28 100644
> > > --- a/.gitignore
> > > +++ b/.gitignore
> > > @@ -15,3 +15,4 @@ lex.yy.c
> > >  /fdtput
> > >  /patches
> > >  /.pc
> > > +/fdtoverlay
> > > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > > index ceb9687..fb17ef2 100644
> > > --- a/libfdt/fdt_overlay.c
> > > +++ b/libfdt/fdt_overlay.c
> > > @@ -590,7 +590,7 @@ static int overlay_apply_node(void *fdt, int targ=
et,
> > >   *
> > >   * overlay_merge() merges an overlay into its base device tree.
> > >   *
> > > - * This is the final step in the device tree overlay application
> > > + * This is the next to last step in the device tree overlay applicat=
ion
> > >   * process, when all the phandles have been adjusted and resolved and
> > >   * you just have to merge overlay into the base device tree.
> > >   *
> > > @@ -630,6 +630,131 @@ static int overlay_merge(void *fdt, void *fdto)
> > >  	return 0;
> > >  }
> > > =20
> > > +/**
> > > + * overlay_symbol_update - Update the symbols of base tree after a m=
erge
> > > + * @fdt: Base Device Tree blob
> > > + * @fdto: Device tree overlay blob
> > > + *
> > > + * overlay_symbol_update() updates the symbols of the base tree with=
 the
> > > + * symbols of the applied overlay
> > > + *
> > > + * This is the last step in the device tree overlay application
> > > + * process, allowing the reference of overlay symbols by subsequent
> > > + * overlay operations.
> > > + *
> > > + * returns:
> > > + *      0 on success
> > > + *      Negative error code on failure
> > > + */
> > > +static int overlay_symbol_update(void *fdt, void *fdto)
> > > +{
> > > +	int root_sym, ov_sym, prop, path_len, fragment, target;
> > > +	int len, frag_name_len, ret, rel_path_len;
> > > +	const char *s;
> > > +	const char *path;
> > > +	const char *name;
> > > +	const char *frag_name;
> > > +	const char *rel_path;
> > > +	char *buf;
> > > +	void *p;
> > > +
> > > +	root_sym =3D fdt_subnode_offset(fdt, 0, "__symbols__");
> > > +	ov_sym =3D fdt_subnode_offset(fdto, 0, "__symbols__");
> > > +
> > > +	/* if neither exist we can't update symbols, but that's OK */
> > > +	if (root_sym < 0 || ov_sym < 0)
> > > +		return 0;
> >=20
> > This isn't correct.  If ov_sym isn't there, then indeed there is
> > nothing to do, but if root_sym is not there, you should create it.
> >=20
>=20
> OK, although in practice there is almost no chance that a valid tree
> blob will contain no symbols.

Sure, but it's pretty easy to get right, even for that rare case.

> > > +
> > > +	/* iterate over each overlay symbol */
> > > +	fdt_for_each_property_offset(prop, fdto, ov_sym) {
> > > +
> >=20
> > Stray blank line.
> >=20
> > > +		path =3D fdt_getprop_by_offset(fdto, prop, &name, &path_len);
> > > +		if (!path)
> > > +			return path_len;
> > > +
> > > +		/* skip autogenerated properties */
> >=20
> > Comment isn't correct.  *Everything* in __symbols__ will typically be
> > autogenerated.  'name' probably is a special case, but I'm a bit
> > surprised it's there anyway, I though we only generated that for
> > really old dtb versions.
>=20
> The comment is valid; there are auto generated properties and name is
> one of them. Overlays should work even on really old dtb versions.

No, it's really not.  Usually *all* the properites in this node will
be autogenerated, and you're certainly not skipping them all.

And no, overlays really don't need to work with dtbs *that* old.  In
dtc, "name" properties are only generated for v3 and earlier dtbs.  v3
was obsolete for years before overlays were invented.  In fact v3 was
obsolete even before libfdt was created - libfdt won't work with them
at all (see FDT_FIRST_SUPPORTED_VERSION).

It's possible some other tool is adding "name" properties, but in that
case we should reference that tool as the reason, not make a comment
which is both vague and factually inaccurate.

>=20
> > > +		if (!strcmp(name, "name"))
> > > +			continue;
> > > +
> > > +		/* format: /<fragment-name>/__overlay__/<relative-subnode-path> */
> > > +
> > > +		if (*path !=3D '/')
> > > +			return -FDT_ERR_BADVALUE;
> > > +
> > > +		/* get fragment name first */
> > > +		s =3D strchr(path + 1, '/');
> > > +		if (!s)
> > > +			return -FDT_ERR_BADVALUE;
> > > +
> > > +		frag_name =3D path + 1;
> > > +		frag_name_len =3D s - path - 1;
> > > +
> > > +		/* verify format */
> > > +		len =3D strlen("/__overlay__/");
> > > +		if (strncmp(s, "/__overlay__/", len))
> > > +			return -FDT_ERR_NOTFOUND;
> >=20
> > This isn't correct, you're assuming the property is nul terminated
> > (which it should be, but you can't count on).  Instead you should
> > compare path_len versus the length of /__overlay__/, then you can just
> > memcmp() to see if the right thing is there.
> >=20
>=20
> OK, but could only happen on really badly formatted (even maliciously
> so) properties.

Failing gracefully on corrupted or maliciously constructed blobs is a
design goal for libfdt.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jIYo0VRlfdMI9fLa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAllpxrkACgkQbDjKyiDZ
s5I/Kw/7BKy0HBOjz5J0SuxoMjJuFi/PI+FZEQNacuyCEHylJWAQnXYH1JKvYsL2
FWbMnMw+bee6iUjGwdWoglL1GsAxbPCi2fn+LrWzUUmrfFhw54PwvaADkfuhA6IR
pKx5h2sqiJxKe2uCFHyjyQnJOFOhyyohj+upXEIFag3d3YPOyZGEYNTuwGOtR7f9
ErHeWKfyWyV5AsAbX+B7YESmQk6km1bdE8OjomR1kAMHRj0BDBHgCAorQsQLkmTp
9Ao6eTm25hB5+caZ8ZjRAoNG49ilMSZDdLFsNhlmFLnAzoFB4qLA5ycyroSgmsEf
I9Q+8sU8+zTgJNAiXLVevcXyQcU7TcNBSaO9NbVM+IUcTKizL4n0wUToTUrBibmk
BzrK4OPvgFtg1oZqAX3qr8zowu6Zz+57RqTEc8giP4LracSN6LZnfuzlLrgh3kfm
JY/tIGLVq6F9PXG1Qu/Hyno+J5M+PFtJOxV5T3BFv6gZtg0q7UneLUvwZXFSXkOE
Zb11A0/Kj8nph31MGB4OTtSYWlaGkDR/9lhYswSr9bLE9yQ+X+on40lKMpnztPj5
074DhrHK8s6V7iI3PQRh6gVPbYhaU92KBLo15h/PGHVQld6GrTvop0bg4v5KYGVg
5mvhF+aRtBqqC/BxRptVx0Y6V8D2IliC/sOv6fL3vQLGhmn4JiQ=
=eV4r
-----END PGP SIGNATURE-----

--jIYo0VRlfdMI9fLa--
