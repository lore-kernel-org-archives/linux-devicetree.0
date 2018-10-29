From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 16/25] drm/sun4i: sun6i_mipi_dsi: Add support for
 VCC-DSI voltage regulator
Date: Mon, 29 Oct 2018 10:31:42 +0100
Message-ID: <20181029093142.hgn4q6o7q32voutf@flea>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
 <20181026144344.27778-17-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1009723104=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181026144344.27778-17-jagan@amarulasolutions.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, linux-sunxi@googlegroups.com, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============1009723104==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c44lc6ofhu4n4dbs"
Content-Disposition: inline


--c44lc6ofhu4n4dbs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 26, 2018 at 08:13:35PM +0530, Jagan Teki wrote:
> Some boards have VCC-DSI pin connected to voltage regulator which may
> not be turned on by default.
>=20
> Add support for such boards by adding voltage regulator handling code to
> MIPI DSI driver.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Tested-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - new patch
> Changes for v2:
> - none
>=20
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 14 ++++++++++++++
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  3 +++
>  2 files changed, 17 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun=
4i/sun6i_mipi_dsi.c
> index 42bd7506abaf..bc57343592e0 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -949,6 +949,12 @@ static int sun6i_dsi_bind(struct device *dev, struct=
 device *master,
> =20
>  	dsi->drv =3D drv;
> =20
> +	ret =3D regulator_enable(dsi->regulator);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable regulator\n");
> +		return ret;
> +	}
> +

The regulator should be enabled only when the device is in use.

>  	drm_encoder_helper_add(&dsi->encoder,
>  			       &sun6i_dsi_enc_helper_funcs);
>  	ret =3D drm_encoder_init(drm,
> @@ -980,6 +986,7 @@ static int sun6i_dsi_bind(struct device *dev, struct =
device *master,
> =20
>  err_cleanup_connector:
>  	drm_encoder_cleanup(&dsi->encoder);
> +	regulator_disable(dsi->regulator);
>  	return ret;
>  }
> =20
> @@ -989,6 +996,7 @@ static void sun6i_dsi_unbind(struct device *dev, stru=
ct device *master,
>  	struct sun6i_dsi *dsi =3D dev_get_drvdata(dev);
> =20
>  	drm_panel_detach(dsi->panel);
> +	regulator_disable(dsi->regulator);
>  }
> =20
>  static const struct component_ops sun6i_dsi_ops =3D {
> @@ -1022,6 +1030,12 @@ static int sun6i_dsi_probe(struct platform_device =
*pdev)
>  		return PTR_ERR(base);
>  	}
> =20
> +	dsi->regulator =3D devm_regulator_get(dev, "vcc-dsi");
> +	if (IS_ERR(dsi->regulator)) {
> +		dev_err(dev, "Couldn't get regulator\n");
> +		return PTR_ERR(dsi->regulator);
> +	}
> +

You haven't updated the DT bindings accordingly.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--c44lc6ofhu4n4dbs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW9bTfgAKCRDj7w1vZxhR
xafeAQC/hk+cR3NR/oeGrMutYm3CO/ddSYmfepkr5BAd0Qg4YAEAn8uF6TFtcbAX
akK7hkY59vjG9MdW7yEzdyHdpeNZjgU=
=z4E+
-----END PGP SIGNATURE-----

--c44lc6ofhu4n4dbs--

--===============1009723104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1009723104==--
