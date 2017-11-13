From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v7 25/25] rcar-vin: enable support for r8a7796
Date: Mon, 13 Nov 2017 09:42:01 +0100
Message-ID: <CAMuHMdXP7jOK8LxMtUFkEn0ooPPuodomVr2sqkNX4idMzrmrpw@mail.gmail.com>
References: <20171111003835.4909-1-niklas.soderlund+renesas@ragnatech.se> <20171111003835.4909-26-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171111003835.4909-26-niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fukawa <tomoharu.fukawa.eb-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

CC DT

On Sat, Nov 11, 2017 at 1:38 AM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org> wrote:
> Add the SoC specific information for Renesas r8a7796.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Reviewed-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/media/rcar_vin.txt         |  1 +
>  drivers/media/platform/rcar-vin/rcar-core.c        | 64 ++++++++++++++++=
++++++
>  2 files changed, 65 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Docum=
entation/devicetree/bindings/media/rcar_vin.txt
> index df1abd0fb20386f8..ddf249c2276600d2 100644
> --- a/Documentation/devicetree/bindings/media/rcar_vin.txt
> +++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
> @@ -10,6 +10,7 @@ Depending on the instance the VIN input is connected to=
 external SoC pins, or
>  on Gen3 to a CSI-2 receiver.
>
>   - compatible: Must be one or more of the following
> +   - "renesas,vin-r8a7796" for the R8A7796 device
>     - "renesas,vin-r8a7795" for the R8A7795 device
>     - "renesas,vin-r8a7794" for the R8A7794 device
>     - "renesas,vin-r8a7793" for the R8A7793 device
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/=
platform/rcar-vin/rcar-core.c
> index b22f6596700d2479..e329de4ce0172e8d 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -1084,6 +1084,66 @@ static const struct rvin_info rcar_info_r8a7795es1=
 =3D {
>         },
>  };
>
> +static const struct rvin_info rcar_info_r8a7796 =3D {
> +       .chip =3D RCAR_GEN3,
> +       .use_mc =3D true,
> +       .max_width =3D 4096,
> +       .max_height =3D 4096,
> +
> +       .num_chsels =3D 5,
> +       .chsels =3D {
> +               {
> +                       { .csi =3D RVIN_CSI40, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI20, .chan =3D 0 },
> +                       { .csi =3D RVIN_NC, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI40, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI20, .chan =3D 0 },
> +               }, {
> +                       { .csi =3D RVIN_CSI20, .chan =3D 0 },
> +                       { .csi =3D RVIN_NC, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI40, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI40, .chan =3D 1 },
> +                       { .csi =3D RVIN_CSI20, .chan =3D 1 },
> +               }, {
> +                       { .csi =3D RVIN_NC, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI40, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI20, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI40, .chan =3D 2 },
> +                       { .csi =3D RVIN_CSI20, .chan =3D 2 },
> +               }, {
> +                       { .csi =3D RVIN_CSI40, .chan =3D 1 },
> +                       { .csi =3D RVIN_CSI20, .chan =3D 1 },
> +                       { .csi =3D RVIN_NC, .chan =3D 1 },
> +                       { .csi =3D RVIN_CSI40, .chan =3D 3 },
> +                       { .csi =3D RVIN_CSI20, .chan =3D 3 },
> +               }, {
> +                       { .csi =3D RVIN_CSI40, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI20, .chan =3D 0 },
> +                       { .csi =3D RVIN_NC, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI40, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI20, .chan =3D 0 },
> +               }, {
> +                       { .csi =3D RVIN_CSI20, .chan =3D 0 },
> +                       { .csi =3D RVIN_NC, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI40, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI40, .chan =3D 1 },
> +                       { .csi =3D RVIN_CSI20, .chan =3D 1 },
> +               }, {
> +                       { .csi =3D RVIN_NC, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI40, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI20, .chan =3D 0 },
> +                       { .csi =3D RVIN_CSI40, .chan =3D 2 },
> +                       { .csi =3D RVIN_CSI20, .chan =3D 2 },
> +               }, {
> +                       { .csi =3D RVIN_CSI40, .chan =3D 1 },
> +                       { .csi =3D RVIN_CSI20, .chan =3D 1 },
> +                       { .csi =3D RVIN_NC, .chan =3D 1 },
> +                       { .csi =3D RVIN_CSI40, .chan =3D 3 },
> +                       { .csi =3D RVIN_CSI20, .chan =3D 3 },
> +               },
> +       },
> +};
> +
>  static const struct of_device_id rvin_of_id_table[] =3D {
>         {
>                 .compatible =3D "renesas,vin-r8a7778",
> @@ -1117,6 +1177,10 @@ static const struct of_device_id rvin_of_id_table[=
] =3D {
>                 .compatible =3D "renesas,vin-r8a7795",
>                 .data =3D &rcar_info_r8a7795,
>         },
> +       {
> +               .compatible =3D "renesas,vin-r8a7796",
> +               .data =3D &rcar_info_r8a7796,
> +       },
>         { },
>  };
>  MODULE_DEVICE_TABLE(of, rvin_of_id_table);
> --
> 2.15.0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
