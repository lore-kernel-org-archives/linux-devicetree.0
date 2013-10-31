From: Mauro Carvalho Chehab <m.chehab@samsung.com>
Subject: Re: [Patch v2][ 13/37] staging: imx-drm: Add RGB666 support for
 parallel display
Date: Thu, 31 Oct 2013 11:18:32 -0200
Message-ID: <20131031111832.4246128f@samsung.com>
References: <1382022155-21954-1-git-send-email-denis@eukrea.com>
 <1382022155-21954-14-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1382022155-21954-14-git-send-email-denis@eukrea.com>
Sender: linux-media-owner@vger.kernel.org
To: Denis Carikli <denis@eukrea.com>
Cc: Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driverdev-devel@linuxdriverproject.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Em Thu, 17 Oct 2013 17:02:11 +0200
Denis Carikli <denis@eukrea.com> escreveu:

> Support the RGB666 format on the IPUv3 parallel display.
>=20
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: devicetree@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: driverdev-devel@linuxdriverproject.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-media@vger.kernel.org
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Eric B=C3=A9nard <eric@eukrea.com>
> Signed-off-by: Denis Carikli <denis@eukrea.com>

It seems better to apply this one together with the other DRM patches v=
ia
DRM tree. So:
	Acked-by: Mauro Carvalho Chehab <m.chehab@samsung.com>

> ---
>  .../bindings/staging/imx-drm/fsl-imx-drm.txt       |    2 +-
>  drivers/staging/imx-drm/ipu-v3/ipu-dc.c            |    9 +++++++++
>  drivers/staging/imx-drm/parallel-display.c         |    2 ++
>  3 files changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/staging/imx-drm/fsl-im=
x-drm.txt b/Documentation/devicetree/bindings/staging/imx-drm/fsl-imx-d=
rm.txt
> index b876d49..2d24425 100644
> --- a/Documentation/devicetree/bindings/staging/imx-drm/fsl-imx-drm.t=
xt
> +++ b/Documentation/devicetree/bindings/staging/imx-drm/fsl-imx-drm.t=
xt
> @@ -29,7 +29,7 @@ Required properties:
>  - crtc: the crtc this display is connected to, see below
>  Optional properties:
>  - interface_pix_fmt: How this display is connected to the
> -  crtc. Currently supported types: "rgb24", "rgb565", "bgr666"
> +  crtc. Currently supported types: "rgb24", "rgb565", "bgr666", "rgb=
666"
>  - edid: verbatim EDID data block describing attached display.
>  - ddc: phandle describing the i2c bus handling the display data
>    channel
> diff --git a/drivers/staging/imx-drm/ipu-v3/ipu-dc.c b/drivers/stagin=
g/imx-drm/ipu-v3/ipu-dc.c
> index 21bf1c8..c84ad22 100644
> --- a/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
> +++ b/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
> @@ -91,6 +91,7 @@ enum ipu_dc_map {
>  	IPU_DC_MAP_RGB565,
>  	IPU_DC_MAP_GBR24, /* TVEv2 */
>  	IPU_DC_MAP_BGR666,
> +	IPU_DC_MAP_RGB666,
>  };
> =20
>  struct ipu_dc {
> @@ -152,6 +153,8 @@ static int ipu_pixfmt_to_map(u32 fmt)
>  		return IPU_DC_MAP_GBR24;
>  	case V4L2_PIX_FMT_BGR666:
>  		return IPU_DC_MAP_BGR666;
> +	case V4L2_PIX_FMT_RGB666:
> +		return IPU_DC_MAP_RGB666;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -395,6 +398,12 @@ int ipu_dc_init(struct ipu_soc *ipu, struct devi=
ce *dev,
>  	ipu_dc_map_config(priv, IPU_DC_MAP_BGR666, 1, 11, 0xfc); /* green *=
/
>  	ipu_dc_map_config(priv, IPU_DC_MAP_BGR666, 2, 17, 0xfc); /* red */
> =20
> +	/* rgb666 */
> +	ipu_dc_map_clear(priv, IPU_DC_MAP_BGR666);
> +	ipu_dc_map_config(priv, IPU_DC_MAP_RGB666, 2, 17, 0xfc); /* red */
> +	ipu_dc_map_config(priv, IPU_DC_MAP_RGB666, 1, 11, 0xfc); /* green *=
/
> +	ipu_dc_map_config(priv, IPU_DC_MAP_RGB666, 0, 5, 0xfc); /* blue */
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/staging/imx-drm/parallel-display.c b/drivers/sta=
ging/imx-drm/parallel-display.c
> index c04b017..1c8f63f 100644
> --- a/drivers/staging/imx-drm/parallel-display.c
> +++ b/drivers/staging/imx-drm/parallel-display.c
> @@ -238,6 +238,8 @@ static int imx_pd_probe(struct platform_device *p=
dev)
>  			imxpd->interface_pix_fmt =3D V4L2_PIX_FMT_RGB565;
>  		else if (!strcmp(fmt, "bgr666"))
>  			imxpd->interface_pix_fmt =3D V4L2_PIX_FMT_BGR666;
> +		else if (!strcmp(fmt, "rgb666"))
> +			imxpd->interface_pix_fmt =3D V4L2_PIX_FMT_RGB666;
>  	}
> =20
>  	imxpd->dev =3D &pdev->dev;


--=20

Cheers,
Mauro
