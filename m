From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 3/6] drm/sun4i: tcon: Add dithering support for
 RGB565/RGB666 LCD panels
Date: Thu, 19 Apr 2018 15:31:54 +0200
Message-ID: <20180419133154.2w2obz2su4pfmk25@flea>
References: <20180419093225.614-1-wens@csie.org>
 <20180419093225.614-4-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2142051665=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180419093225.614-4-wens@csie.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jonathan Liu <net147@gmail.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2142051665==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ljq2lntxmyrq7fgp"
Content-Disposition: inline


--ljq2lntxmyrq7fgp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 19, 2018 at 05:32:22PM +0800, Chen-Yu Tsai wrote:
> From: Jonathan Liu <net147@gmail.com>
>=20
> The hardware supports dithering on TCON channel 0 which is used for LCD
> panels.
>=20
> Dithering is a method of approximating a color from a mixture of other
> colors when the required color isn't available. It reduces color
> banding artifacts that can be observed when displaying gradients
> (e.g. grayscale gradients). This may occur when the image that needs
> to be displayed is 24-bit but the LCD panel is a lower bit depth and
> does not perform dithering on its own.
>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> [wens@csie.org: check display_info.bpc first; handle LVDS and MIPI DSI]
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>=20
> Hi Maxime,
>=20
> The dithering parameters used here are different from the ones you used
> in your MIPI DSI series. You might want to check if it still works for
> you.
>=20
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 63 +++++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index 2bd53ef7d4b8..827518f4790e 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -12,6 +12,7 @@
> =20
>  #include <drm/drmP.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_encoder.h>
> @@ -276,8 +277,59 @@ static void sun4i_tcon0_mode_set_common(struct sun4i=
_tcon *tcon,
>  		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
>  }
> =20
> +static void sun4i_tcon0_mode_set_dithering(struct sun4i_tcon *tcon,
> +					   const struct drm_connector *connector)
> +{
> +	u32 bus_format =3D 0;
> +	u32 val =3D 0;
> +
> +	/* XXX Would this ever happen? */
> +	if (!connector)
> +		return;
> +
> +	/*
> +	 * FIXME: Undocumented bits
> +	 *
> +	 * The whole dithering process and these parameters are not
> +	 * explained in the vendor documents or BSP kernel code.
> +	 */
> +	regmap_write(tcon->regs, SUN4I_TCON0_FRM_SEED_PR_REG, 0x11111111);
> +	regmap_write(tcon->regs, SUN4I_TCON0_FRM_SEED_PG_REG, 0x11111111);
> +	regmap_write(tcon->regs, SUN4I_TCON0_FRM_SEED_PB_REG, 0x11111111);
> +	regmap_write(tcon->regs, SUN4I_TCON0_FRM_SEED_LR_REG, 0x11111111);
> +	regmap_write(tcon->regs, SUN4I_TCON0_FRM_SEED_LG_REG, 0x11111111);
> +	regmap_write(tcon->regs, SUN4I_TCON0_FRM_SEED_LB_REG, 0x11111111);
> +	regmap_write(tcon->regs, SUN4I_TCON0_FRM_TBL0_REG, 0x01010000);
> +	regmap_write(tcon->regs, SUN4I_TCON0_FRM_TBL1_REG, 0x15151111);
> +	regmap_write(tcon->regs, SUN4I_TCON0_FRM_TBL2_REG, 0x57575555);
> +	regmap_write(tcon->regs, SUN4I_TCON0_FRM_TBL3_REG, 0x7f7f7777);
> +
> +	/* Do dithering if panel only supports 6 bits per color */
> +	if (connector->display_info.bpc =3D=3D 6)
> +		val |=3D SUN4I_TCON0_FRM_CTL_EN;
> +
> +	if (connector->display_info.num_bus_formats =3D=3D 1)
> +		bus_format =3D connector->display_info.bus_formats[0];
> +
> +	/* Check the connection format */
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		/* R and B components are only 5 bits deep */
> +		val |=3D SUN4I_TCON0_FRM_CTL_MODE_R;
> +		val |=3D SUN4I_TCON0_FRM_CTL_MODE_B;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +		/* Fall through: enable dithering */
> +		val |=3D SUN4I_TCON0_FRM_CTL_EN;
> +		break;
> +	}
> +
> +	/* Write dithering settings */
> +	regmap_write(tcon->regs, SUN4I_TCON_FRM_CTL_REG, val);
> +}
> +
>  static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
> -				     struct drm_encoder *encoder,
> +				     const struct drm_encoder *encoder,

The whole serie looks good, but that should probbaly be part of the
first patch?

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--ljq2lntxmyrq7fgp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrYmkkACgkQ0rTAlCFN
r3R7ghAAlvS3ytxEXd5ZaGTeI+NwFS7UvygZk1Yk8KyJ2GZnx2xyDwx3d9S27Slo
gWArRPiKwP3tYfzvBoi54XEw7Vg9NC9lpFF91DsRRAQikMmqVnw3Gs+K55Augxwx
OmBbtSo3Vd1U17zVlNM8sdKvC9cmXX19+Fz08tytIb1OXZVzj84AcY9sr3RURKXI
QmnCCzi+VApPnUFoRZ467ozXYczQA1QjxByWxt1CzmQCJOdGkt9SgUtvBBG8VayC
0xyx51adKdlwDbqT5VL09M3nsrBbbu/4/7fPJIknIpEuva+l2m2bDPhD7L+MIrcr
j0ujAgCESQuLUy7ZaW1H4x8j3DldEwY1+Y4olsxR3xzSs5f6l4QEiHFZmyebDzSg
UMv0w2WLycWRar77X+9dr8IQssq4Vlnxqi6jVlQVi0YYFVltdw/eiaviB4fFksun
xfIL45ovF+hhC4QNpGw20NrhF/nowrjhydS9Xj+MWT+us/SVSc26JHAkeJvVPM6Z
7+Ex9Gg7tmKFO51nKFHB5MrjOKCN3Wu5nMia2G4wHUuE2/HjumLI9+Vp1P7v2rjH
BRN6LrHXQOTg8QL7MEqas5TGc1/j99GvqtbvPypPL7w6qQWlaicUgcZrM7x49m1e
QhoRqCUuQWYAuNIWekrQpjYgPM/cNShBMn6eVQVKWyvMVa7oeCE=
=jc4r
-----END PGP SIGNATURE-----

--ljq2lntxmyrq7fgp--

--===============2142051665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2142051665==--
