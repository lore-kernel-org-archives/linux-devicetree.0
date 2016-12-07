From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v12 0/4] dtc: Dynamic DT support
Date: Wed, 7 Dec 2016 15:31:39 +1100
Message-ID: <20161207043139.GC12489@umbus.fritz.box>
References: <1480957528-8367-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480957528-8367-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2016 at 07:05:21PM +0200, Pantelis Antoniou wrote:
> This patchset adds Dynamic DT support in the DTC compiler
> as used in a number of boards like the beaglebone/rpi/chip and others.
>=20
> The first patch documents the internals of overlay generation, while
> the second one adds dynamic object/overlay support proper.
>=20
> The third patch adds a test method that can is used by the subsequent
> patch which adds a few overlay tests verifying operation.
>=20
> The following 3 patches add support for the syntactic sugar version
> of &foo { }; in a similar manner.
>=20
> This patchset is against DTC mainline and is also available for a pull
> request from https://github.com/pantoniou/dtc/tree/overlays
>=20
> Regards
>=20
> -- Pantelis

Ok, I've taken a step back and realized I was getting bogged down
trying to lay plans for possible future design improvements for the
overlays, at the expense of getting something merged to handle the
existing syntax.  Sorry.

Re-examining this from that perspective, here are the (small, I
believe) things I'd still like to see done before merging this.  Some
of these require backing out changes I suggested myself earlier,
again, sorry - I still think they are good changes for the future, but
for now they're just confusing the issue.

1. Drop support for the "new style" /dts-v1/ /plugin/' tag - only allow
   the existing /dts-v1/; /plugin/; format.  Rationale: as we clean up
   the overlay syntax further in future, we can use the old-style tag
   to distinguish old-style overlays and avoid a special backwards
   compatibility flag.

2. Drop support for the new magic number.  Rationale: we can
   use a new magic number to distinguish future improved dtbo
   encodings.  It'd be nice to distinguish plugins in the existing
   format, but they're already out there, so we have to cope anyway,
   putting a new magic number in at this stage doesn't really help.

3. Drop the -F command line option.  Rationale: output with unresolved
   references and no fixups doesn't make sense in any circumstances.
   Instead generate fixups if and only if we're in plugin mode
   (regardless of -@). Optionally you can omit the fixups nodes if
   there are no fixups to be generated.

4. Rename 'versioninfo' in the parser etc. to 'dtsflags'.  Rationale:
   plugin mode isn't really a "version", and calling it "version"
   invites confusion with the dtb output version.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYR5CoAAoJEGw4ysog2bOS1jIQALUrI0XxALsmHkeBFfw/UWo9
6ANdbdEWFjUbLhsVSOby31TSKBIxwzLLqdKm+qUYbizTmadJT3V2eqmO4HiPp4MX
N1y3h6Ceifz/uv5i50BEf44Z+VlCQRTV/0U3CYrlqT9GGGioCmnE7K7dpu3NPpYl
zUne1LDzpqWNthJZixjwdZZ6Q4x1+2fxqO/BzjJRLa2otJabqdbq02z72FCYzRBM
wvKjA+JD7CFmQFo7WFTMtB0kxV1xLQBBlqXwsDBHeSbsjrSpYwlvv61qoxlfBW7O
YJjXDtJ6ynTUYJj2/MyKdgL7/WpMsuooVIOVMbRJFO+3QYAfB4GyqmtaQUbPxYW9
fwybnXaqX+zJXX4OVO2oRRnNQChKabJpKxRyNepATglO8zTmi+BlNv9D2hofY4c8
B5bH99ZPVvS6h5sz/oINt2kLj4oRypCabyWJP7qBQVw/gABWddLsKlg44AI5EkRk
SPVhQetjwqcCvbG0Ddlei20GYZDnRpULmDV3PpbpD65S/KF+Zg9Le65eSnVTaeNJ
TWkg0LYfnon/OWQJMpfarruHG7aIgwhsz+IrIXxn1F9nk8WdyY/z556+NqcgWJw3
y/2cxw/ZWfdFriHfXfk0nBLWpGoJEgC92d4WfpGVuKRnlq+DU57rkBnvysLZAKFk
812HMjNAF1RFicm9zlaN
=Lq46
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
