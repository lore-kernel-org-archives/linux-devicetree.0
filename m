From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v6 4/4] clk: dt: Introduce binding for always-on clock
 support
Date: Wed, 29 Apr 2015 22:27:52 +0200
Message-ID: <20150429202752.GH6062@lukather>
References: <20150407191746.GA26727@lukather>
 <20150408081450.GB5162@x1>
 <20150408094349.GC26727@lukather>
 <20150408103832.GG5162@x1>
 <20150408155705.GF26727@lukather>
 <20150408172344.GH5162@x1>
 <20150422093446.GA28007@lukather>
 <20150429141751.GR9169@x1>
 <CAMuHMdVdtoXGhK97Ky5hoVcjM6XZAZXKWELL64MFQebMpFr2Ng@mail.gmail.com>
 <20150429151147.GX9169@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hlh2aiwFLCZwGcpw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150429151147.GX9169@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel@stlinux.com, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--Hlh2aiwFLCZwGcpw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2015 at 04:11:47PM +0100, Lee Jones wrote:
> On Wed, 29 Apr 2015, Geert Uytterhoeven wrote:
> > On Wed, Apr 29, 2015 at 4:17 PM, Lee Jones <lee.jones@linaro.org> wrote:
> > > This useful binding should be accepted and people should not abuse
> > > it.  If they do and the vendor Maintainer's review and accept then
> > > they have no foundation for recourse.
> > >
> > > Would you prefer it if I made the warning starker?
> >=20
> > Perhaps you can add a check for "clock-always-on" to scripts/checkpatch=
=2Epl,
> > to make people aware they should think twice?
>=20
> That's a really nice idea!
>=20
> Maxime, would that make you happ(y|ier)?

Do whatever you want.

This binding is going to be merged no matter what, so my opinion has
really little value here.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Hlh2aiwFLCZwGcpw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVQT7IAAoJEBx+YmzsjxAgSswP/2ivhpAJy+3PMgsx+uu3x/LM
TthvqpFO9d7zha8ah007LMdHddgwGUC/boVMen6QTBQ3N6nkTXX2N8MwT/7USp1r
uB/GKICmIxK+zQz9vaqbhux1xRAgbF98myOj5NrxTjBPlJ+k5OESfzG6BQ4jdghu
NIsqnAqa68Tx9qkeygdIh1LpsKjlz8LUiMCAfHE8TQJIzwGiPc/vuoUBC+6cyL0c
V6DNprL9yBYpAeLoCnIuv9uOESJAkd9NtfND3o/cHVM+/Caw7uX4ARwudSHqqlGk
2yaoINcZdwb/uGM4K3Ag9ivVcL8E2kcTSN4kK+UsCMCpV1YKTUw0pk6IS+b9A8dg
nYOoMB+eZi5eTAThvz/DOEUt1+5+3uszMD8pIpRf6/0h7m3VTegc+uAeFHh0Jl7A
hkox9A/0g8O0/BqmYV29MCqzn1BtHuk4O7uk0Jr0tL9tGADG3DVcALbp2eI8dY88
X+HdAdBWC80csoS+ZSaBzvsMANa8/z+BwnCX4GUMnN4wCO+deHmNAH2vg6VbFwB+
BCXA7ecgfILVIbRiSEJzfMOEHZTlApi0U6jYQMublirRkNYlGAUrZ/S0F7KSNAx1
s7XsS2WVDZm5P1GDNPL3ZCBbqvMP+ROsAgmqCGpnW/3t5zLj3N/IrOmRj++eTgre
CfvsMN/f3M25CwwJCxV8
=12nB
-----END PGP SIGNATURE-----

--Hlh2aiwFLCZwGcpw--
