From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 02/12] clk: sunxi-ng: Use u64 for calculation of nkmp
 rate
Date: Thu, 8 Feb 2018 09:03:35 +0100
Message-ID: <20180208080335.uduk2aa6vdkaa5n3@flea>
References: <20180207211713.3638-1-jernej.skrabec@siol.net>
 <20180207211713.3638-3-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0229408365=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180207211713.3638-3-jernej.skrabec@siol.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: mark.rutland@arm.com, Jose.Abreu@synopsys.com, linux-sunxi@googlegroups.com, airlied@linux.ie, mturquette@baylibre.com, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sboyd@kernel.org, wens@csie.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0229408365==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gmiu3sxsclb4fsnm"
Content-Disposition: inline


--gmiu3sxsclb4fsnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 07, 2018 at 10:17:03PM +0100, Jernej Skrabec wrote:
> When parent rate is 24MHz and multiplier N >=3D 180, intermediate clock
> rate doesn't fit in 32 bit variable anymore.
>=20
> Because of that, introduce function for calculating clock rate which
> uses 64 bit variable for intermediate result.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

--gmiu3sxsclb4fsnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlp8BFYACgkQ0rTAlCFN
r3TClRAAg2q00R9Ae7dCh1Zyb5ztVhCT4VAqCTFiAZSlSW7NBYxrMCUBt1+JXl2H
tlld0BOW+3nVnMnql3U6unl8/lfqTsndVczVXEW/Qz+WNBQgqaS9jGfZSdgMcrLk
lgXd5cOvkvVBYQdFlkClQx5BbESN4l9MefFM++oVj08icksy+P5WLz39/PxZ0WG8
/GlTMs9+vl/d0OZRRnbRnzrDm58cy2GhIcedqJMP0wlsME5jA319aea2+2jAJSAP
Sxa3ds+oS0CifxVWqQam3uyUxuyOjPP+ZnNQNmhVBpqwYiPW2+NFGUm7AjUZ/ScP
0bBIybY1xqu6VjIWuzgF4TPeZQ5R0E5lOyTT7BwwKhbMZsR4LBjy4jCFQPQtAeHj
e21D/6tAZ2de3xlgIx2P7+Ij4a1Np2gI+s+2btj9pYAMEMFjojjbvG5eDepf32gq
E8QySefQE5dF82jFiM28IhucNUfgDM1+Ya5uisBzGvvVmiiHa516ePt9YNoGZS+J
jZ0bS6RXM0bzQXHnK8G9JhU53yZb/iDXbc3SlzFNH38vleFbOnVoHpOAW+6pQMHg
LpfHzvGa5Sd51+0/u+bLcbvvlFRuVAhDodES+8BdGlo8BoBE60JU1BoAX8/n4RGg
nxxQX28qhaw6Zg9wjrSlYVNmfrI5BXxF1tc9DQ+unLf8/fGeWlw=
=05Kc
-----END PGP SIGNATURE-----

--gmiu3sxsclb4fsnm--

--===============0229408365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0229408365==--
