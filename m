From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 02/20] clk: multiplier: Prevent the multiplier from under
 / over flowing
Date: Fri, 10 Jun 2016 14:31:38 +0200
Message-ID: <20160610123138.GX5242@lukather>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-3-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z8pjODCYYz+3zRe3"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463402840-17062-3-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--Z8pjODCYYz+3zRe3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

On Mon, May 16, 2016 at 02:47:02PM +0200, Maxime Ripard wrote:
> In the current multiplier base clock implementation, if the
> CLK_SET_RATE_PARENT flag isn't set, the code will not make sure that the
> multiplier computed remains within the boundaries of our clock.
>=20
> This means that if the clock we want to reach is below the parent rate,
> or if the multiplier is above the maximum that we can reach, we will end =
up
> with a completely bogus one that the clock cannot achieve.
>=20
> Fixes: f2e0a53271a4 ("clk: Add a basic multiplier clock")
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Any comments?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Z8pjODCYYz+3zRe3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXWrMqAAoJEBx+YmzsjxAgW+MP/RTwL+3hhvILaZapjZpT9/td
VI39fp64YttwWC0j8ck/rkp+y2o35fCZOKS1Kr63+hmTZO+g5/kITYo0ntNBC9Xy
emJCLeCAUnciQ/MXQ4Loog4jUHNhcEL6X0OtY/oQL3VoXT4ufR2fLMrNXgGRTi70
tkAJREL7idPpS3kIa3eyzL/mQ1f9Zvrn1jYjqt3GjiLcX7VMbSKz/OYXjO5PuIt/
loT9yq6DXbrOQY/hj3LnZpbYu9XCSuybTa2pY6TEuZYRbGsP72E/t9xhmxTtRKDK
oNCznEoK95keVQqEXk3Fjs/SNPFykbmEYQbtK7nwwfGMuxqJUARm+mLgcu/56QCE
BbFcPfT16vdxi55FBlpwWz/0LXODiFIf1yVzXrvnlS+czesTAL0R/wIx4i/6hDaL
AkWmT4+CDVYbx+74bEAXLHptyF5e6ne62yE6Y5uYe5j+EBZU6W4K/BRDNiZXH6CD
jlngV9fBoW/P81zMNYknProId01G4AOPBUxfGQKPQ3fhCdftCPfDu0qHf4F8I3cI
2aMDz4EMLAB5UY1Gxu02Vq9aPQ5TZwmjo1Z1M3O5/xQErEB9c5D53D2xuWFDhkUC
ZY5eidDSFPg3RXCkC58mjA8fmJ2IIsIuWliJP52x4PqtoU3FEXC+uT6Ia1yy23B+
kZY2B5z0e9+EPuw5B5e7
=fvQF
-----END PGP SIGNATURE-----

--Z8pjODCYYz+3zRe3--
