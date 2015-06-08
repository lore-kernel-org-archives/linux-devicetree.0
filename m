From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 2/3] drm/rockchip: implement dw_hdmi supplies for the
 Rockchip implementation
Date: Mon, 8 Jun 2015 16:49:09 +0200
Message-ID: <20150608144858.GF10354@ulmo.nvidia.com>
References: <1707049.JEvfTcofKv@diego>
 <17068264.uLYIadrGJJ@diego>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0668719820=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <17068264.uLYIadrGJJ@diego>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0668719820==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yQbNiKLmgenwUfTN"
Content-Disposition: inline


--yQbNiKLmgenwUfTN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2015 at 07:06:38PM +0200, Heiko St=C3=BCbner wrote:
> The Rockchip implementation of the IP exposes the supplies outside and
> expects them to be supplied by a pmic. So implement regulator handling
> for them.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> changes since v3:
> - split generic dt-bindings and rockchip implementation
> - add Ack from Philipp Zabel
> changes since v2:
> - rename supplies to the names found in the hdmi IP databook
> changes since v1:
> - follow suggestion from Russell King to keep regulator handling local
>   to the rockchip implementation for the time being and only generalize
>   when a real second implementation needs regulator handling
>=20
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 32 +++++++++++++++++++++++=
+++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/dr=
m/rockchip/dw_hdmi-rockchip.c
> index 80d6fc8..9c003fa 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -11,6 +11,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <drm/drm_of.h>
>  #include <drm/drmP.h>
>  #include <drm/drm_crtc_helper.h>
> @@ -28,6 +29,9 @@ struct rockchip_hdmi {
>  	struct device *dev;
>  	struct regmap *regmap;
>  	struct drm_encoder encoder;
> +	struct regulator_bulk_data supplies[2];
> +	int nsupplies;

unsigned int, please. Also I personally prefer the num_ prefix and it's
slightly more common in DRM code (even in the Rockchip driver).

> +	bool supplies_enabled;
>  };
> =20
>  #define to_rockchip_hdmi(x)	container_of(x, struct rockchip_hdmi, x)
> @@ -179,6 +183,12 @@ static struct drm_encoder_funcs dw_hdmi_rockchip_enc=
oder_funcs =3D {
> =20
>  static void dw_hdmi_rockchip_encoder_disable(struct drm_encoder *encoder)
>  {
> +	struct rockchip_hdmi *hdmi =3D to_rockchip_hdmi(encoder);
> +
> +	if (hdmi->nsupplies > 0 && hdmi->supplies_enabled) {
> +		regulator_bulk_disable(hdmi->nsupplies, hdmi->supplies);
> +		hdmi->supplies_enabled =3D false;
> +	}
>  }
> =20
>  static bool
> @@ -199,7 +209,16 @@ static void dw_hdmi_rockchip_encoder_commit(struct d=
rm_encoder *encoder)
>  {
>  	struct rockchip_hdmi *hdmi =3D to_rockchip_hdmi(encoder);
>  	u32 val;
> -	int mux;
> +	int mux, ret;
> +
> +	if (hdmi->nsupplies > 0 && !hdmi->supplies_enabled) {
> +		ret =3D regulator_bulk_enable(hdmi->nsupplies, hdmi->supplies);
> +		if (ret) {
> +			dev_err(hdmi->dev, "could not enable hdmi analog supplies\n");

"HDMI" please. And perhaps you want to add the error code to the message
as well?

> +			return;
> +		}
> +		hdmi->supplies_enabled =3D true;
> +	}
> =20
>  	mux =3D rockchip_drm_encoder_get_mux_id(hdmi->dev->of_node, encoder);
>  	if (mux)
> @@ -275,6 +294,17 @@ static int dw_hdmi_rockchip_bind(struct device *dev,=
 struct device *master,
>  	if (!iores)
>  		return -ENXIO;
> =20
> +	hdmi->supplies[0].supply =3D "vp";
> +	hdmi->supplies[1].supply =3D "vph";
> +	hdmi->nsupplies =3D 2;
> +
> +	ret =3D devm_regulator_bulk_get(hdmi->dev,
> +				      hdmi->nsupplies, hdmi->supplies);

I think it'd be slightly more idiomatic to put hdmi->nsupplies on the
first line.

Thierry

--yQbNiKLmgenwUfTN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVdatgAAoJEN0jrNd/PrOhfaEQAItyFh8BsI/blCD8pwVq9MF9
g8CXYsaxAMS1g+LcvyLiA41eQD/xoySJWSULcCo3oVm6sbJ1ViDxfOpYlyCezqIh
/TebqvKTpA+7gDaXPh+hI//N27ztlzuYrocJ5pfDOLC2BzEJhnmGWY9leAl709t2
/z3lx4llM9FBGp7irQYr63AfyglIDsHU2KYv9epE7nQ1y+82Ukut6Cv/FHNez0cu
l8HFpEPciKG2Sfn0xeDAbzJvCihaHPNL3bcCfJVgYkqLCVR0zTxXFZcVSNpXci76
RsqTonaeuUPTYpiWh0g5UMFBFdh2aGKGOqRoNDNKOayxFOlFQtK7MHZBXt82HJDS
a5M+xqyLOC9Kk/mE/H+C9B+dSfSAYs+ay139jRwxHSZ6fjnhO1r54IgN10yODAWk
VjBHyxAkHRLImhueXnOKQMHHLKQtC3m+YsEHc/o7jjP73vbKKQiFPhj/9VR6GkIG
174caGBrbkgTDbuzNEQpbcgbXb658oOQDNZe1yzyIBxW/GoKV/PCHi3Y9kwb6TuY
+IyinO7wt6294JbV86waAAz/YwdXCzJvQkKGsJ5wNrfmjlUOJxjBatSkDdM/wf4w
XDobYEhB3yup4fg26TZpTGBSn+j8j7zeegMCUMMG0iWyQVejkGqkVbumgGc+zF4w
jkFHg633vA8eaSRmMZXE
=jTBt
-----END PGP SIGNATURE-----

--yQbNiKLmgenwUfTN--

--===============0668719820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0668719820==--
