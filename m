From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/6] drm/panel: simple: Add support for LG
 LP097QX1-SPA1 2048x1536 panel
Date: Wed, 8 Jun 2016 13:20:22 +0100
Message-ID: <CACvgo50T++tDB-kC4=ZMRpHPxOoqn_E8+=LVbj7n_HOUgeTaMA@mail.gmail.com>
References: <1465386727-27647-1-git-send-email-ykk@rock-chips.com> <1465386753-27730-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465386753-27730-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Yakir,

On 8 June 2016 at 12:52, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> The LG LP097QX1-SPA1 is an 9.7", 2048x1536 (QXGA) TFT-LCD panel
> connected using eDP interfaces.
>
> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> Changes in v2: None
>
>  drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 3a7bdf1..41020e1 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1040,6 +1040,28 @@ static const struct panel_desc lg_lp120up1 = {
>         },
>  };
>
> +static const struct drm_display_mode lg_lp097qx1_spa1_mode = {
I believe that lg_lp097qx1_spa1 should be moved/sorted before lg_lp120up1.

> +static const struct panel_desc lg_lp097qx1_spa1 = {
> +       .modes = &lg_lp097qx1_spa1_mode,
> +       .num_modes = 1,
> +       .size = {
> +               .width = 2048,
> +               .height = 1536,
These are the physical dimensions of the panel. From the documentation
(at the top of the file)

@width: width (in millimeters) of the panel's active display area
...

Thierry, perhaps it's worth renaming 'size' it to
"physical_{size,dimensions}" and/or alike to make it clearer ?
Looks like we have a few cases were people got confused -
innolux_zj070na_01p and samsung_ltn101nt05.

Regards,
Emil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
