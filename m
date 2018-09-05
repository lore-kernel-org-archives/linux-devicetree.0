Return-Path: <SRS0=QNtu=LT=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1535711579-15169-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1535711579-15169-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1535711579-15169-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Sep 2018 15:59:54 +0200
Message-ID: <CAMuHMdWroi7SDj+hrLYqwctHMZEzA8bC=VgykvPtUwy5Eqfx+A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] usb: renesas_usbhs: Add multiple clocks management
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Felipe Balbi <balbi@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg KH <gregkh@linuxfoundation.org>, USB list <linux-usb@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

On Fri, Aug 31, 2018 at 12:36 PM Yoshihiro Shimoda
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

> @@ -336,11 +337,26 @@ static void usbhsc_power_ctrl(struct usbhs_priv *priv, int enable)
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
> +               if (priv->num_clks) {
> +                       ret = clk_bulk_prepare(priv->num_clks, priv->clks);
> +                       if (!ret) {
> +                               ret = clk_bulk_enable(priv->num_clks,
> +                                                     priv->clks);
> +                               if (ret) {
> +                                       clk_bulk_unprepare(priv->num_clks,
> +                                                          priv->clks);
> +                                       return;
> +                               }
> +                       }

I think you misunderstood my comment: you can replace the calls to
clk_bulk_prepare() and clk_bulk_enable() by a single call to
clk_bulk_prepare_enable().


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
