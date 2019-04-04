From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/panel: Rocktech jh057n00900: Add terminating
 newlines to logging
Date: Thu, 4 Apr 2019 19:09:13 +0200
Message-ID: <20190404170913.GB3078@ulmo>
References: <cover.1554114302.git.agx@sigxcpu.org> <20190403161735.GN5238@ulmo>
 <1ed5eb3af4df6b2dd1544c7b696e034ed5c94f06.camel@perches.com>
 <20190404105359.GA8255@bogon.m.sigxcpu.org>
 <da6f2344396555034cf2476c8338b0ce1c56e0a7.camel@perches.com>
 <20190404154850.GA19334@bogon.m.sigxcpu.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1250409363=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190404154850.GA19334@bogon.m.sigxcpu.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Sam Ravnborg <sam@ravnborg.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Joe Perches <joe@perches.com>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============1250409363==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2019 at 05:48:50PM +0200, Guido G=C3=BCnther wrote:
> Hi Joe,
> On Thu, Apr 04, 2019 at 08:06:09AM -0700, Joe Perches wrote:
> > These were missing '\n' terminations, add them.
> >=20
> > Signed-off-by: Joe Perches <joe@perches.com>
> > ---
> >  drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c | 19 ++++++++++----=
-----
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c b/drive=
rs/gpu/drm/panel/panel-rocktech-jh057n00900.c
> > index 158a6d548068..d88ea8da2ec2 100644
> > --- a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> > +++ b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> > @@ -123,7 +123,7 @@ static int jh057n_init_sequence(struct jh057n *ctx)
> > =20
> >  	ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> >  	if (ret < 0) {
> > -		DRM_DEV_ERROR(dev, "Failed to exit sleep mode");
> > +		DRM_DEV_ERROR(dev, "Failed to exit sleep mode\n");
> >  		return ret;
> >  	}
> >  	/* Panel is operational 120 msec after reset */
> > @@ -132,7 +132,7 @@ static int jh057n_init_sequence(struct jh057n *ctx)
> >  	if (ret)
> >  		return ret;
> > =20
> > -	DRM_DEV_DEBUG_DRIVER(dev, "Panel init sequence done");
> > +	DRM_DEV_DEBUG_DRIVER(dev, "Panel init sequence done\n");
> >  	return 0;
> >  }
> > =20
> > @@ -172,7 +172,7 @@ static int jh057n_prepare(struct drm_panel *panel)
> >  	if (ctx->prepared)
> >  		return 0;
> > =20
> > -	DRM_DEV_DEBUG_DRIVER(ctx->dev, "Resetting the panel.");
> > +	DRM_DEV_DEBUG_DRIVER(ctx->dev, "Resetting the panel\n");
> >  	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> >  	usleep_range(20, 40);
> >  	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> > @@ -180,7 +180,8 @@ static int jh057n_prepare(struct drm_panel *panel)
> > =20
> >  	ret =3D jh057n_init_sequence(ctx);
> >  	if (ret < 0) {
> > -		DRM_DEV_ERROR(ctx->dev, "Panel init sequence failed: %d", ret);
> > +		DRM_DEV_ERROR(ctx->dev, "Panel init sequence failed: %d\n",
> > +			      ret);
> >  		return ret;
> >  	}
> > =20
> > @@ -212,7 +213,7 @@ static int jh057n_get_modes(struct drm_panel *panel)
> > =20
> >  	mode =3D drm_mode_duplicate(panel->drm, &default_mode);
> >  	if (!mode) {
> > -		DRM_DEV_ERROR(ctx->dev, "Failed to add mode %ux%u@%u",
> > +		DRM_DEV_ERROR(ctx->dev, "Failed to add mode %ux%u@%u\n",
> >  			      default_mode.hdisplay, default_mode.vdisplay,
> >  			      default_mode.vrefresh);
> >  		return -ENOMEM;
> > @@ -241,7 +242,7 @@ static int allpixelson_set(void *data, u64 val)
> >  	struct jh057n *ctx =3D data;
> >  	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> > =20
> > -	DRM_DEV_DEBUG_DRIVER(ctx->dev, "Setting all pixels on");
> > +	DRM_DEV_DEBUG_DRIVER(ctx->dev, "Setting all pixels on\n");
> >  	dsi_generic_write_seq(dsi, ST7703_CMD_ALL_PIXEL_ON);
> >  	msleep(val * 1000);
> >  	/* Reset the panel to get video back */
> > @@ -290,7 +291,7 @@ static int jh057n_probe(struct mipi_dsi_device *dsi)
> > =20
> >  	ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> >  	if (IS_ERR(ctx->reset_gpio)) {
> > -		DRM_DEV_ERROR(dev, "cannot get reset gpio");
> > +		DRM_DEV_ERROR(dev, "cannot get reset gpio\n");
> >  		return PTR_ERR(ctx->reset_gpio);
> >  	}
> > =20
> > @@ -315,12 +316,12 @@ static int jh057n_probe(struct mipi_dsi_device *d=
si)
> > =20
> >  	ret =3D mipi_dsi_attach(dsi);
> >  	if (ret < 0) {
> > -		DRM_DEV_ERROR(dev, "mipi_dsi_attach failed. Is host ready?");
> > +		DRM_DEV_ERROR(dev, "mipi_dsi_attach failed. Is host ready?\n");
> >  		drm_panel_remove(&ctx->panel);
> >  		return ret;
> >  	}
> > =20
> > -	DRM_DEV_INFO(dev, "%ux%u@%u %ubpp dsi %udl - ready",
> > +	DRM_DEV_INFO(dev, "%ux%u@%u %ubpp dsi %udl - ready\n",
> >  		     default_mode.hdisplay, default_mode.vdisplay,
> >  		     default_mode.vrefresh,
> >  		     mipi_dsi_pixel_format_to_bpp(dsi->format), dsi->lanes);
> >=20
>=20
> Reviewed-By: Guido G=C3=BCnther <agx@sigxcpu.org>

Nit: the correct tag is "Reviewed-by:", note the lowercase "by". I only
noticed because checkpatch complained, and fixed it up.

Thierry

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlymOjgACgkQ3SOs138+
s6G40Q//cfa/g8ByBehQaJpVRytIu6Yf5hdfJSIzvX++ulaGkhNnUs74vMkCkhbj
rkQ4c7OTv+zL0CEHb4WicWB8DKDWYCz3BU8I3BkHmlrBdbEnm1dK1R8L6vmIpR0K
XMSoyydNQxSOT7iykt7WXYaHy2eTRR1jePGKbDHVZyRcZoT0T/k+ae057GEju0BH
E6xt7ztcWXSRVxjW6KrmaF/sSvVGUDKsp2dBDOEHM0wDSZk09Avjf53LrP6UbDYX
3M7TeNoHW/FGP1AKTgXgNvdqsTvRL9PS8hp9EBFJqso8C9L59R4F282xRnvGnBnd
4Pw6K2Zo1gQdv+08oFwnSaP/CwOLzVROvCdRvuZsI6khUgtY9veyxcXTUnVxg6Aq
83V7OzMFplaK4OCfDrWoef2ISZaF1+TJxc10uskj/yQiLydY3l82Zgdtu9890LJZ
wcqAIi/+iIm7ADp1WnHzr+LauJf/mFc0NCFyUsmiVgWC48E70rt05OpYZbjLKLVH
RLjObOloJqyqywpGD+2VYpljAzn8wbzEknPP4iS2nJpbjSbtLSijnXhN+iBXPwRm
xJNLT252WwE77eoZzsZ8cqsCtS40SWcAOgRpVN0uDS4R6prN/L/b5smefAuGulbQ
xuXHXxrt7dGa+LOx0cnp/qYbN5s2rUchmbD5V3EQQPUVP7Nun/w=
=7pLZ
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--

--===============1250409363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1250409363==--
