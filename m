From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Overlay sugar syntax (was: Re: [PATCH v6 3/4] drm: rcar-du: Fix
 legacy DT to create LVDS encoder nodes)
Date: Wed, 7 Mar 2018 13:30:31 +1100
Message-ID: <20180307023031.GC3083@umbus.fritz.box>
References: <CAMuHMdUqvZEKu5v4E29ofjj09sv+Yxk41W4K+FnfqKQ=88AWRA@mail.gmail.com>
 <20180306035412.GU2650@umbus.fritz.box>
 <CAMuHMdU54Bb8aObwaOuq6u7HO_LVhpGv9uMjGbt8VcKruop_tA@mail.gmail.com>
 <e46f67ff-2900-8500-b1aa-503a9757997f@gmail.com>
 <28e8e3cb-263d-5352-badf-34b269ad860b@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1737621395=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <28e8e3cb-263d-5352-badf-34b269ad860b@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--===============1737621395==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Content-Disposition: inline


--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 06, 2018 at 01:40:20PM -0800, Frank Rowand wrote:
> On 03/06/18 11:51, Frank Rowand wrote:
> > On 03/06/18 04:30, Geert Uytterhoeven wrote:
> >> Hi David,
> >>
> >> On Tue, Mar 6, 2018 at 4:54 AM, David Gibson
> >> <david@gibson.dropbear.id.au> wrote:
> >>> On Fri, Feb 23, 2018 at 09:05:24AM +0100, Geert Uytterhoeven wrote:
> >>>> On Fri, Feb 23, 2018 at 3:38 AM, Frank Rowand <frowand.list@gmail.co=
m> wrote:
> >>>>> I was hoping to be able to convert the .dts files to use sugar synt=
ax
> >>>>> instead of hand coding the fragment nodes, but for this specific set
> >>>>> of files I failed, since the labels that would have been required do
> >>>>> not already exist in the base .dts files that that overlays would be
> >>>>> applied against.
> >>>>
> >>>> Indeed, hence the fixup overlays use "target-path".
> >>>>
> >>>> BTW, is there any specific reason there is no sugar syntax support i=
n dtc
> >>>> for absolute target paths? I guess to prevent adding stuff to a rand=
om
> >>>> existing node, and to encourage people to use a "connector" API defi=
ned in
> >>>> term of labels?
> >>>
> >>> Only because it hasn't been implemented.  Using &{/whatever} should
> >>> IMO generate a target-path and the fact it doesn't is a bug.
> >>>
> >>>> I'm also in the process of converting my collection of DT overlays t=
o sugar
> >>>> syntax, and lack of support for "target-path" is the sole thing that=
 holds
> >>>> me back from completing this. So for now I use a mix of sugar and
> >>>> traditional overlay syntax.
> >>>>
> >>>> In particular, I need "target-path" for two things:
> >>>>   1. To refer to the root node, for adding devices that should live =
at
> >>>>      (a board subnode of) the root node, like:
> >>>>        - devices connected to GPIO controllers provided by other bas=
e or
> >>>>          overlay devices (e.g. LEDs, displays, buttons, ...),
> >>>>        - clock providers for other overlays devices (e.g. fixed-cloc=
k).
> >>
> >>>> The former is the real blocker for me.
> >>
> >>> Below is draft patch adding target-path support.  The pretty minimal
> >>> test examples do include a case using &{/}
> >>>
> >>> From 8f1b35f88395adea01ce1100c5faa27dacbc8410 Mon Sep 17 00:00:00 2001
> >>> From: David Gibson <david@gibson.dropbear.id.au>
> >>> Date: Tue, 6 Mar 2018 13:27:53 +1100
> >>> Subject: [PATCH] Correct overlay syntactic sugar for generating targe=
t-path
> >>>  fragments
> >>>
> >>> We've recently added "syntactic sugar" support to generate runtime dtb
> >>> overlays using similar syntax to the compile time overlays we've had =
for
> >>> a while.  This worked with the &label { ... } syntax, adjusting an ex=
isting
> >>> labelled node, but would fail with the &{/path} { ... } syntax attemp=
ting
> >>> to adjust an existing node referenced by its path.
> >>>
> >>> The previous code would always try to use the "target" property in the
> >>> output overlay, which needs to be fixed up, and __fixups__ can only e=
ncode
> >>> symbols, not paths, so the result could never work properly.
> >>>
> >>> This adds support for the &{/path} syntax for overlays, translating i=
t into
> >>> the "target-path" encoding in the output.  It also changes existing
> >>> behaviour a little because we now unconditionally one fragment for ea=
ch
> >>> overlay section in the source.  Previously we would only create a fra=
gment
> >>> if we couldn't locally resolve the node referenced.  We need this for
> >>> path references, because the path is supposed to be referencing somet=
hing
> >>> in the (not yet known) base tree, rather than the overlay tree we are
> >>> working with now.  In particular one useful case for path based overl=
ays
> >>> is using &{/} - but the constructed overlay tree will always have a r=
oot
> >>> node, meaning that without the change that would attempt to resolve t=
he
> >>> fragment locally, which is not what we want.
> >>>
> >>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> >>
> >> Thank you, seems to work fine on dtc.git.
> >=20
> > And the patched dtc works for a dts file that I was trying to convert
> > to sugar dts syntax
>=20
> < snip >
>=20
> I noticed that a space in "&{/}" is an error.  I wanted to check whether
> that was deliberate, or that the patch wasn't fully complete yet.

