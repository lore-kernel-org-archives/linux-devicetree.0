From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/3] fdtdump: Prettify output of properties
Date: Sun, 18 Jun 2017 19:33:18 +0800
Message-ID: <20170618113318.GF22449@umbus>
References: <1497452030-15588-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497452030-15588-3-git-send-email-pantelis.antoniou@konsulko.com>
 <20170614150639.GF2614@umbus>
 <1497467574.28265.16.camel@hp800z>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SnV5plBeK2Ge1I9g"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497467574.28265.16.camel@hp800z>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--SnV5plBeK2Ge1I9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2017 at 10:12:54PM +0300, Pantelis Antoniou wrote:
> Hi David,
>=20
> On Wed, 2017-06-14 at 23:06 +0800, David Gibson wrote:
> > On Wed, Jun 14, 2017 at 05:53:49PM +0300, Pantelis Antoniou wrote:
> > > Dumping files with large properties results in output with
> > > arbitrary long lines.
> > >=20
> > > Original (manual line breaks inserted; it's a single long line):
> > >=20
> > > / {
> > >     int =3D <0x00000001 0x00000024 0x00000004 0x00000000 \
> > > 0x000502a4 0x000000df 0x00000003 0x13885783 0x13885783 \
> > > 0x00000002 0x62797465 0x00000000 0x00000000 0x00000000 \
> > > 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 \
> > > 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000>;
> > > };
> > >=20
> > > After prettification:
> > >=20
> > > / {
> > >     int =3D <0x00000001 0x00000002 0x00000008 0x00000010 0x00000024 0=
x000000ab>,
> > >           <0x00000001 0x00000017 0x00000004 0x00000038 0x00000007 0x0=
0000009>,
> > >           <0x00000000 0x00000068 0x00000214 0x0000b8d9 0x000502a4 0x0=
0000001>,
> > >           <0x00000004 0x0000002b 0x000000df 0x00000003 0x00000002 0x0=
0000001>;
> > > };
> > >=20
> > > There are two new options (-w/--width) and (-S/--shift).
> > >=20
> > > Width is the terminal width, shift is the amount of spaces each nest =
level
> > > increases by.
> > >=20
> > > Width by default is set to 80, and shift to 4.
> >=20
> > Nack.
> >=20
> > fdtdump is supposed to be a trivial debug tool.   If you want to
> > decompile dtbs "for real" use dtc -I dtb -O dts.
> >=20
>=20
> I'm afraid it's not so clear cut.
>=20
> True, you can use dtc on the host to dump a blob to DTS in a similar
> manner to fdtdump (with the prettified output is much better with this
> patch).
>=20
> Although the size of the dtc compiler package is larger than fdtdump by
> about 5 times (this is not that important nowdays), the biggest use is
> for restricted environment where the full dtc compiler just can't work.
>=20
> A bootloader or something small can easily incorporate fdtdump for
> dumping out blobs, while including dtc is not even be possible.

Ok, but unlike libfdt, fdtdump will need at least minimal modification
to work in that restricted environment.  And if you're going to modify
it that way, you can add whatever pretty printing options you want.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SnV5plBeK2Ge1I9g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZRmT+AAoJEGw4ysog2bOS9WEQAOJTXxbAEznm1w172X5XckBs
3q0BWJzkOyvILhRqxlNRyoSS/l/G/btzBDZe5CO/Aq3EPTx4LXPTDbCHgVuZ/rhQ
e3wlnhueZaziwdRRV9DH/W4ECDwxtSjdPfg2cNlZ3xBktF1L/4ycIZBM7QcdioAt
RGq2lIm6ulc54HPi/Pn/wbG2k91HmHNBk8J0kGWZlQWFkV8CfnD/SYvx9EvetTSC
74Mr86r7dQuhg7U01dqeV2eA/oC+HMk3cI5OfQkYY8jlpyCTpcz88/MejqbvDgKh
3BIyLxkoX39dcWD+odpntfhUH2DbtS3ZdhbrxxbDpKJtVenWGlZ+zhRbW5W9zoE/
5QqmmTOL5RdgfSVbxZqqbUfDYzU9p+CdVM5CYqc0m8GERlOcCy7t/OjRw9A4O/q3
91/E1VAqatFOyyzR4X88XlY2yQJ5UOamOK5T/t6lpLsZD7VFTy/ctTQ3B9H82ejH
OeA9hhIboBykkTg9/Sa9JKeYSgIuBwfrqPJKT9I3V/bOrW4G+9MrDDa5is28GOgP
5m4cyqnfH490LADL55+Yx39Zli2f7mFt2a9Y2Z8NKvwJdKdrajYgaQunYNnMhJVf
sXA1daOB1NiiN7LdOz53ytMqB1N7pZUGaKfhcN9TMazxdsByEgTXMbbuzA1+lLIm
AprKVrgA6baAA+IkIYa8
=la4i
-----END PGP SIGNATURE-----

--SnV5plBeK2Ge1I9g--
