Return-Path: <SRS0=nUVv=LO=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1535698119-10132-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1535698119-10132-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1535698119-10132-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Aug 2018 09:22:12 +0200
Message-ID: <CAMuHMdXLCnOGvPNrBKoxh_ZzYTUZbp2XtLr-Pu6DDd5_9cXGiQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: renesas_usbhs: Add multiple clocks management
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Felipe Balbi <balbi@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg KH <gregkh@linuxfoundation.org>, USB list <linux-usb@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

On Fri, Aug 31, 2018 at 8:50 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> R-Car Gen3 needs to enable clocks of both host and peripheral.
> Since [eo]hci-platform disables the reset(s) when the drivers are
> removed, renesas_usbhs driver doesn't work correctly. To fix this
> issue, this patch adds multiple clocks management on this
> renesas_usbhs driver.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2011 Renesas Solutions Corp.
>   * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>   */
> +#include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/gpio.h>
>  #include <linux/io.h>
> @@ -336,11 +337,23 @@ static void usbhsc_power_ctrl(struct usbhs_priv *priv, int enable)
>  {
>         struct platform_device *pdev = usbhs_priv_to_pdev(priv);
>         struct device *dev = usbhs_priv_to_dev(priv);
> +       int ret;
>
>         if (enable) {
>                 /* enable PM */
>                 pm_runtime_get_sync(dev);
>
> +               /* enable clks if exist */
> +               if (priv->clks) {
> +                       ret = clk_bulk_prepare(priv->num_clks, priv->clks);
> +                       if (!ret) {
> +                               ret = clk_bulk_enable(priv->num_clks,
> +                                                     priv->clks);
> +                               if (ret)
> +                                       return;

clk_bulk_prepare_enable(), which also takes care of unpreparing all
clocks if any clock fails to enabled.

> +                       }
> +               }
> +
>                 /* enable platform power */
>                 usbhs_platform_call(priv, power_ctrl, pdev, priv->base, enable);
>
> @@ -353,6 +366,12 @@ static void usbhsc_power_ctrl(struct usbhs_priv *priv, int enable)
>                 /* disable platform power */
>                 usbhs_platform_call(priv, power_ctrl, pdev, priv->base, enable);
>
> +               /* disable clks if exist */
> +               if (priv->clks) {
> +                       clk_bulk_disable(priv->num_clks, priv->clks);
> +                       clk_bulk_unprepare(priv->num_clks, priv->clks);

clk_bulk_disable_unprepare()

> +               }
> +
>                 /* disable PM */
>                 pm_runtime_put_sync(dev);
>         }
> @@ -534,6 +553,11 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
>         return info;
>  }
>
> +static const struct clk_bulk_data usbhs_rcar3_clks[] = {
> +       { .id = "hsusb" },
> +       { .id = "ehci/ohci" },
> +};

This structure contains space for the clock pointers, which are not really
needed here (the struct is copied).

Perhaps you can replace "struct clk_bulk_data *clks" in struct usbhs_priv
replace by "struct clk_bulk_data clks[2]", ...

> +
>  static int usbhs_probe(struct platform_device *pdev)
>  {
>         struct renesas_usbhs_platform_info *info = renesas_usbhs_get_info(pdev);
> @@ -620,6 +644,15 @@ static int usbhs_probe(struct platform_device *pdev)
>                 break;
>         }
>
> +       if (priv->dparam.type == USBHS_TYPE_RCAR_GEN3 ||
> +           priv->dparam.type == USBHS_TYPE_RCAR_GEN3_WITH_PLL) {
> +               priv->clks = devm_kmemdup(&pdev->dev, usbhs_rcar3_clks,
> +                                         sizeof(usbhs_rcar3_clks), GFP_KERNEL);
> +               if (!priv->clks)
> +                       return -ENOMEM;

... and instead of allocating/copying, fill in the clock names here:

    priv->clks[0].id = "hsusb";
    priv->clks[1].id = "ehci/ohci";

As priv->clks will no longer be a pointer, all checks for it should be
replaced by checks for priv->num_clks.

What do you think?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
