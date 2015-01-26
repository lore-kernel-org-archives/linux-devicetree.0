From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4] drm/panel: Add support for AUO b101ean01 panel
Date: Mon, 26 Jan 2015 10:09:32 +0800
Message-ID: <CAGS+omCeD4X8_L=KevAcjxUFDpfw5fuNhZXK9O3_GBo5H-QMBA@mail.gmail.com>
References: <1422236845-25672-1-git-send-email-hl@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422236845-25672-1-git-send-email-hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: huang lin <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 26, 2015 at 9:47 AM, huang lin <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> The AUO b101ean01 panel is a 10.1" 1280x800 panel,
> which can be supported by the simple panel driver.
>
> Signed-off-by: huang lin <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Reviewed-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

>
> ---
>
> Changes in v4:
> - Add auo,b101ean01.txt file
>
>  .../devicetree/bindings/panel/auo,b101ean01.txt    |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/auo,b101ean01.txt
>
> diff --git a/Documentation/devicetree/bindings/panel/auo,b101ean01.txt b/Documentation/devicetree/bindings/panel/auo,b101ean01.txt
> new file mode 100644
> index 0000000..3590b07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/auo,b101ean01.txt
> @@ -0,0 +1,7 @@
> +AU Optronics Corporation 10.1" WSVGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "auo,b101ean01"
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index e95385b..24828e0 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -345,6 +345,29 @@ static const struct panel_desc auo_b101aw03 = {
>         },
>  };
>
> +static const struct drm_display_mode auo_b101ean01_mode = {
> +       .clock = 72500,
> +       .hdisplay = 1280,
> +       .hsync_start = 1280 + 147,
> +       .hsync_end = 1280 + 147 + 32,
> +       .htotal = 1280 + 147 + 32 + 21,
> +       .vdisplay = 800,
> +       .vsync_start = 800 + 4,
> +       .vsync_end = 800 + 4 + 4,
> +       .vtotal = 800 + 4 + 4 + 8,
> +       .vrefresh = 60,
> +};
> +
> +static const struct panel_desc auo_b101ean01 = {
> +       .modes = &auo_b101ean01_mode,
> +       .num_modes = 1,
> +       .bpc = 6,
> +       .size = {
> +               .width = 217,
> +               .height = 136,
> +       },
> +};
> +
>  static const struct drm_display_mode auo_b101xtn01_mode = {
>         .clock = 72000,
>         .hdisplay = 1366,
> @@ -727,6 +750,9 @@ static const struct of_device_id platform_of_match[] = {
>                 .compatible = "auo,b101aw03",
>                 .data = &auo_b101aw03,
>         }, {
> +               .compatible = "auo,b101ean01",
> +               .data = &auo_b101ean01,
> +       }, {
>                 .compatible = "auo,b101xtn01",
>                 .data = &auo_b101xtn01,
>         }, {
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
