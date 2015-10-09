From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] drm: panel: simple: add QiaoDian qd43003c0-40
Date: Thu, 8 Oct 2015 19:49:34 -0500
Message-ID: <CAL_JsqLAgnP-pAgE8xFoNiORco_jxVYVH3VVbJOsnKZ92M+U4g@mail.gmail.com>
References: <1444318961-31103-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1444318961-31103-2-git-send-email-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444318961-31103-2-git-send-email-alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 8, 2015 at 10:42 AM, Alexandre Belloni
<alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>
> The QiaoDian Xianshi QD43003C0-40 is a 4"3 TFT LCD panel.
>
> Timings from the OTA5180A document, ver 0.9, section
> 10.1.1:
>   http://www.orientdisplay.com/pdf/OTA5180A.pdf
>
> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../bindings/panel/qiaodian,qd43003c0-40.txt       |  7 ++++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

BTW, I'm moving bindings/panel/ to bindings/display/panel/ for 4.4.
It's fine to leave this, but if you do respin for some reason, can you
move this there.

Rob

>  drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/qiaodian,qd43003c0-40.txt
>
> diff --git a/Documentation/devicetree/bindings/panel/qiaodian,qd43003c0-40.txt b/Documentation/devicetree/bindings/panel/qiaodian,qd43003c0-40.txt
> new file mode 100644
> index 000000000000..0fbdab89ac3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/qiaodian,qd43003c0-40.txt
> @@ -0,0 +1,7 @@
> +QiaoDian XianShi Corporation 4"3 TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "qiaodian,qd43003c0-40"
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index f97b73ec4713..c93ffa615005 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1027,6 +1027,30 @@ static const struct panel_desc ortustech_com43h4m85ulc = {
>         .bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>  };
>
> +static const struct drm_display_mode qd43003c0_40_mode = {
> +       .clock = 9000,
> +       .hdisplay = 480,
> +       .hsync_start = 480 + 8,
> +       .hsync_end = 480 + 8 + 4,
> +       .htotal = 480 + 8 + 4 + 39,
> +       .vdisplay = 272,
> +       .vsync_start = 272 + 4,
> +       .vsync_end = 272 + 4 + 10,
> +       .vtotal = 272 + 4 + 10 + 2,
> +       .vrefresh = 60,
> +};
> +
> +static const struct panel_desc qd43003c0_40 = {
> +       .modes = &qd43003c0_40_mode,
> +       .num_modes = 1,
> +       .bpc = 8,
> +       .size = {
> +               .width = 95,
> +               .height = 53,
> +       },
> +       .bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +};
> +
>  static const struct drm_display_mode samsung_ltn101nt05_mode = {
>         .clock = 54030,
>         .hdisplay = 1024,
> @@ -1182,6 +1206,9 @@ static const struct of_device_id platform_of_match[] = {
>                 .compatible = "ortustech,com43h4m85ulc",
>                 .data = &ortustech_com43h4m85ulc,
>         }, {
> +               .compatible = "qiaodian,qd43003c0-40",
> +               .data = &qd43003c0_40,
> +       }, {
>                 .compatible = "samsung,ltn101nt05",
>                 .data = &samsung_ltn101nt05,
>         }, {
> --
> 2.1.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