That's essentially deliberate - it's not really related to this patch
at all.  The patch just re-uses the existing syntax for a "path
reference".  The whole thing is treated as a single token, hence, no
spaces.

It might be possible to change that, but it could introduce some
complications when the path reference syntax is used in other places.
So I'm disinclined to change it, unless there's a very strong reason
to.

> cat path_sugar_v1.dts=20
>=20
> $ nl -ba path_sugar_v1.dts
>      1=09
>      2	/dts-v1/;
>      3	/plugin/;
>      4	&{/} {
>      5			#address-cells =3D <2>;
>      6			#size-cells =3D <2>;
>      7=09
>      8			my_node@feb90000 {
>      9				compatible =3D "vendor,device";
>     10				reg =3D <0 0xfeb90000 0 0x1c>;
>     11=09
>     12			};
>     13=09
>     14	};
>=20
> $ dtc -O dts path_sugar_v1.dts=20
> /dts-v1/;
>=20
> / {
>=20
> 	fragment@0 {
> 		target-path =3D [2f 00];
>=20
> 		__overlay__ {
> 			#address-cells =3D <0x2>;
> 			#size-cells =3D <0x2>;
>=20
> 			my_node@feb90000 {
> 				compatible =3D "vendor,device";
> 				reg =3D <0x0 0xfeb90000 0x0 0x1c>;
> 			};
> 		};
> 	};
> };
>=20
> $ nl -ba path_sugar_v2.dts
>      1=09
>      2	/dts-v1/;
>      3	/plugin/;
>      4	&{ / } {
>      5			#address-cells =3D <2>;
>      6			#size-cells =3D <2>;
>      7=09
>      8			my_node@feb90000 {
>      9				compatible =3D "vendor,device";
>     10				reg =3D <0 0xfeb90000 0 0x1c>;
>     11=09
>     12			};
>     13=09
>     14	};
>=20
> $ dtc -O dts path_sugar_v2.dts=20
> Error: path_sugar_v2.dts:4.1-2 syntax error
> FATAL ERROR: Unable to parse input tree
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlqfTscACgkQbDjKyiDZ
s5L7zBAArCCvb1vdfatvyC/lTF2Zy7LhTBtdsnlGYzT9r/ygUqRmBzXOqyzNOGW9
vEB6/VWLBsl9Y+Q9HYT/PJcHZW9R6N425x4uCmuISm9F3Ylc2hthATs8gDziMTwP
J0x9IYOlfkFBj4+fEMVABpSdpsX5klKAJuoJBvMhlnfs9K1GvuL02qKrJs8Gb6pa
WNQbOYLxZxcJQJSGaOPgIGhMZeJ6QTBgo1fq1DufYsO/5K2akhOCmqOcBof3Szfy
9uORpBL0I6csZNVHTntEUPk1F/zBKf918VBUzNSgg1Uef43lrOxv6xvbNCJrsYoP
9ABP7iLxed+ANROPBMoW7HD0XEs6/K0lAoUnLmXPe3Ihha80xbowexjIXpZr9TaT
Fa3v6kudfZVw9/tLXdxYs/bBBqVhq3GlVAfULsg7YNrNy05UqfDF1QmhZP0dy17E
AfPwCfpvwevttriUsvwmnrHtmoWSepsWlKnXzo7K8GPmwkROlwi5eI4Mgk5VvBdx
UbpE+BPCIT2favX8mTzlMCtKFevSpSoByhBOOXBguC0PcOuj0I8nn/jEhxlWNGBG
eu41bU2RqORumws+9BQ7fkLriPewcLH3DYoP4Mw6laqw1NlYLg8NLw71BLyCw1BP
Bj78/LlMYUFJsDkX5RNDtk0lqVViIUkYa6qei5nOIz6eaDnG+GY=
=sBTW
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--

--===============1737621395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1737621395==--
