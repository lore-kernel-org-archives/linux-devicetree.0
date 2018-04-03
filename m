From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH net-next 02/12] clk: sunxi-ng: r40: export a regmap to
 access the GMAC register
Date: Tue, 3 Apr 2018 11:48:45 +0200
Message-ID: <20180403094845.le2hfuxktlv66lre@flea>
References: <20180317092857.4396-1-wens@csie.org>
 <20180317092857.4396-3-wens@csie.org>
 <20180318213129.ucwslzvwq6khxrcd@flea>
 <CAGb2v67Fp20wkmqWyRowpAmm4EDwENnKFG+mccqWaPa5Jj4zBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="if2i7d7qtqsuyll7"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67Fp20wkmqWyRowpAmm4EDwENnKFG+mccqWaPa5Jj4zBw@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: devicetree@vger.kernel.org


--if2i7d7qtqsuyll7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2018 at 03:15:02PM +0800, Chen-Yu Tsai wrote:
> On Mon, Mar 19, 2018 at 5:31 AM, Maxime Ripard
> <maxime.ripard@bootlin.com> wrote:
> > On Sat, Mar 17, 2018 at 05:28:47PM +0800, Chen-Yu Tsai wrote:
> >> From: Icenowy Zheng <icenowy@aosc.io>
> >>
> >> There's a GMAC configuration register, which exists on A64/A83T/H3/H5 =
in
> >> the syscon part, in the CCU of R40 SoC.
> >>
> >> Export a regmap of the CCU.
> >>
> >> Read access is not restricted to all registers, but only the GMAC
> >> register is allowed to be written.
> >>
> >> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >
> > Gah, this is crazy. I'm really starting to regret letting that syscon
> > in in the first place...
>=20
> IMHO syscon is really a better fit. It's part of the glue layer and
> most other dwmac user platforms treat it as such and use a syscon.
> Plus the controls encompass delays (phase), inverters (polarity),
> and even signal routing. It's not really just a group of clock controls,
> like what we poorly modeled for A20/A31. I think that was really a
> mistake.
>=20
> As I mentioned in the cover letter, a slightly saner approach would
> be to let drivers add custom syscon entries, which would then require
> less custom plumbing.

A syscon is convenient, sure, but it also bypasses any abstraction
layer we have everywhere else, which means that we'll have to maintain
the register layout in each and every driver that uses it.

So far, it's only be the GMAC, but it can also be others (the SRAM
controller comes to my mind), and then, if there's any difference in
the design in a future SoC, we'll have to maintain that in the GMAC
driver as well.

> > And I'm not really looking forward the time where SCPI et al. will be
> > mature and we'll have the clock controller completely outside of our
> > control.
>=20
> I don't think it's going to happen for any of the older SoCs. The R40
> only stands out because the GMAC controls are in the clock controller
> address space, presumably to be like the A20.

SCPI (or equivalent) is a really nice feature to have when it comes to
virtualization, so even if it's less likely, it doesn't make it less
relevant on other SoCs.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--if2i7d7qtqsuyll7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrDTfwACgkQ0rTAlCFN
r3QGIA/8CNahjK3IeUXNQHabx7OLrtTlS4qP22PFlopdNI9/AvaYIpFz1XO7nu4/
Skyo80Ao9cvkvT8SPeYqOVrocGAO5EHrbTSu7mjcn+jbrL1PVeKTlsnfBC9fT6n6
4tH3Kix3EWU7pfVG6qlyfu1DomRLxRZLdHoq1FDvt3J3OySmT8fl0JLNZlNzLvZO
HdxFuX4+dPO09XMzh2UFBR0jsXzMiPwWRIHQIhuN6zTyZdLf3eNtDEeVzW14Ph+f
Xsev67f1fErrJBLDPbvBocbHN7/rLJly7Vrhb7QKsoiQ+ZPxwWuvkGiGtGA09+l6
XcUU6z8mTYxzLE77LYdgaWWhIJFhuRb2cru5m+pSpx9KV6Z51SrRCZvxbhMeRSaz
hONvTT6g6+Su7BQd4tTLvP8nA7SicvylPvjazB18ViE/e9lu9EjjK68vwlxVGl91
1dM/H68xTYcULKxvlPGHLgmeA67Keuucz2G2pAQkEIxa/GSR7jwF1EGlVvlYWO6r
7rotN6/wZfcwf6HwQSn3XotmkRPCIlgOFkJlLCO7XCHXi3xo1inFPEyROiqzLix3
n47o7EijpI70+/DleZmy1TmAuandRJEIYJ60bZ3xwZIFj/PEfmSKpqSfCzt7dnEj
pmR/0saC8g68Am+OkTbT+Ox22toIfcXoaDtJZ4opkewIVeDl6Fo=
=vJfb
-----END PGP SIGNATURE-----

--if2i7d7qtqsuyll7--
