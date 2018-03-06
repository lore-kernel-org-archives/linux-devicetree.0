From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Overlay sugar syntax (was: Re: [PATCH v6 3/4] drm: rcar-du: Fix
 legacy DT to create LVDS encoder nodes)
Date: Wed, 7 Mar 2018 01:07:46 +1100
Message-ID: <20180306140746.GX2650@umbus.fritz.box>
References: <CAMuHMdUqvZEKu5v4E29ofjj09sv+Yxk41W4K+FnfqKQ=88AWRA@mail.gmail.com>
 <20180306035412.GU2650@umbus.fritz.box>
 <CAMuHMdU54Bb8aObwaOuq6u7HO_LVhpGv9uMjGbt8VcKruop_tA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0646693386=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAMuHMdU54Bb8aObwaOuq6u7HO_LVhpGv9uMjGbt8VcKruop_tA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--===============0646693386==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5860PwWXAiuGjz3C"
Content-Disposition: inline


--5860PwWXAiuGjz3C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 06, 2018 at 01:30:05PM +0100, Geert Uytterhoeven wrote:
> Hi David,
>=20
> On Tue, Mar 6, 2018 at 4:54 AM, David Gibson
> <david@gibson.dropbear.id.au> wrote:
> > On Fri, Feb 23, 2018 at 09:05:24AM +0100, Geert Uytterhoeven wrote:
> >> On Fri, Feb 23, 2018 at 3:38 AM, Frank Rowand <frowand.list@gmail.com>=
 wrote:
> >> > I was hoping to be able to convert the .dts files to use sugar syntax
> >> > instead of hand coding the fragment nodes, but for this specific set
> >> > of files I failed, since the labels that would have been required do
> >> > not already exist in the base .dts files that that overlays would be
> >> > applied against.
> >>
> >> Indeed, hence the fixup overlays use "target-path".
> >>
> >> BTW, is there any specific reason there is no sugar syntax support in =
dtc
> >> for absolute target paths? I guess to prevent adding stuff to a random
> >> existing node, and to encourage people to use a "connector" API define=
d in
> >> term of labels?
> >
> > Only because it hasn't been implemented.  Using &{/whatever} should
> > IMO generate a target-path and the fact it doesn't is a bug.
> >
> >> I'm also in the process of converting my collection of DT overlays to =
sugar
> >> syntax, and lack of support for "target-path" is the sole thing that h=
olds
> >> me back from completing this. So for now I use a mix of sugar and
> >> traditional overlay syntax.
> >>
> >> In particular, I need "target-path" for two things:
> >>   1. To refer to the root node, for adding devices that should live at
> >>      (a board subnode of) the root node, like:
> >>        - devices connected to GPIO controllers provided by other base =
or
> >>          overlay devices (e.g. LEDs, displays, buttons, ...),
> >>        - clock providers for other overlays devices (e.g. fixed-clock).
>=20
> >> The former is the real blocker for me.
>=20
> > Below is draft patch adding target-path support.  The pretty minimal
> > test examples do include a case using &{/}
> >
> > From 8f1b35f88395adea01ce1100c5faa27dacbc8410 Mon Sep 17 00:00:00 2001
> > From: David Gibson <david@gibson.dropbear.id.au>
> > Date: Tue, 6 Mar 2018 13:27:53 +1100
> > Subject: [PATCH] Correct overlay syntactic sugar for generating target-=
path
> >  fragments
> >
> > We've recently added "syntactic sugar" support to generate runtime dtb
> > overlays using similar syntax to the compile time overlays we've had for
> > a while.  This worked with the &label { ... } syntax, adjusting an exis=
ting
> > labelled node, but would fail with the &{/path} { ... } syntax attempti=
ng
> > to adjust an existing node referenced by its path.
> >
> > The previous code would always try to use the "target" property in the
> > output overlay, which needs to be fixed up, and __fixups__ can only enc=
ode
> > symbols, not paths, so the result could never work properly.
> >
> > This adds support for the &{/path} syntax for overlays, translating it =
into
> > the "target-path" encoding in the output.  It also changes existing
> > behaviour a little because we now unconditionally one fragment for each
> > overlay section in the source.  Previously we would only create a fragm=
ent
> > if we couldn't locally resolve the node referenced.  We need this for
> > path references, because the path is supposed to be referencing somethi=
ng
> > in the (not yet known) base tree, rather than the overlay tree we are
> > working with now.  In particular one useful case for path based overlays
> > is using &{/} - but the constructed overlay tree will always have a root
> > node, meaning that without the change that would attempt to resolve the
> > fragment locally, which is not what we want.
> >
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>=20
> Thank you, seems to work fine on dtc.git.
>=20
> Note that while the dtc part applies on the in-kernel copy of dtc, it
> doesn't work there: "&{/}" behaves the same as "/" (i.e. no overlay
> fragment is generated), but "&{/foo}" does create the overlay fragment.
> Merging in Rob's for-next branch to upgrade Linux' copy of dtc fixes
> that.

I think that'll be because the kernel makefiles (at least by default)
use a pre-generated version of the parser, rather than running bison.
Since there were changes in the .y file, those will be missing which
would cause the error you describe.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5860PwWXAiuGjz3C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlqeoK8ACgkQbDjKyiDZ
s5IhyA/+OkscdFmD0xFHT4WP3cJ6Hzt4H9rjR9W0LJaNogZtBfGJbTUw5RF9j71/
st5PuKMpppH9xSDSe619e2D+xRtLEG0niwHsbfXIhASNIp7+N1/8OgBWAggTlTQs
TzBZ0Sz40HWU9Xksd96JlgBDe5YGYokfXXauOuVHT+KkuF+rcoOjJc2ETBN2aVSl
54JrbLm8vTlktYnf2xabt1/OBWzatKhhgRn7uXN52y4DZou+zXR1AWeMuHs6WE4W
R96Uk2uIvMZzqkTDSFs7CQe7/FBk7zpuS0j+NuBCicQozrylLoE8Ygcd5mtNjVwR
p45edtpZWvfp86cEBZdB3BQDPh8M+iX/riJSICbVJpPylJIpjYayYhzMBKOEoRRN
ETeNm8Y7D9RbixXvjZqoHUVMrs6Mp5Tl1IGg5Tosq1ZxW3wOOJzenIxYjlE/iTIA
dHWiY1koywaY1ru8F8M5mjDmsGvPmB91meSG1KLBuVnNm9hp88GZuGTJr66H7Lww
+Is/aOKKzixyRbNV4eh/5muQsjvGcEKidzW9HW2oMzpbUkgydU/3TIAk3KU9wp8X
W15JMn6VizDjNQOGW2gew6j0NNx1hNAmPsWD5mrO0rz7E6Bbf8BjbdwKFIDOAnvn
h1kSLa2Mnstg+vgjrcsT42UhOkgnAb+LAZsz5LTqycPV4SVs5rw=
=/YHd
-----END PGP SIGNATURE-----

--5860PwWXAiuGjz3C--

--===============0646693386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0646693386==--
