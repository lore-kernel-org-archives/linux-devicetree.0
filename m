From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 01/10] drm/sun4i: sun6i_mipi_dsi: Compute burst mode loop
 N1 instruction delay
Date: Mon, 5 Nov 2018 11:38:01 +0100
Message-ID: <20181105103801.r6fo2qvmx6erx3zf@flea>
References: <20181103100900.30313-1-jagan@amarulasolutions.com>
 <20181103100900.30313-2-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0742456892=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181103100900.30313-2-jagan@amarulasolutions.com>
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


--===============0742456892==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n27jowqdf6ximj23"
Content-Disposition: inline


--n27jowqdf6ximj23
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 03, 2018 at 03:38:51PM +0530, Jagan Teki wrote:
> Loop N1 instruction delay for burst mode lcd panel are
> computed as per BSP code.
>=20
> Reference code is available in BSP
> (in drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
> dsi_dev[sel]->dsi_inst_loop_num.bits.loop_n1=3D
> (panel->lcd_ht-panel->lcd_x)*(150)/(panel->lcd_dclk_freq*8) - 50;
> =3D> (((mode->htotal - mode->hdisplay) * 150) / ((mode->clock / 1000) * 8=
)) - 50;
>=20
> So use the similar computation for loop N1 delay.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun=
4i/sun6i_mipi_dsi.c
> index 86430efd9054..da152c21ec62 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -394,7 +394,14 @@ static void sun6i_dsi_setup_burst(struct sun6i_dsi *=
dsi,
>  static void sun6i_dsi_setup_inst_loop(struct sun6i_dsi *dsi,
>  				      struct drm_display_mode *mode)
>  {
> -	u16 delay =3D 50 - 1;
> +	struct mipi_dsi_device *device =3D dsi->device;
> +	u16 delay;
> +
> +	if (device->mode_flags =3D=3D MIPI_DSI_MODE_VIDEO_BURST)
> +		delay =3D (((mode->htotal - mode->hdisplay) * 150) /
> +			((mode->clock / 1000) * 8)) - 50;
> +	else
> +		delay =3D 50 - 1;

Apart from the other comments, I'd really prefer to have a function
here that would take the mipi_dsi_device and compute the delay.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--n27jowqdf6ximj23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW+AdiQAKCRDj7w1vZxhR
xd1YAP0cc9SnJCCXSZG4yz5aGofn50wsdg4Wkja5/L2Cd2biggD/fV6c3VB/MrXU
t7mqkUsZuu/XYLFpu3BRprxhDSqNKgk=
=ux8o
-----END PGP SIGNATURE-----

--n27jowqdf6ximj23--

--===============0742456892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0742456892==--
