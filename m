From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] fdtdump: Prettify output of properties
Date: Fri, 16 Jun 2017 11:40:17 -0400
Message-ID: <20170616154017.GW10782@bill-the-cat>
References: <1497452030-15588-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497452030-15588-3-git-send-email-pantelis.antoniou@konsulko.com>
 <20170614150639.GF2614@umbus>
 <20170615235230.GP10782@bill-the-cat>
 <594331A0.6050305@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lcx+qS6vNXl2wKxd"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <594331A0.6050305-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--lcx+qS6vNXl2wKxd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2017 at 06:17:20PM -0700, Frank Rowand wrote:
> Hi Tom,
>=20
> On 06/15/17 16:52, Tom Rini wrote:
> > On Wed, Jun 14, 2017 at 11:06:39PM +0800, David Gibson wrote:
> >> On Wed, Jun 14, 2017 at 05:53:49PM +0300, Pantelis Antoniou wrote:
> >>> Dumping files with large properties results in output with
> >>> arbitrary long lines.
> >>>
> >>> Original (manual line breaks inserted; it's a single long line):
> >>>
> >>> / {
> >>>     int =3D <0x00000001 0x00000024 0x00000004 0x00000000 \
> >>> 0x000502a4 0x000000df 0x00000003 0x13885783 0x13885783 \
> >>> 0x00000002 0x62797465 0x00000000 0x00000000 0x00000000 \
> >>> 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 \
> >>> 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000>;
> >>> };
> >>>
> >>> After prettification:
> >>>
> >>> / {
> >>>     int =3D <0x00000001 0x00000002 0x00000008 0x00000010 0x00000024 0=
x000000ab>,
> >>>           <0x00000001 0x00000017 0x00000004 0x00000038 0x00000007 0x0=
0000009>,
> >>>           <0x00000000 0x00000068 0x00000214 0x0000b8d9 0x000502a4 0x0=
0000001>,
> >>>           <0x00000004 0x0000002b 0x000000df 0x00000003 0x00000002 0x0=
0000001>;
> >>> };
> >>>
> >>> There are two new options (-w/--width) and (-S/--shift).
> >>>
> >>> Width is the terminal width, shift is the amount of spaces each nest =
level
> >>> increases by.
> >>>
> >>> Width by default is set to 80, and shift to 4.
> >>
> >> Nack.
> >>
> >> fdtdump is supposed to be a trivial debug tool.   If you want to
> >> decompile dtbs "for real" use dtc -I dtb -O dts.
> >=20
> > There's been times, entirely unrelated to what Pantelis is doing, where
> > I've used fdtdump in production cases because I needed to whack a few
> > things around.  If it's just supposed to be a trivial debug tool, we've
> > likely moved well beyond the point where we need to keep trivial tools
> > around if they shouldn't be more widely used, IMHO.
>=20
> Let me paraphrase what I think that said:
>=20
>    If a trivial debug tool is used by a wide audience then we should get
>    rid of the tool.
>=20
> I suspect I misunderstood.  Can you clarify?

Sure.  Pantelis wants to improve a trivial debug tool to be slightly
more useful.  The maintainer says no, we shouldn't touch the tool, you
can use dtc -I dtb -O dts instead.  As that would also cover fdtdump
itself, it sounds like fdtdump is deprecated and should be removed, as
it's being used outside of the trivial debug use case.

Or, can we talk about improving fdtdump as being a valid tool working
with dtb files when 'dtc -I dtb -O dts' is not desired?

--=20
Tom

--lcx+qS6vNXl2wKxd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZQ/vgAAoJEIf59jXTHXZSJTQQAK3Q988mnHRiChYSSsRFKoMW
yQ6BNfvq5fGElTVuq/Uru5I2s8bCkYn8s9KF3CIqZ5Gm8oJAVI4wplAoMGAAeD/l
8JtDGYPUHQCvvQXhuqYdNbFlpm4S4XtJ/f9le/pewtrrb8FaH0MdoJZQFVz53bLe
A6lrxpMztlSgpyyc6uHVkEksvL8fQ7gvW2FGiaWGafyKThWfCMiL01EpfLFbrnGP
gbD2y/b/OJVmwsRqIxd2i7x1vJPy6bwoy7m3FESTlDocRoR9xnHxOdCXvzwYjD4/
OWQdzkzhCNxn7shv88VS8lXNDNcmE4I6r/X6nNm51VMeOXkrvQMLzHN1Sm1F5cBj
S/2ocPWgERZMltgufUk9nmzosqSLMUXwmX5AgWegv9VGjFURth4mS6HfgZu06L5l
sumv2ZGh/EMfUQaLEgMYEapiI/Y4Xod+w4sZ8MfGdqxYftVYisetLshPs/fQ2brc
6bOED7TqA++D7ke7phtefNzCgL3fA0XVcvw1imyTWOunkltxCs2K8Dr6YBnv3HfI
Zc58rp3WLO6P2x8NAT4dbOWU9kFCuTdJWeWjf4/+1kvMSRLxv/JKCrwMA4UdJ408
bw1ybtD8i+nvH/Z1n3Pq/zCYmDKZkm5oi61nFh2k1xfu/joMJndsyNiUyB2nLtZQ
yIsHuXGxryR8MiJHZJ7M
=5ue7
-----END PGP SIGNATURE-----

--lcx+qS6vNXl2wKxd--
