Return-Path: <SRS0=RPEA=OT=vger.kernel.org=devicetree-compiler-owner@kernel.org>
Date: Mon, 10 Dec 2018 16:49:28 +1100
From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: phandles using absolute paths in DT overlays
Message-ID: <20181210054928.GR4261@umbus.fritz.box>
References: <CAMuHMdUgYFkYrpnpOdrE5ce-pHSUqLPPs=gheitp5sAnu=srEQ@mail.gmail.com>
 <20181207013513.GV768@umbus.fritz.box>
 <CAMuHMdUdPKb6go3U46fJsWdfDrx057SPem-ZDi9wOJhfaeCENQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Idd68gPqKLz5+Ci0"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUdPKb6go3U46fJsWdfDrx057SPem-ZDi9wOJhfaeCENQ@mail.gmail.com>
Sender: devicetree-compiler-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


--Idd68gPqKLz5+Ci0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 07, 2018 at 09:19:24AM +0100, Geert Uytterhoeven wrote:
> Hi David,
>=20
> Thanks for your answer!
>=20
> On Fri, Dec 7, 2018 at 2:44 AM David Gibson <david@gibson.dropbear.id.au>=
 wrote:
> > On Thu, Dec 06, 2018 at 01:56:45PM +0100, Geert Uytterhoeven wrote:
> > > Some early revisions of SoCs may have hardware bugs that need to be
> > > fixed up in DT.  Currently we are handling this by including DTS files
> > > and fixing up nodes and properties, to create different DTB files for
> > > different SoC revisons (see arch/arm64/boot/dts/renesas/*es1*).
> > >
> > > As an alternative, I'm envisioning the use of DT overlays and the
> > > fdtoverlay tool, in the hope of simplifying the generation of DTBs for
> > > the various SoC/board combinations.
> > >
> > > Ideally, such DTBs would not contain symbols, to avoid inflating DTB
> > > size.  Hence if fixup overlays would not contain symbolic references,
> > > there would be no need for symbols.
> > >
> > > For anchors, the "&{/path/to/node@address}" syntax is working fine.
> > > For phandles, while documented on
> > > https://elinux.org/Device_Tree_Mysteries, and while working fine for =
the
> > > non-overlay case, dtc seems to have issues interpreting the DTB:
> > >
> > >     $ scripts/dtc/dtc -I dtb -O dts my.dtb  | less
> > >     <stdout>: ERROR (property_name_chars):
> > > /__fixups__:/path/to/node@deadbeef: Bad     character '/' in property
> > > name
> > >     ERROR: Input tree has errors, aborting (use -f to force output)
> > >
> > > With -f, the fixup generated seems to contain the expected value, tho=
ugh:
> > >
> > >     __fixups__ {
> > >         /path/to/node@deadbeef =3D "/fragment@0/__overlay__:power-dom=
ains:0";
> > >     };
> > >
> > > When using ftdoverlay, the situation is worse:
> > >
> > >     Failed to apply my.dtb (-1)
> > >
> > > Are these known issues?
> >
> > Unfortunately, this can't work with the current overlay format.  We
> > have a specific syntax to allow the target of an overlay fragment to
> > specified as a path, but phandle references by path won't work.
> >
> > The problem is that the encoding of the fixups node has the fixup
> > target as a property name, and as the error says '/' is an illegal
> > character in property names - for a bunch of good reasons, so we can't
> > just go and remove that restriction.
>=20
> For the uneducated, can you please explain why '/' is an illegal characte=
r,

So, for *node* names, '/' clearly has to be banned, because that's the
path separator, so allowing it in components would make paths
ambiguous.

I realized after I wrote that that it's not quite so clear cut for
property names.  There are some reasons not to allow it still, but
they're not quite as irrefutable as for node names:

 * Keeping the same allowed character set for each, for consistency

 * Avoiding the same ambiguity if people use the notation
   /path/to/node/property.  That's not really correct anyway, but you
   see it sometimes

 * Avoiding problems for clients which translate property into names
   in the filesystem (Linux does this in order to present
   /proc/device-tree and similar for debugging).

Note that what we've historically allowed for fdts is a bit different
=66rom what IEE1275 officially allowed - part of that is because a bunch
of OF implementations in the wild long used characters that weren't
permitted by the spec (we're looking at you, Apple).  '/' has always
been prohibited in every variant, though.

For properties, 1275 allowed any printable character except uppercase
letters, '/', '\', ':', '[', ']' and '@'.

For nodes, 1275 allowed only characters in [a-zA-Z0-9,._+-].  That's
not counting the unit-address part (from the @ sign onwards), which is
bus dependent.  I'm not exactly sure if there were general limits on
what was bus definitions could allow in that part, but in practice
things outside [0-9a-f] are rare, and I know of no bus which allowed
things outside [0-9a-z,].

In dtc, we allow [a-zA-Z0-9,._+*#?@-] for both nodes and properties,
and it doesn't look like that's changed since 2007.

> and why it can't be special cased for phandle references by path in
> overlays?

We possibly could, although I don't much like the idea.  Note that
merely allowing it wouldn't make it magically work.  Tools which apply
overlays (libfdt & the kernel at minimum) would still need code
changes to explicitly understand this type of fixup.

> > So to allow this we'd need to come up with a different encoding for
> > path-targeted fixups and add support for it in the various pieces of
> > the chain.
> >
> > One way to do that would be to entirely rework the overlay format to
> > something more sensible, which would have a number of other benefits.
>=20
> IC.
>=20
> Thanks!
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Idd68gPqKLz5+Ci0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlwN/mUACgkQbDjKyiDZ
s5JnmA/+KRp9C+qiCPJcI29z1chEXNQ3997Jqrw3KP6R4mislAh41ZJPASmnPAsJ
N6h2pw23vF2HN8pa+QmwQV877b/VNzWcYuXked03Pv3Gc3XlFRJ6FIgTchkfFPdz
bmU2Vg20bwGN4HXlmyrRvPdNZBrD8k4sQ1zsw/PVcUGTfIuiwwmQZ2IxU3zRU6dW
cFg9OakwE4qoYBkcWw1xxdFzEpoIBraL/7V/OTPCCFNNQZ2rFB89IaWIkmGavmO1
6pV7e6qVKTmFKii4ftK5gGKQHq97yAry+/wvGWdmmC9NKJjbodAEwOxrcULmNRT8
P4knNMW/ZWWFU8QoivRt8IZ7N978tR+eYqWuvJt2KQvR7+v1n+v376ZnXVFSIvDA
C1T5N8Uibfonvou/u7veb6OzDiDfDM2DgkQJ+quflGJ5otEubghrou1vb2GA3Vzg
eoAO4U7xQder8j9IhbKZ22wc1CT561Yx+qDPmmOH5ASkUcNw0lsknba+MZl1oDED
T5UzKl/Yd1VrNip0Jj7DqOIB91kLpvIjGvB5z6jL9ghyX+32CEL5XLGS0RKBEG8F
KCChwhpIFb39wahLOzLkRyovEPcBLl++D5e9BTH1A2hAIJPg3MTgRK89A+ylO9Re
8dllGQcEADFf85130qktbhdUOFz30PPI4bBd6NgNw7J6dexs6jI=
=2peZ
-----END PGP SIGNATURE-----

--Idd68gPqKLz5+Ci0--
