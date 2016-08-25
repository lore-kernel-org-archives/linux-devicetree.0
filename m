From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 1/6] clk: sunxi-ng: nkm: Correct mux clock macro name
Date: Thu, 25 Aug 2016 22:26:28 +0200
Message-ID: <20160825202628.GB32598@lukather>
References: <20160825062200.17206-1-wens@csie.org>
 <20160825062200.17206-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160825062200.17206-2-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2016 at 02:21:55PM +0800, Chen-Yu Tsai wrote:
> Mux support for NKM style clocks was added in commit a36583595c17 ("clk:
> sunxi-ng: nkm: Add mux to support multiple parents"). The macros for mux
> clocks was later changed in commit ad4578dc4cfa ("clk: sunxi-ng: mux:
> Rename mux macro to be consistent"), but the NKM style clock header was
> missed.
>=20
> Fix the macro name so NKM with mux compiles correctly.
>=20
> Fixes: a36583595c17 ("clk: sunxi-ng: nkm: Add mux to support multiple
> 		      parents")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes since v2: new patch

Squashed into the previous patch, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXv1R0AAoJEBx+YmzsjxAgM3YQAKss4K51lWyPBaFcY05mTOFa
JiG8PzGJ7QxAa2J8edB9YmbumCh3m9kKIXfzYCBkas0KO4Px58NvFuxpsz1wYOR6
Ol/3sdipi2AFmVCWOw+T0HKjweKFPy5sO+ox4hmwmXI5PkMs/VPHG46hlpHeqIEh
sjOAOHZ1TcK2poyMiv+o9DSX8n3RgQmeab83w1d/fzHTDg1b8kZim7C2q3yWEyJ0
5+k9sPIhctvLIfrZZmW28Zkyof+NTzK4umzI9niOHXjTRH+l5uWpBBNttLGqoMop
5RHY79MuyF0DKK28H8IYY2XBhqSOJ98+K9eJGCdr/eylTKwD2O2mEPY6+cN+xYU1
m5AtmISVvUgqnvY1bfb3BoDkZUemyXNHRQiwVV+JNb6RIjRRRp/EGT9Pe49OpeMH
ydfbPQRy9jtqkIWETwZhLnOsdeiqEHuhE6b0EwqJbGRLf8o7TpTLIDyh03mghr+4
t3nJgeD/FwQV+FpPSihDbAgX4RaXzaXMOsb+AqlpUdGeCsoLx09UUEwjHmFdmoIn
lDDmD++GKFSoacJdrzXauJEYye39x8CrBZXQjSUcDeOGGpMvQyQ5bLl/8P41Go1j
50zwWeA0UjYDTSHnDcdzitzyPX5Th0PUANGxKwpaYKcRGfW/8dNeUj6tU3A7L2vi
rvOWjwUy9xEitSNoMygG
=zsd0
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
