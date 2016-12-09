From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v13 0/7] dtc: Dynamic DT support
Date: Fri, 9 Dec 2016 19:54:32 +1100
Message-ID: <20161209085432.GR13139@umbus.fritz.box>
References: <1481114903-8197-1-git-send-email-pantelis.antoniou@konsulko.com>
 <20161209055709.GP13139@umbus.fritz.box>
 <3C4DD870-3736-42A7-A110-0975C31E74A4@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PkEWctFf+8E2rcii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3C4DD870-3736-42A7-A110-0975C31E74A4-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--PkEWctFf+8E2rcii
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 09, 2016 at 10:16:51AM +0200, Pantelis Antoniou wrote:
> Hi David,
>=20
> > On Dec 9, 2016, at 07:57 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> w=
rote:
> >=20
> > On Wed, Dec 07, 2016 at 02:48:16PM +0200, Pantelis Antoniou wrote:
> >> This patchset adds Dynamic DT support in the DTC compiler
> >> as used in a number of boards like the beaglebone/rpi/chip and others.
> >>=20
> >> The first patch documents the internals of overlay generation, while
> >> the second one adds dynamic object/overlay support proper.
> >>=20
> >> The third patch adds a test method that can is used by the subsequent
> >> patch which adds a few overlay tests verifying operation.
> >>=20
> >> The following 3 patches add support for the syntactic sugar version
> >> of &foo { }; in a similar manner.
> >>=20
> >> This patchset is against DTC mainline and is also available for a pull
> >> request from https://github.com/pantoniou/dtc/tree/overlays
> >=20
> > Ok, I've merged patches 1-4 into mainline, along with a bunch of minor
> > fixes of my own on top.  5..7 (the start of the new) I want to hold
> > off on for now, to thrash out the details of what we want a new
> > cleaner format to look like a bit more thoroughly.
> >=20
>=20
> Thank you.
>=20
> My git tree contains an updated patchset of the syntactic sugar patches
> for reference now.

Ok.  Note that one of the patches I merged afterwards was a big rename
of struct boot_info, so your patches will probably need a fair bit of
fiddly though straightforward rebasing.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PkEWctFf+8E2rcii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYSnFDAAoJEGw4ysog2bOSwZUP/25Q7UpltfZlbjpV9baiX2MX
H8ppHDv4hrsByTE5GNCQaY7wGUaFXt5VKS0BAfbts3ApexJ5WXfnkzVnmoob7crx
ySmcN6hGHKcSerCaKKnu0sdzCo8G9SLo4zTX+7oxuI10B/pNmrwbkNcWdwLmpvvk
G+gD9s7nXN+3K0hHZnMFJnqW7TNz7kVwyqSK53W7OvAkvu8yl2ZQwn0ooZIZlseS
oC+JcbN/KXPRHKTr5Un5xXKVxlWeodE37Q3wooJFmDlSYVWHcnur8UhN7QAYmJDf
dTZ2s96l40q4cEjRuAPPaWyZ4zIF6paM8fyBtuL/OSmikDTEoRdhCEQ8L4E2ivIZ
vI0Yj1q9bea4ExdNU1TfOdT3nqlpdADdK5JI7WcJXplmLNhRJbGrUOl2h9GFvlxk
AaqQI8zy2Os4zMmeWjPYFNZY1wmQBsg8zmqAzkW0cg/QVKwoiPB6T9nRBZNMmKKl
yULUYuSTB9wQlxi1bmJO4qghlq7eaP90cyFKzVvBpqO55S21A1H4meoxuFUyEYol
ethcPWCN+my2s2bIdDqyHtYG2/OVI7Dn0Qu7ik80xcMsZf1HdDvCq1ZCZlfBppkk
8c41xhw2lcnLHgAWopI6xg+nhnGWKeS+WZ7yzwdpb+fdCJBo7c4thRGJ4Vc+aa18
sw6aElzU4ZG4eeSEqZi0
=ciBu
-----END PGP SIGNATURE-----

--PkEWctFf+8E2rcii--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
