From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 07/10] drm/sun4i: sun6i_mipi_dsi: Enable burst mode HBP,
 HSA_HSE
Date: Mon, 5 Nov 2018 11:46:26 +0100
Message-ID: <20181105104626.ug4bwc3uc3vbyfpe@flea>
References: <20181103100900.30313-1-jagan@amarulasolutions.com>
 <20181103100900.30313-8-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1745004093=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181103100900.30313-8-jagan@amarulasolutions.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, TL Lim <tllim@pine64.org>, Michael Trimarchi <michael@amarulasolutions.com>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============1745004093==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bu2md7yzvsefbush"
Content-Disposition: inline


--bu2md7yzvsefbush
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 03, 2018 at 03:38:57PM +0530, Jagan Teki wrote:
> Horizontal back porch, sync active and sync end bits are
> needed to enable for burst mode panel operations.
>=20
> So, enable them via dsi base control register.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

What is needed seems to be the exact opposite. The bits to *disable*
them.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--bu2md7yzvsefbush
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW+AfggAKCRDj7w1vZxhR
xVJpAP93E//ivIyaeoaYleCIAQyafwRqAPOndZVGOV8XJ0tKQwEAtqu1KJ8+/KEe
YJK3pUtIz5OqYJItagRAae1rIuTpzQY=
=dgmO
-----END PGP SIGNATURE-----

--bu2md7yzvsefbush--

--===============1745004093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1745004093==--
