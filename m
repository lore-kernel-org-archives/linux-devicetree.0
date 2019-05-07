From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH RE-RESEND 1/2] drm/panel: Add support for Armadeus ST0700 Adapt
Date: Tue, 7 May 2019 12:33:39 -0300
Message-ID: <CAOMZO5B2nMsVNO6O_D+YTSjux=-DjNPGxhkEi3AQquOZVODumA@mail.gmail.com>
References: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, stable <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

[Adding Sam, who is helping to review/collect panel-simple patches]

On Tue, May 7, 2019 at 12:27 PM S=C3=A9bastien Szymanski
<sebastien.szymanski@armadeus.com> wrote:
>
> This patch adds support for the Armadeus ST0700 Adapt. It comes with a
> Santek ST0700I5Y-RBSLW 7.0" WVGA (800x480) TFT and an adapter board so
> that it can be connected on the TFT header of Armadeus Dev boards.
>
> Cc: stable@vger.kernel.org # v4.19
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com=
>
> ---
>  .../display/panel/armadeus,st0700-adapt.txt   |  9 ++++++
>  drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/armad=
eus,st0700-adapt.txt
>
> diff --git a/Documentation/devicetree/bindings/display/panel/armadeus,st0=
700-adapt.txt b/Documentation/devicetree/bindings/display/panel/armadeus,st=
0700-adapt.txt
> new file mode 100644
> index 000000000000..a30d63db3c8f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/armadeus,st0700-ada=
pt.txt
> @@ -0,0 +1,9 @@
> +Armadeus ST0700 Adapt. A Santek ST0700I5Y-RBSLW 7.0" WVGA (800x480) TFT =
with
> +an adapter board.
> +
> +Required properties:
> +- compatible: "armadeus,st0700-adapt"
> +- power-supply: see panel-common.txt
> +
> +Optional properties:
> +- backlight: see panel-common.txt
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 9e8218f6a3f2..45ca8d10b66f 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -446,6 +446,32 @@ static const struct panel_desc ampire_am800480r3tmqw=
a1h =3D {
>         .bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
>  };
>
> +static const struct display_timing santek_st0700i5y_rbslw_f_timing =3D {
> +       .pixelclock =3D { 26400000, 33300000, 46800000 },
> +       .hactive =3D { 800, 800, 800 },
> +       .hfront_porch =3D { 16, 210, 354 },
> +       .hback_porch =3D { 45, 36, 6 },
> +       .hsync_len =3D { 1, 10, 40 },
> +       .vactive =3D { 480, 480, 480 },
> +       .vfront_porch =3D { 7, 22, 147 },
> +       .vback_porch =3D { 22, 13, 3 },
> +       .vsync_len =3D { 1, 10, 20 },
> +       .flags =3D DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +               DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE
> +};
> +
> +static const struct panel_desc armadeus_st0700_adapt =3D {
> +       .timings =3D &santek_st0700i5y_rbslw_f_timing,
> +       .num_timings =3D 1,
> +       .bpc =3D 6,
> +       .size =3D {
> +               .width =3D 154,
> +               .height =3D 86,
> +       },
> +       .bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
> +       .bus_flags =3D DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDG=
E,
> +};
> +
>  static const struct drm_display_mode auo_b101aw03_mode =3D {
>         .clock =3D 51450,
>         .hdisplay =3D 1024,
> @@ -2544,6 +2570,9 @@ static const struct of_device_id platform_of_match[=
] =3D {
>         }, {
>                 .compatible =3D "arm,rtsm-display",
>                 .data =3D &arm_rtsm,
> +       }, {
> +               .compatible =3D "armadeus,st0700-adapt",
> +               .data =3D &armadeus_st0700_adapt,
>         }, {
>                 .compatible =3D "auo,b101aw03",
>                 .data =3D &auo_b101aw03,
> --
> 2.19.2
>
