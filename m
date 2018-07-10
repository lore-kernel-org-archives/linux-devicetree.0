From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 1/4] drm/panel: p079zca: refactor panel driver to
 support multiple panels
Date: Tue, 10 Jul 2018 12:57:43 +0200
Message-ID: <20180710105743.GK1504@ulmo>
References: <20180702102721.3546-1-heiko@sntech.de>
 <20180702102721.3546-2-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0689894041=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180702102721.3546-2-heiko@sntech.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, hl@rock-chips.com, briannorris@chromium.org, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org


--===============0689894041==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W2ydbIOJmkm74tJ2"
Content-Disposition: inline


--W2ydbIOJmkm74tJ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 02, 2018 at 12:27:18PM +0200, Heiko Stuebner wrote:
> From: huang lin <hl@rock-chips.com>
>=20
> Refactor Innolux P079ZCA panel driver, let it support
> multi panels from Innolux that share similar power sequences.
>=20
> Panels may require different power supplies so use regulator bulk
> interfaces and define per panel supply-names.
>=20
> Changes in v2:
> - Change regulator property name to meet the panel datasheet
> Changes in v3:
> - this patch only refactor P079ZCA panel to support multi panel,
>   support P097PFG panel in another patch
> Changes in v4:
> - Modify the patch which suggest by Thierry
> Changes in v5:
> - use regulator_bulk to handle different supply number
>=20
> Signed-off-by: Lin Huang <hl@rock-chips.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/gpu/drm/panel/panel-innolux-p079zca.c | 143 ++++++++++++------
>  1 file changed, 100 insertions(+), 43 deletions(-)

Applied with minor changes, see below.

> diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/=
drm/panel/panel-innolux-p079zca.c
> index bb53e0850764..840ad4a6a6a6 100644
> --- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
> +++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
> @@ -20,12 +20,29 @@
> =20
>  #include <video/mipi_display.h>
> =20
> +struct panel_desc {
> +	const struct drm_display_mode *modes;

I renamed this to "mode" because there is always only one.

> +	unsigned int bpc;
> +	struct {
> +		unsigned int width;
> +		unsigned int height;
> +	} size;
> +
> +	unsigned long flags;
> +	enum mipi_dsi_pixel_format format;
> +	unsigned int lanes;
> +	const char * const *supply_names;
> +	unsigned int num_supplies;
> +};
> +
>  struct innolux_panel {
>  	struct drm_panel base;
>  	struct mipi_dsi_device *link;
> +	const struct panel_desc *desc;
> =20
>  	struct backlight_device *backlight;
> -	struct regulator *supply;
> +	struct regulator_bulk_data *supplies;
> +	unsigned int num_supplies;
>  	struct gpio_desc *enable_gpio;
> =20
>  	bool prepared;
> @@ -77,9 +94,7 @@ static int innolux_panel_unprepare(struct drm_panel *pa=
nel)
>  	/* T8: 80ms - 1000ms */
>  	msleep(80);
> =20
> -	err =3D regulator_disable(innolux->supply);
> -	if (err < 0)
> -		return err;
> +	regulator_bulk_disable(innolux->desc->num_supplies, innolux->supplies);

I kept the error check and return here.

Thierry

--W2ydbIOJmkm74tJ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltEkSUACgkQ3SOs138+
s6G5yA//f2D9uNuTm2WZxbSpNglRCQnqDnGKXpoRObsJpnLHrPmPO6U8hvr+OtOE
iyQRjIAmmWTM/LnEPv1VYcYaQFaxNgJ9GzYCUPE6pdxYOZ86yJUyGwpjJrzaHEGN
WMYta4vuwgDJNX2MzZUuVwm7EtXr93BzQa7myz0qpVGHaXMUi/+fR5ilL12J4upD
KwRw0zmqzAi+vVkstpnr5gTV6mLr3KF1FV1V/Y7iv7kCizZXLOyx6GWVAL3dvWTK
nmrxs+CWbzpH/zWRAETbpwbpfD7OHIoKiUP0PazuIkcm61xOJClpqKDr/TDtSmLa
ikZnPM8C7GNryVwpTk/qK0uUHLbRg7z5tp9CTUFm+T46pb7XpAHCZkGGDEX2q8q/
/qdS7xZg94JTN6KVd9O2GyBzNbrjceq+iawhHs+/dFmXlTmH/q2pVcd2np0m4yCC
Zkf8BdAz032Utaxbs2LgyKynPPN814JVac4YTTE21Mv0q9LQrv300Kq577MsR0Ph
Tj6VFpEh+gDkmT3OINCUoU3L5IqLGwotx88526tVE06i737V6E8dMV5uG8TPSpfB
S5gdhuNdxVO8ZYVI8/C1tfF02t+z5rzebwit0VM/BY6XDYwt+A5AFiwqDhvrmyKh
nH/vQUZidJR9hCt+8fnTZx0aoDkjeJGL+v2aS2gvcftj4Fh9Q4Q=
=08iG
-----END PGP SIGNATURE-----

--W2ydbIOJmkm74tJ2--

--===============0689894041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0689894041==--
