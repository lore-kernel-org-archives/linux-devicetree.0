From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] fdtdump: Prettify output of properties
Date: Fri, 16 Jun 2017 20:34:49 -0400
Message-ID: <20170617003449.GN10782@bill-the-cat>
References: <1497452030-15588-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497452030-15588-3-git-send-email-pantelis.antoniou@konsulko.com>
 <20170614150639.GF2614@umbus>
 <20170615235230.GP10782@bill-the-cat>
 <594331A0.6050305@gmail.com>
 <20170616154017.GW10782@bill-the-cat>
 <59442B0F.4010706@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PIEZ4LQf+x+Fvnf3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <59442B0F.4010706-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--PIEZ4LQf+x+Fvnf3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2017 at 12:01:35PM -0700, Frank Rowand wrote:
> On 06/16/17 08:40, Tom Rini wrote:
> > On Thu, Jun 15, 2017 at 06:17:20PM -0700, Frank Rowand wrote:
> >> Hi Tom,
> >>
> >> On 06/15/17 16:52, Tom Rini wrote:
> >>> On Wed, Jun 14, 2017 at 11:06:39PM +0800, David Gibson wrote:
> >>>> On Wed, Jun 14, 2017 at 05:53:49PM +0300, Pantelis Antoniou wrote:
> >>>>> Dumping files with large properties results in output with
> >>>>> arbitrary long lines.
> >>>>>
> >>>>> Original (manual line breaks inserted; it's a single long line):
> >>>>>
> >>>>> / {
> >>>>>     int =3D <0x00000001 0x00000024 0x00000004 0x00000000 \
> >>>>> 0x000502a4 0x000000df 0x00000003 0x13885783 0x13885783 \
> >>>>> 0x00000002 0x62797465 0x00000000 0x00000000 0x00000000 \
> >>>>> 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 \
> >>>>> 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000>;
> >>>>> };
> >>>>>
> >>>>> After prettification:
> >>>>>
> >>>>> / {
> >>>>>     int =3D <0x00000001 0x00000002 0x00000008 0x00000010 0x00000024=
 0x000000ab>,
> >>>>>           <0x00000001 0x00000017 0x00000004 0x00000038 0x00000007 0=
x00000009>,
> >>>>>           <0x00000000 0x00000068 0x00000214 0x0000b8d9 0x000502a4 0=
x00000001>,
> >>>>>           <0x00000004 0x0000002b 0x000000df 0x00000003 0x00000002 0=
x00000001>;
> >>>>> };
> >>>>>
> >>>>> There are two new options (-w/--width) and (-S/--shift).
> >>>>>
> >>>>> Width is the terminal width, shift is the amount of spaces each nes=
t level
> >>>>> increases by.
> >>>>>
> >>>>> Width by default is set to 80, and shift to 4.
> >>>>
> >>>> Nack.
> >>>>
> >>>> fdtdump is supposed to be a trivial debug tool.   If you want to
> >>>> decompile dtbs "for real" use dtc -I dtb -O dts.
> >>>
> >>> There's been times, entirely unrelated to what Pantelis is doing, whe=
re
> >>> I've used fdtdump in production cases because I needed to whack a few
> >>> things around.  If it's just supposed to be a trivial debug tool, we'=
ve
> >>> likely moved well beyond the point where we need to keep trivial tools
> >>> around if they shouldn't be more widely used, IMHO.
> >>
> >> Let me paraphrase what I think that said:
> >>
> >>    If a trivial debug tool is used by a wide audience then we should g=
et
> >>    rid of the tool.
> >>
> >> I suspect I misunderstood.  Can you clarify?
> >=20
> > Sure.  Pantelis wants to improve a trivial debug tool to be slightly
> > more useful.  The maintainer says no, we shouldn't touch the tool, you
> > can use dtc -I dtb -O dts instead.  As that would also cover fdtdump
> > itself, it sounds like fdtdump is deprecated and should be removed, as
> > it's being used outside of the trivial debug use case.
>=20
> fdtdump is useful for debugging and provides several features that aren't
> available in 'dtc -I dtb -O dts'.

Agreed.

> The maintainer wants to keep the debug tool simple.

Maintainers prerogative, yes.

> Another tool (dtc)
> already exists to do what the proposed patch would add.

I disagree, or at least don't see it in 'dtc -I dtb -O dts' as there
would need to be another argument for "linebreak the output and continue
to be valid".  I just rebuilt from master and dumped a dtb I had around
to confirm (and checked the help, too).

> Somehow Pantelis and you then jumped to the conclusion that fdtdump
> should be removed.  This is the part that I don't get.  It is a useful
> tool that has features that are not otherwise available.  Why would
> you get rid of it?

It's not Pantelis, it's my argument.  And for the record, I say it's
useful too.  I'm arguing that the logical end point of the maintainers
argument is that fdtdump shouldn't be used anywhere by anyone, it's a
trivial debug tool that no one should be shipping.  It's like enabling
various debug options in the kernel.  The right tool for most people of
"I need to read a dtb" is to use dtc -I dtb -O dts, and if you're
working on dtc, that's when maybe you need another tool at times, so you
can see the internal steps.

> > Or, can we talk about improving fdtdump as being a valid tool working
> > with dtb files when 'dtc -I dtb -O dts' is not desired?
>=20
> That conflicts with the purpose (debug) and design goals (trivial)
> stated by the maintainer.

So what's the right tool for getting nice human readable output?  'dtc
-I dtb -O dts' will give you the arbitrarily long lines that this patch
fixes.

--=20
Tom

--PIEZ4LQf+x+Fvnf3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZRHkpAAoJEIf59jXTHXZSxK0P/1Zobg8a7j91yRKDLL6Ysn9Q
njg2s1X7yXAdZWBEV3KI3MJQQCmjwk02ktTfucFeyPeHjx+1ZOiVKyo4BYWnsYSL
VUkcS97121einh2ugnS8mrf407I6Lzm+6jcMeM5cCsnDD4Qo+D78CNZYHg4bJ8iD
FSyWsBcE6ekIkBtO5lp58SU6MrwMy3kKSLjHm8bxeINhDB3NkjnR3TSS7fvw+A2T
3iTgBA88uobWKhkkGt4oJ6nl5hRQc/0CNwDNhSdg5UJZfwGtO4GM8LE/QwQanj58
LT26/mber4gwZLlvPFDScmfd8ohoqKtF7gkclNHiUp959aZ/sWALFQYQrQore26X
SCYf34VgZoBsCVYoZc+8TKKYz8371jQnbqYYz4k57VNxxvbR0WhV4nk/XX4likbI
mB7QXC0//Ek66XpKM8HKgHUjd6jA0yDoDSA++Eru3XSrqd/ILzpcN1P+k8uTs8xM
YRD9dqlnaXtuzF//u47cA6x3kn941UXTHAXmHqiUlaPRQcrIza6M39BL4MepWIOR
QWV5BEWrrSGMy6S3/SHV2GXPLk73CGNvmWSXxwhcpimEq/8X+0H+2v3AaKSR9TMi
alJhxCsPOrzcIxnAVf3FWbeiyGsFw5gImC7072woWbDtSHThsUZRjxzBtcNknHOd
LHHtg1T94c3/tWmQbHfD
=9htb
-----END PGP SIGNATURE-----

--PIEZ4LQf+x+Fvnf3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
