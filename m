From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/3] fdtdump: Prettify output of properties
Date: Sun, 18 Jun 2017 19:36:31 +0800
Message-ID: <20170618113631.GG22449@umbus>
References: <1497452030-15588-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497452030-15588-3-git-send-email-pantelis.antoniou@konsulko.com>
 <20170614150639.GF2614@umbus>
 <20170615235230.GP10782@bill-the-cat>
 <594331A0.6050305@gmail.com>
 <20170616154017.GW10782@bill-the-cat>
 <59442B0F.4010706@gmail.com>
 <20170617003449.GN10782@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Sw7tCqrGA+HQ0/zt"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170617003449.GN10782@bill-the-cat>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Sw7tCqrGA+HQ0/zt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2017 at 08:34:49PM -0400, Tom Rini wrote:
> On Fri, Jun 16, 2017 at 12:01:35PM -0700, Frank Rowand wrote:
> > On 06/16/17 08:40, Tom Rini wrote:
> > > On Thu, Jun 15, 2017 at 06:17:20PM -0700, Frank Rowand wrote:
> > >> Hi Tom,
> > >>
> > >> On 06/15/17 16:52, Tom Rini wrote:
> > >>> On Wed, Jun 14, 2017 at 11:06:39PM +0800, David Gibson wrote:
> > >>>> On Wed, Jun 14, 2017 at 05:53:49PM +0300, Pantelis Antoniou wrote:
> > >>>>> Dumping files with large properties results in output with
> > >>>>> arbitrary long lines.
> > >>>>>
> > >>>>> Original (manual line breaks inserted; it's a single long line):
> > >>>>>
> > >>>>> / {
> > >>>>>     int =3D <0x00000001 0x00000024 0x00000004 0x00000000 \
> > >>>>> 0x000502a4 0x000000df 0x00000003 0x13885783 0x13885783 \
> > >>>>> 0x00000002 0x62797465 0x00000000 0x00000000 0x00000000 \
> > >>>>> 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 \
> > >>>>> 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000>;
> > >>>>> };
> > >>>>>
> > >>>>> After prettification:
> > >>>>>
> > >>>>> / {
> > >>>>>     int =3D <0x00000001 0x00000002 0x00000008 0x00000010 0x000000=
24 0x000000ab>,
> > >>>>>           <0x00000001 0x00000017 0x00000004 0x00000038 0x00000007=
 0x00000009>,
> > >>>>>           <0x00000000 0x00000068 0x00000214 0x0000b8d9 0x000502a4=
 0x00000001>,
> > >>>>>           <0x00000004 0x0000002b 0x000000df 0x00000003 0x00000002=
 0x00000001>;
> > >>>>> };
> > >>>>>
> > >>>>> There are two new options (-w/--width) and (-S/--shift).
> > >>>>>
> > >>>>> Width is the terminal width, shift is the amount of spaces each n=
est level
> > >>>>> increases by.
> > >>>>>
> > >>>>> Width by default is set to 80, and shift to 4.
> > >>>>
> > >>>> Nack.
> > >>>>
> > >>>> fdtdump is supposed to be a trivial debug tool.   If you want to
> > >>>> decompile dtbs "for real" use dtc -I dtb -O dts.
> > >>>
> > >>> There's been times, entirely unrelated to what Pantelis is doing, w=
here
> > >>> I've used fdtdump in production cases because I needed to whack a f=
ew
> > >>> things around.  If it's just supposed to be a trivial debug tool, w=
e've
> > >>> likely moved well beyond the point where we need to keep trivial to=
ols
> > >>> around if they shouldn't be more widely used, IMHO.
> > >>
> > >> Let me paraphrase what I think that said:
> > >>
> > >>    If a trivial debug tool is used by a wide audience then we should=
 get
> > >>    rid of the tool.
> > >>
> > >> I suspect I misunderstood.  Can you clarify?
> > >=20
> > > Sure.  Pantelis wants to improve a trivial debug tool to be slightly
> > > more useful.  The maintainer says no, we shouldn't touch the tool, you
> > > can use dtc -I dtb -O dts instead.  As that would also cover fdtdump
> > > itself, it sounds like fdtdump is deprecated and should be removed, as
> > > it's being used outside of the trivial debug use case.
> >=20
> > fdtdump is useful for debugging and provides several features that aren=
't
> > available in 'dtc -I dtb -O dts'.
>=20
> Agreed.
>=20
> > The maintainer wants to keep the debug tool simple.
>=20
> Maintainers prerogative, yes.
>=20
> > Another tool (dtc)
> > already exists to do what the proposed patch would add.
>=20
> I disagree, or at least don't see it in 'dtc -I dtb -O dts' as there
> would need to be another argument for "linebreak the output and continue
> to be valid".  I just rebuilt from master and dumped a dtb I had around
> to confirm (and checked the help, too).

No, I don't think it's there.  But I'd be happy to accept patches
adding pretty printing to the -O dts output.  I particularly don't
want to add convenience features to fdtdump that _arent't_ already in
dtc.

> > Somehow Pantelis and you then jumped to the conclusion that fdtdump
> > should be removed.  This is the part that I don't get.  It is a useful
> > tool that has features that are not otherwise available.  Why would
> > you get rid of it?
>=20
> It's not Pantelis, it's my argument.  And for the record, I say it's
> useful too.  I'm arguing that the logical end point of the maintainers
> argument is that fdtdump shouldn't be used anywhere by anyone, it's a
> trivial debug tool that no one should be shipping.  It's like enabling
> various debug options in the kernel.  The right tool for most people of
> "I need to read a dtb" is to use dtc -I dtb -O dts, and if you're
> working on dtc, that's when maybe you need another tool at times, so you
> can see the internal steps.

The main use case for fdtdump, as far as I'm concerned, is if you have
a (possibly) corrupted dtb.  dtc will die without printing anything in
that case, fdtdump will probably give you at least something.

>=20
> > > Or, can we talk about improving fdtdump as being a valid tool working
> > > with dtb files when 'dtc -I dtb -O dts' is not desired?
> >=20
> > That conflicts with the purpose (debug) and design goals (trivial)
> > stated by the maintainer.
>=20
> So what's the right tool for getting nice human readable output?  'dtc
> -I dtb -O dts' will give you the arbitrarily long lines that this patch
> fixes.
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Sw7tCqrGA+HQ0/zt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZRmW/AAoJEGw4ysog2bOSyN4P/27BXVFDpzoH3p9OfdXNKMdj
S3FHbHVZydIkc0Y8KkUq9TR4dcRogooDFH/pwcLaxzJrdKy97+Z2QqsR8IEoLxMI
EIWgyDD5DH4o6/lOd1Te7l5ZEWUqhesnAWlPBLdSPpkYN4YavomAr02+g9jl7Km7
JJpwSFVuK1YYNLGUFGoy2B9bX5rHKcvNs/izPGuPj9bcvExBTMoDf/vgIdTwJDRB
fsGP5vl4sqyspb2+eQ3MWtHQiW76VZTC8Gjm+RK4j50/CmWtDxGw6wz59R2UK9Tv
D42xuoyooVYjzu7sKsNoRGYlyALKq4MoBv11W8drI/vq/46N4axkVk+h0od47l5s
V54lPe9Rn69R2qoMK7xtq/g1wXxo7en5aUv/ZI47timkS7zm2d5zCIteZdsaRgvO
DdUn8OxtT1f1IsU9sccZe1nQ2xVP1SdvHE7otPbXLaeV31ByK0nkMekv9BaLcxFj
DaVTy9Ga8+N3Sdwm/stSJkT71YVkAGoKS0e1sxHZLo4yKTFn/uZaGiLJukpudM24
2unP57wZkIcuDdPdfmqCRp73YuCJmbVV9fnnPA6n6PYqAWWfFcE78cDe3zRxc5A/
TaZdRtERpc+wGg/6KjkLzmyqw+vYdpwrqxTLGgZj1F9oDGLORL2hCR2TwYaZV2lJ
rzLNcfHINpCmde7PpPsZ
=0t8l
-----END PGP SIGNATURE-----

--Sw7tCqrGA+HQ0/zt--
