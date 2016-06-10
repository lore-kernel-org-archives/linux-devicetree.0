From: =?UTF-8?Q?St=C3=A9phane_Marchesin?= <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/6] drm/panel: simple: Add support for Samsung
 LSN122DL01-C01 2560x1600 panel
Date: Thu, 9 Jun 2016 17:04:03 -0700
Message-ID: <CACP_E+KFDF2VoXo4pRkAmd9wTcy7a6NTK9YpaPbtMD8=2f7e7Q@mail.gmail.com>
References: <1465386727-27647-1-git-send-email-ykk@rock-chips.com> <1465386762-27816-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465386762-27816-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 8, 2016 at 4:52 AM, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> The Samsung LSN122DL01-C01 is an 12.2" 2560x1600 (WQXGA) TFT-LCD pane=
l
> connected using eDP interfaces.
>
> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> Changes in v2: None
>
>  drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/p=
anel/panel-simple.c
> index 41020e1..067a5c4 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1246,6 +1246,28 @@ static const struct panel_desc qd43003c0_40 =3D=
 {
>         .bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
>  };
>
> +static const struct drm_display_mode samsung_lsn122dl01_c01_mode =3D=
 {
> +       .clock =3D 271560,
> +       .hdisplay =3D 2560,
> +       .hsync_start =3D 2560 + 48,
> +       .hsync_end =3D 2560 + 48 + 32,
> +       .htotal =3D 2560 + 48 + 32 + 80,
> +       .vdisplay =3D 1600,
> +       .vsync_start =3D 1600 + 2,
> +       .vsync_end =3D 1600 + 2 + 5,
> +       .vtotal =3D 1600 + 2 + 5 + 57,
> +       .vrefresh =3D 60,
> +};
> +
> +static const struct panel_desc samsung_lsn122dl01_c01 =3D {
> +       .modes =3D &samsung_lsn122dl01_c01_mode,
> +       .num_modes =3D 1,
> +       .size =3D {
> +               .width =3D 2560,
> +               .height =3D 1600,

These are meant to be the physical dimensions (same thing for the
other patches btw).

St=C3=A9phane

> +       },
> +};
> +
>  static const struct drm_display_mode samsung_ltn101nt05_mode =3D {
>         .clock =3D 54030,
>         .hdisplay =3D 1024,
> @@ -1506,6 +1528,9 @@ static const struct of_device_id platform_of_ma=
tch[] =3D {
>                 .compatible =3D "qiaodian,qd43003c0-40",
>                 .data =3D &qd43003c0_40,
>         }, {
> +               .compatible =3D "samsung,lsn122dl01-c01",
> +               .data =3D &samsung_lsn122dl01_c01,
> +       }, {
>                 .compatible =3D "samsung,ltn101nt05",
>                 .data =3D &samsung_ltn101nt05,
>         }, {
> --
> 1.9.1
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
