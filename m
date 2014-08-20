From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add HannStar HSD070PWW1 7.0" WXGA TFT LCD
 panel
Date: Wed, 20 Aug 2014 11:51:52 +0200
Message-ID: <20140820095151.GF15414@ulmo>
References: <1408463532-14903-1-git-send-email-p.zabel@pengutronix.de>
 <1408463532-14903-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0388473564=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1408463532-14903-2-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============0388473564==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zi0sgQQBxRFxMTsj"
Content-Disposition: inline


--Zi0sgQQBxRFxMTsj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 05:52:12PM +0200, Philipp Zabel wrote:
> This patch adds support for the HannStar Display Corp. HSD070PWW1 7.0"
> WXGA TFT LCD panel to the simple-panel driver. The binding documentation
> is included.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../bindings/panel/hannstar,hsd070pww1.txt         |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 25 ++++++++++++++++=
++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/hannstar,hsd0=
70pww1.txt
>=20
> diff --git a/Documentation/devicetree/bindings/panel/hannstar,hsd070pww1.=
txt b/Documentation/devicetree/bindings/panel/hannstar,hsd070pww1.txt
> new file mode 100644
> index 0000000..211c226
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/hannstar,hsd070pww1.txt
> @@ -0,0 +1,7 @@
> +HannStar Display Corp. HSD070PWW1 7.0" WXGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "hannstar,hsd070pww1"
> +
> +This binding is compatible with the simple-panel binding, which is speci=
fied
> +in simple-panel.txt in this directory.
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 4ce1db0..ddd651d 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -518,6 +518,28 @@ static const struct panel_desc foxlink_fl500wvr00_a0=
t =3D {
>  	},
>  };
> =20
> +static const struct drm_display_mode hannstar_hsd070pww1_mode =3D {
> +	.clock =3D 71100,
> +	.hdisplay =3D 1280,
> +	.hsync_start =3D 1280 + 0,
> +	.hsync_end =3D 1280 + 0 + 160,
> +	.htotal =3D 1280 + 0 + 160 + 0,
> +	.vdisplay =3D 800,
> +	.vsync_start =3D 800 + 0,
> +	.vsync_end =3D 800 + 0 + 23,
> +	.vtotal =3D 800 + 0 + 23 + 0,

Horizontal and vertical porches are 0, that doesn't look right.

> +	.vrefresh =3D 60,
> +};
> +
> +static const struct panel_desc hannstar_hsd070pww1 =3D {
> +	.modes =3D &hannstar_hsd070pww1_mode,
> +	.num_modes =3D 1,
> +	.size =3D {
> +		.width =3D 151,
> +		.height =3D 94,
> +	},
> +};

This is missing a value for the .bpc field.

Thierry

--Zi0sgQQBxRFxMTsj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT9G+3AAoJEN0jrNd/PrOhKiEP/2CkzsKw1HDSA2e3ugG9h3Cw
oLiVJGEK/9Oprxm96G3ynBgkyVIaA/xtLE+94Psf5FAzugH+gTzzKZp6p9HtW5FS
nRBGmQM4j3oRCGgEBE3Zi0qtT7VasStqN63yG0Iwqqf12jCEn7hgJ2DCWkEuUvN5
qp4qA1bcMd4jPQcTXBCphHTHEs6lTEauFFpKML1W/hzynLhEyFJVLJpgkV86o8wO
2BIHbdjzeZsad/6fpXbySkxjvQb8QpGFbRDPKP8svorLBJrcC6VlcSdJ5uYpvq+9
M6F1vtrYTpA7zf3R4myYRyjgUU+ucdJpWm6tN/Tz4tZzAALgcKwxy7ki73RLAkTZ
dNhOISdti4dGnA//7zX8NKlbvO+9cBqXaNwo5DLG27cvvGC11kPe3fM32h2TOTEW
A5gJ/MRyK7iXIRidb31TD3B16Sg2z8cWyPlvnd3agMd/x/n9PPJVswi0AJHdbegp
ZWPAl51BZjzn4Ct8AT5OofkKrfDWHHf6/1NvRpR1iH7XXYokxl1OrDjsc6saO/WT
MwD7itE3vaZVCaIoUIHYxh0OpGgGdzAyt3ehR1+VExTFyTFxYBoLaw+UJ0IZ78Zr
0X4vULKaxw30NjrNYzl8F8cFrY+lSHnykLUanL/HOlR7MKDjuUfco0w587Bcz1BL
vzB6wJ8WodzsIgY+IE9i
=drsx
-----END PGP SIGNATURE-----

--Zi0sgQQBxRFxMTsj--

--===============0388473564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0388473564==--
