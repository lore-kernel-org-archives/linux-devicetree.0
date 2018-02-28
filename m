From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 06/16] drm/sun4i: Don't process LVDS if TCON doesn't
 support it
Date: Wed, 28 Feb 2018 08:36:08 +0100
Message-ID: <20180228073608.r2zd3qkiudm2uarm@flea>
References: <20180227222701.9716-1-jernej.skrabec@siol.net>
 <20180227222701.9716-7-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0277569023=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180227222701.9716-7-jernej.skrabec@siol.net>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, mturquette@baylibre.com, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sboyd@kernel.org, wens@csie.org, robh+dt@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0277569023==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aqjrippsxme475qi"
Content-Disposition: inline


--aqjrippsxme475qi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2018 at 11:26:51PM +0100, Jernej Skrabec wrote:
> TCON checks for LVDS properties even if it doesn't support it. Add a
> check to skip that part of the code if TCON doesn't support channel 0.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

I have already sent a similar patch here:
https://lists.freedesktop.org/archives/dri-devel/2018-February/166665.html

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--aqjrippsxme475qi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqWW+cACgkQ0rTAlCFN
r3SGzQ//SGozme2gO0ALeJqnCLt8CQMYDzC1rRw0xfUb2agk3B881NEi3X5fIJUn
nTj9yAWBYvff/BlGerf/n6B7DFJdAvH7qX+t5mDIZlh5BxIAWTjmxiTPP0rSNakT
R2WSoI7yh+lBV4hTSy+DhMQ9mweINss8jQMKRdlnC78St415S7aG5lQ1mAvGWpeZ
Cf5en3JOsysN8kUQ1EL3gbRC0S+oRZT+Q2WNNlMF2nA8jIMkgENTY425RwJMDPUA
tIPJN1yeg4NG4IwpUA7TGoZnaT5htu5Z1f9X05AcyBMRo/v3SX+XpitLIYJtG9pQ
2oFgyTA6dSprW3fC0eRrqxydWh+xo69vdj84RSdRbPRbQINuHobAREkZ85gCFJG2
DayROsddA9CGM+L9G4nIMOIXjZl93tJLSWAJFhQocS78l1sEaYkSy0FmdV4Ugpui
uG7/Uyk0mnzW4dBS1afOuuFntoKmgp55qU9KIEtRV9v7FOpuKcoXnkVXuVdo2sbo
YdrksU8i9TRFLlcZGuH5tB9OUThgL5ZYEJYZKxjf0lP/eBwJpiuWFH5z9pGsZ5hH
WxZGduaudW0z3K+5vnXt1BDbBye4Gjm2umwYPJjqLihc5/w6kDb8TQSRTjkG9M6n
0zMAvak60eOlPvZ8w86JsZKSjM1EcUu1V4ZsHTx068cVmQYvwBw=
=nYue
-----END PGP SIGNATURE-----

--aqjrippsxme475qi--

--===============0277569023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0277569023==--
