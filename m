From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH net-next 02/12] clk: sunxi-ng: r40: export a regmap to
 access the GMAC register
Date: Tue, 3 Apr 2018 11:50:05 +0200
Message-ID: <20180403095005.skflxb7m2qzbhjix@flea>
References: <20180317092857.4396-1-wens@csie.org>
 <20180317092857.4396-3-wens@csie.org>
 <20180318213129.ucwslzvwq6khxrcd@flea>
 <CAGb2v67Fp20wkmqWyRowpAmm4EDwENnKFG+mccqWaPa5Jj4zBw@mail.gmail.com>
 <20180403094845.le2hfuxktlv66lre@flea>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="av7qcas4z2r6im7c"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180403094845.le2hfuxktlv66lre@flea>
Sender: netdev-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: devicetree@vger.kernel.org


--av7qcas4z2r6im7c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 03, 2018 at 11:48:45AM +0200, Maxime Ripard wrote:
> On Tue, Mar 20, 2018 at 03:15:02PM +0800, Chen-Yu Tsai wrote:
> > On Mon, Mar 19, 2018 at 5:31 AM, Maxime Ripard
> > <maxime.ripard@bootlin.com> wrote:
> > > On Sat, Mar 17, 2018 at 05:28:47PM +0800, Chen-Yu Tsai wrote:
> > >> From: Icenowy Zheng <icenowy@aosc.io>
> > >>
> > >> There's a GMAC configuration register, which exists on A64/A83T/H3/H=
5 in
> > >> the syscon part, in the CCU of R40 SoC.
> > >>
> > >> Export a regmap of the CCU.
> > >>
> > >> Read access is not restricted to all registers, but only the GMAC
> > >> register is allowed to be written.
> > >>
> > >> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > >
> > > Gah, this is crazy. I'm really starting to regret letting that syscon
> > > in in the first place...
> >=20
> > IMHO syscon is really a better fit. It's part of the glue layer and
> > most other dwmac user platforms treat it as such and use a syscon.
> > Plus the controls encompass delays (phase), inverters (polarity),
> > and even signal routing. It's not really just a group of clock controls,
> > like what we poorly modeled for A20/A31. I think that was really a
> > mistake.
> >=20
> > As I mentioned in the cover letter, a slightly saner approach would
> > be to let drivers add custom syscon entries, which would then require
> > less custom plumbing.
>=20
> A syscon is convenient, sure, but it also bypasses any abstraction
> layer we have everywhere else, which means that we'll have to maintain
> the register layout in each and every driver that uses it.
>=20
> So far, it's only be the GMAC, but it can also be others (the SRAM
> controller comes to my mind), and then, if there's any difference in
> the design in a future SoC, we'll have to maintain that in the GMAC
> driver as well.

I guess I forgot to say something, I'm fine with using a syscon we
already have.

I'm just questionning if merging any other driver using one is the
right move.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--av7qcas4z2r6im7c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrDTkwACgkQ0rTAlCFN
r3Q56g/9Ee1TKCQ+KPVFqvRo1KfWNGGP/TDfEKeo8w0hl/uzCiF1PZC/r1eTkGR3
c1AEDs93JrzUOOw4F6PemVr3kJQuLJN3w0CEoJEWaI+optdab8qxR9JIBpQPhU3y
UMu6Up1Nx+HA98sMpm+zam3f9ht+ZB6O3KPSLG/3KlQjb4t98g7SwwOKtsOGvir1
IhMjN5HMoPgnvWlg10t1yR0ri0DjSEQVpA4k2ewL4Xz+3ClaVm8Xg7Mf0XrWmsh2
HjZO0uKu3GMLs6fTcW5wPIxubp1+pZKnIVMqsrt6p4ndjZeaBWIt3wXegMKv6Kgz
3pZBtCSFnAQS9b6rFQOrhUh7OQTqVVwbsvJ9lfB/HIUNetw1oHHm3DJlICj0x6q7
lQtOLuBaXZWU13q5rfFYvy83fYIxpfvQ4y6P2W4ZkxC+oNKagHX9p8dkFqSHoq2o
tbrUIU/kiU1T20LUxxWLJuwbNi7gY6tdCSDcf3634eJny3sJUBVrOsC53w8gPan8
xGewEwXtEMmJ7f7r80tCuewOczrngPJRIQfBvNAcj6+vWD2gV48YiIuCzRAVVLnj
BwEn5W/1RFCueYgqcCFL92ItvUS3UM9iEjg6WbncSpDobm+qAJlSqAwLLTY2mqF1
MbTKRElgxP0lG4O3ujfuaEhzcHJy1GkMrMDGIRfnQ+7/IFfFEbc=
=5jlp
-----END PGP SIGNATURE-----

--av7qcas4z2r6im7c--
