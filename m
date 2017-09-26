From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 11/13] drm/sun4i: hdmi: Add support for A31's HDMI
 controller
Date: Tue, 26 Sep 2017 12:02:40 +0200
Message-ID: <20170926100240.es6fbqux3kfihd33@flea>
References: <20170926065919.24446-1-wens@csie.org>
 <20170926065919.24446-12-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2qgxzau3dwu4ouwz"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170926065919.24446-12-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--2qgxzau3dwu4ouwz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2017 at 06:59:17AM +0000, Chen-Yu Tsai wrote:
> The HDMI controller found in the A31 SoCs is slightly different
> from the one already supported, which is found in the A10s:
>=20
>   - Need different initial values for the PLL related registers
>=20
>   - Different behavior of the DDC and TMDS clocks
>=20
>   - Different register layout for the DDC portion
>=20
>   - Separate DDC parent clock
>=20
> This patch adds support for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2qgxzau3dwu4ouwz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyiXAAAoJEBx+YmzsjxAgeioP/iN9D2QOGK8lyvWE2COuF2qM
INwIJPqr1YrOFdbtmtNVkySBlYzVSEcmRov0gQlkn0/j5fBERuXDWPpzqWiVIpRz
z9QfEGDPGxjEHrCaA359dJWZBz//Sf5XQBv3C25BX/EqUDbedYnzcR6icpzyJHAY
vXEx20xDZaaRQAARLZMUY0w6A70hHFxNGyKS5JM7EwSb4FNTfRdsBr+rowmtPuRh
E0FsUFEvC0ITSuaKzDOYhDk6nEMqlFc9UzANoCEQksyY2KfznKuUOQchKm50S/Ob
u/Zf1ukZFBGaC+lle4qCgFa370g95LXxzt8flL0CCuBwajmUse0xA6W0fGFyiJMI
sAtai9lNekwgYyzNlBpc/YajECfu30G6k093a1ETuffQ7iALKc7437Z4DZG2MrCS
261KR4N57tObbtaaHjr5ofIDoUW/oky2QZbo6VqTc0+pU7AXLus5iDQ0j/dBjKBS
SvmL9aml+64+7AZve+rJuvg8xMDqtXea5OPSUvcCrfgiHgDITs9pIprR32IIfGaz
CA/4NRV0Hp8laZ09DezaaQqgWj3gZFscvaF2F73T5qrhEDSc/NE/u0Ugh0+xWLgj
nJsan6EZqQNLODTohgdTFVQ1dTEeVmFYJ7mCBu/2m6LhkahTaYUsBYF+pDNwochO
1OLmShsU+VPBj59g99MY
=79Tg
-----END PGP SIGNATURE-----

--2qgxzau3dwu4ouwz--
