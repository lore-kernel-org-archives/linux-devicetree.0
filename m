From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v9 2/4] drm/panel: simple: Add support for NEC
 NL4827HC19-05B 480x272 panel
Date: Tue, 14 Jul 2015 12:53:30 +0200
Message-ID: <20150714105328.GJ12465@ulmo.nvidia.com>
References: <1436784692-40560-1-git-send-email-jianwei.wang@freescale.com>
 <1436784692-40560-2-git-send-email-jianwei.wang@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0954155205=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1436784692-40560-2-git-send-email-jianwei.wang@freescale.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jianwei Wang <jianwei.wang@freescale.com>
Cc: devicetree@vger.kernel.org, Xiubo Li <lixiubo@cmss.chinamobile.com>, daniel.vetter@ffwll.ch, Alison Wang <b18965@freescale.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, scottwood@freescale.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0954155205==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="liqSWPDvh3eyfZ9k"
Content-Disposition: inline


--liqSWPDvh3eyfZ9k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2015 at 06:51:30PM +0800, Jianwei Wang wrote:
> This adds support for the NEC NL4827HC19-05B 480x272 panel to the DRM
> simple panel driver.
>=20
> Signed-off-by: Alison Wang <b18965@freescale.com>
> Signed-off-by: Xiubo Li <lixiubo@cmss.chinamobile.com>
> Signed-off-by: Jianwei Wang <jianwei.wang@freescale.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  .../bindings/panel/nec,nl4827hc19_05b.txt          |  7 ++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  MAINTAINERS                                        |  1 -
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++=
++++++
>  4 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/panel/nec,nl4827hc1=
9_05b.txt
>=20
> diff --git a/Documentation/devicetree/bindings/panel/nec,nl4827hc19_05b.t=
xt b/Documentation/devicetree/bindings/panel/nec,nl4827hc19_05b.txt
> new file mode 100644
> index 0000000..20e9473
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/nec,nl4827hc19_05b.txt
> @@ -0,0 +1,7 @@
> +NEC LCD Technologies,Ltd. WQVGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "nec,nl4827hc19_05b"
> +
> +This binding is compatible with the simple-panel binding, which is speci=
fied
> +in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docu=
mentation/devicetree/bindings/vendor-prefixes.txt
> index 8033919..9f22b3e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -131,6 +131,7 @@ mundoreader	Mundo Reader S.L.
>  murata	Murata Manufacturing Co., Ltd.
>  mxicy	Macronix International Co., Ltd.
>  national	National Semiconductor
> +nec	NEC LCD Technologies, Ltd.
>  neonode		Neonode Inc.
>  netgear	NETGEAR
>  netlogic	Broadcom Corporation (formerly NetLogic Microsystems)

This belongs in a separate patch.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index fffb8c9..e191ded 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3410,7 +3410,6 @@ M:	Alison Wang <alison.wang@freescale.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  F:	drivers/gpu/drm/fsl-dcu/
> -F:      Documentation/devicetree/bindings/drm/fsl-dcu/

What's this doing here?

>  F:      Documentation/devicetree/bindings/panel/nec,nl4827hc19_05b.txt
> =20
>  DRM DRIVERS FOR NVIDIA TEGRA
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index f94201b..eb12fe4 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1036,6 +1036,29 @@ static const struct panel_desc shelly_sca07010_bfn=
_lnn =3D {
>  	.bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
>  };
> =20
> +static const struct drm_display_mode nec_nl4827hc19_05b_mode =3D {
> +	.clock =3D 10870,
> +	.hdisplay =3D 480,
> +	.hsync_start =3D 480 + 2,
> +	.hsync_end =3D 480 + 2 + 41,
> +	.htotal =3D 480 + 2 + 41 + 2,
> +	.vdisplay =3D 272,
> +	.vsync_start =3D 272 + 2,
> +	.vsync_end =3D 272 + 2 + 4,
> +	.vtotal =3D 272 + 2 + 4 + 2,
> +	.vrefresh =3D 74,
> +};
> +
> +static const struct panel_desc nec_nl4827hc19_05b =3D {
> +	.modes =3D &nec_nl4827hc19_05b_mode,
> +	.num_modes =3D 1,
> +	.size =3D {
> +		.width =3D 95,
> +		.height =3D 54,
> +	},
> +	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X24
> +};
> +

Please keep these...

>  static const struct of_device_id platform_of_match[] =3D {
>  	{
>  		.compatible =3D "ampire,am800480r3tmqwa1h",
> @@ -1125,6 +1148,9 @@ static const struct of_device_id platform_of_match[=
] =3D {
>  		.compatible =3D "shelly,sca07010-bfn-lnn",
>  		.data =3D &shelly_sca07010_bfn_lnn,
>  	}, {
> +		.compatible =3D "nec,nl4827hc19_05b",
> +		.data =3D &nec_nl4827hc19_05b,
> +	}, {

and this sorted alphabetically.

Thierry

--liqSWPDvh3eyfZ9k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVpOooAAoJEN0jrNd/PrOhzXYQAJeineL4x1EBTz0uGW0xHAuP
wKFPv6M4Cle8TkddPu0BTe4nTKJ9YVP4hO0RG8IMLC/ZeZLwczXoi/TH2KF+M0Pk
mW6LLcGx75M3Zi5e1Ae/mYuadzgOxaOh9ub6WbETR13yJxLrDdTcuRSK63eoKE67
AAzVW+K9ilVFrabAPRMmvS90CDygL3iQD6DrLMu/uzxBsXBO/VOvRoCfTcTAJOmJ
Bkodkn/qVsW9N8ft8amIGapyMnrmBBycldxur8GAA3iIpsoTOWgGvokziWd29Lce
g4aYa5Ts9WyYcI4r3Ac/IjFfXK+5/9ciyIbqDgIiRM4L680ZcA9aY+V4xoJgO4Gy
1yWr8vaziGsPRZyduq3900Drq1CRjHgHiupJaHoHuk5gJi6fjSKfJYG0z1BbmzSv
pXywW14LGsJJNiCpyUWIu9l70dT7e5EqPzODM4X9az7Z53fJOObeKUObPR6wLPG6
o234Anl3347wFq5rktLtePzu30J27k7cNEdteOdspTQk7PF8bYpfVcU30R+gDNjA
is0UmoFswWzDubUb8L/E1IPJAqXj4d5tzkUgwyMJ4Xj0Yai4mvUUyPu0fo5jVAcm
YlmYXReEKSZSaAmVPDZ43IhP/551N+gVUJuvjjkQGtCtNUe41Jp0tfbDs81t5J/d
c/pDYx+bpGNEZfBVmdHd
=QKvB
-----END PGP SIGNATURE-----

--liqSWPDvh3eyfZ9k--

--===============0954155205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0954155205==--
