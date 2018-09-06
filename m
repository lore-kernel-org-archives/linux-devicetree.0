Return-Path: <SRS0=OJAt=LU=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1536213014-1325-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1536213014-1325-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1536213014-1325-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Sep 2018 09:28:14 +0200
Message-ID: <CAMuHMdWCKSBydcbFwKqGi9azVARFr-0YboC65Zgde24FJVeZZQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] usb: renesas_usbhs: Add multiple clocks management
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Felipe Balbi <balbi@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg KH <gregkh@linuxfoundation.org>, USB list <linux-usb@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

On Thu, Sep 6, 2018 at 7:52 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> R-Car Gen3 needs to enable clocks of both host and peripheral.
> Since [eo]hci-platform disables the reset(s) when the drivers are
> removed, renesas_usbhs driver doesn't work correctly. To fix this
> issue, this patch adds multiple clocks management on this
> renesas_usbhs driver.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c

> @@ -667,6 +684,12 @@ static int usbhs_probe(struct platform_device *pdev)
>         if (ret)
>                 goto probe_fail_rst;
>
> +       if (priv->num_clks) {
> +               ret = clk_bulk_get(&pdev->dev, priv->num_clks, priv->clks);

(inspired by Morimoto-san) clk_bulk_get() is a no-op if num_clks is zero.


> +               if (ret == -EPROBE_DEFER)

Why this special handling for -EPROBE_DEFER only?
Shouldn't all errors be considered fatal?

Perhaps this is needed for backwards compatibility with old DT?
In that case, you should do more thorough checking (first clock should
exist, second should return -ENOENT).

> +                       goto probe_fail_clks;
> +       }
> +
>         /*
>          * deviece reset here because
>          * USB device might be used in boot loader.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
