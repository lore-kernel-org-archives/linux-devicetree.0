From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 00/13] arm64: Allwinner A64 support based on sunxi-ng
Date: Sun, 31 Jul 2016 10:51:40 +0200
Message-ID: <20160731085140.GX6215@lukather>
References: <20160726203041.29366-1-maxime.ripard@free-electrons.com>
 <20160727104623.e9ca7b708e5c6462f44a5d01@free.fr>
 <20160728200705.GG6682@lukather>
 <20160729074800.44b8860cc0a3d2dfcdde32ce@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z3PcgjD2qOzdkXVS"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160729074800.44b8860cc0a3d2dfcdde32ce@free.fr>
Sender: linux-clk-owner@vger.kernel.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--z3PcgjD2qOzdkXVS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2016 at 07:48:00AM +0200, Jean-Francois Moine wrote:
> On Thu, 28 Jul 2016 22:07:05 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > > > Let me know what you think,
> > >=20
> > > I don't see the interest to have common code for 32bits and 64bits.
> > > The clock driver of a SoC will never evolve, so, it is simpler to
> > > copy the source common with the H3 into a clean A64 clock driver.
> >=20
> > I'm not sure why 32 bits vs 64 bits matters here. We're going to share
> > a significant number of drivers already between armv7 and armv8, like
> > MMC, EMAC, I2C, and so on.
> >=20
> > And I expect to share the data in other SoCs for the A10, A13 and A20
> > for example, or A23/A33, which have a lot of clocks in common too.
>=20
> The interest of your sunxi-ng approach is that the clocks of each SoC
> is described in one file. Here you are mixing 2 SoCs in the same source
> file. The advantage is lost.

Because (and only because) the huge majority of those clocks are
shared between these SoCs.

If it differs in a significant way (like for the A31 that is currently
submitted), there's of course no reason to merge it in the same file.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--z3PcgjD2qOzdkXVS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXnbwcAAoJEBx+YmzsjxAgyGEQAIA12RaLZLIS23x/mm7svN2s
j5ymd6CHLHr7jmJS65Xpin+HB4gK4iUBUYtRuSAatKVHc/OqP0TK3h0FbA9Vz2d2
P78hqOqkiswS2l6EE8LK07V5vIKFWWwGaJQwuBIT4yJoFS7p9neYFqhlP8jy3bd1
OPV3bc8MUcosVKNDDdHZd9UNceQ8Fp+KZZ/id4E9eStTV46PQoL92qknxAWGT5OP
1vCBUuEFUVmx0MDZDui8k5WMxnHu4fEoYlYuhUeaS70qPs+3a21MC6XCrJkjHAaf
i9aZy6WgAbdIZ28YN5LAbjBotdZe8j5AdXKhCeMcsGy2N5Nr1eQlQX+Il5GEWbE0
Be+d0mtU3CfMNMS5V3QJguVYiZaWngz7IkewZ5kFJGeAvANjgVZ2x8WgsL6djR3k
7xgxtHD0OLLDOzPWHMpy9hBRK4//QW24+JJjH0mO0CLzZe3bDRqlQO9L1st3eoF3
EQXoQ/kSYyNM2aIroUg0TSPgy+cSuBXjJO9AhulBKdUmhOxzj35uZaBUlp/ttRVb
J8ltRdty9O8Wt0JUxfNiyYCjimJWkEOBj1KFBkvlkYZNKeBlEx0R18pISwcTU7Yd
sQLMo4QRK0ELLS0qfx01GshcYoxm35JlGHn9269gbwmHAAYUaOL/I5tfiWtsMjQ5
FtBsqr/oCpyamYOJlyUc
=HY54
-----END PGP SIGNATURE-----

--z3PcgjD2qOzdkXVS--
