From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 08/15] drm/sun4i: Fix polarity configuration for DW HDMI
 PHY
Date: Mon, 26 Feb 2018 10:39:30 +0100
Message-ID: <20180226093930.mipjyr6sr35ldkw6@flea.lan>
References: <20180224214545.3740-1-jernej.skrabec@siol.net>
 <20180224214545.3740-9-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1008785388=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180224214545.3740-9-jernej.skrabec@siol.net>
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


--===============1008785388==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jbsyumb6moo5q7gr"
Content-Disposition: inline


--jbsyumb6moo5q7gr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Feb 24, 2018 at 10:45:38PM +0100, Jernej Skrabec wrote:
> Current polarity configuration code is cleary wrong since it compares
> same flag two times. However, even if flag name is fixed, it won't work
> well for resolutions which have one polarity positive and another
> negative.
>=20
> Fix that by properly set each bit according to each polarity. Since
> those two bits are not described in any documentation, relationships
> were obtained by experimentation.
>=20
> Fixes: b7c7436a5ff0 ("drm/sun4i: Implement A83T HDMI driver")
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun=
4i/sun8i_hdmi_phy.c
> index e5bfcdd43ec9..f48e8b70fabe 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> @@ -35,10 +35,11 @@ static int sun8i_hdmi_phy_config(struct dw_hdmi *hdmi=
, void *data,
>  	struct sun8i_hdmi_phy *phy =3D (struct sun8i_hdmi_phy *)data;
>  	u32 val =3D 0;
> =20
> -	if ((mode->flags & DRM_MODE_FLAG_NHSYNC) &&
> -	    (mode->flags & DRM_MODE_FLAG_NHSYNC)) {
> -		val =3D 0x03;
> -	}
> +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +		val |=3D 0x01;
> +
> +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +		val |=3D 0x02;

Can you introduce defines for those?

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--jbsyumb6moo5q7gr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqT1dEACgkQ0rTAlCFN
r3QV0RAAk2oUI5W3p9KMroT8DQt380PYBKasEzmuk7wCqvcnea6uMZ/xF1v2NCcT
uODf4PrsgIdKhhY7ODhJsh/wbAhtHuVFzKyNbENZLWKqFVG669RX5ZqdQ2dU+rmZ
tPbPfEPFmGETHJ2Mw15r9dNJZNO8jTBoeeUhChZ46AeVAN7vuB/AYxAj8Wf3RSlb
3PS9foTcRRmYHF4L+98aQj4S8snuf6w5FF6tP8KqSthdrg6EYy3TfhyIJiV2HvjO
CwFFDzF38xAW3TZ1wQZP2Pq5eaC5BFdbbDqnnshZ4gurPyiG+9GjH3xEAlYYUcBU
verXqRsv12Sf/7UpnFFXjsSxCW5eFSiPUbJcGLJ4x/O3WLBpKnRrNAmoLsHiFUK7
rN6jhPevrJ2UGhklDJA4yKrb2Q5vpTstmBGkyUEy4GDYF9IfT7RhJyL2zHPfS2QR
CpY6lPDNi6o4ggmAgzjWU9jTrxmuXDFFyhTVhDMHJCWNBA3xUgBl4zzRguvr1pIP
x7cefwu8GxcxicBcAVQsB9rWXdpeuY8zWeMzk1tpZoIM1J1HjrJsVJFgDuoCRdr5
OLacN9FEN80Og957ZMVpoRSXl++a119JtI1dnIqvWY6IfWd7MDadjG8r+/ZhrT04
vmQKzeJV/HOsU2Aui0ux03s/rqZEGLm3nYR8py/GjIM6z2qyOXg=
=oG2/
-----END PGP SIGNATURE-----

--jbsyumb6moo5q7gr--

--===============1008785388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1008785388==--
