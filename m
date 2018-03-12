Return-Path: <SRS0=Xcgh=GC=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1520799995-26347-2-git-send-email-ykaneko0929@gmail.com>
References: <1520799995-26347-1-git-send-email-ykaneko0929@gmail.com> <1520799995-26347-2-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Mar 2018 12:02:06 +0100
Message-ID: <CAMuHMdV3JHySCmNoeaNNwF7iewRo-hUJQbErONEyn6EpOh=Weg@mail.gmail.com>
Subject: Re: [PATCH/RFT 1/3] thermal: rcar_thermal: add r8a77995 support
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi  Kaneko-san,

On Sun, Mar 11, 2018 at 9:26 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Add support for R-Car D3 (r8a77995) thermal sensor.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Thanks for your patch!

> --- a/drivers/thermal/rcar_thermal.c
> +++ b/drivers/thermal/rcar_thermal.c

> @@ -77,13 +101,23 @@ struct rcar_thermal_priv {
>  #define rcar_priv_to_dev(priv)         ((priv)->common->dev)
>  #define rcar_has_irq_support(priv)     ((priv)->common->base)
>  #define rcar_id_to_shift(priv)         ((priv)->id * 8)
> -#define rcar_of_data(dev)              ((unsigned long)of_device_get_match_data(dev))
> -#define rcar_use_of_thermal(dev)       (rcar_of_data(dev) == USE_OF_THERMAL)
> +#define rcar_of_data(dev) \
> +       ((struct rcar_thermal_chip *)of_device_get_match_data(dev))

I think it would be better to get rid of this macro, as
of_device_get_match_data()
walks the rcar_thermal_dt_ids[] over and over again.

Instead, you can store a pointer to struct rcar_thermal_chip in struct
rcar_thermal_priv in rcar_thermal_probe().

> +#define rcar_use_of_thermal(dev)       (rcar_of_data(dev)->use_of_thermal)
> -#define USE_OF_THERMAL 1
>  static const struct of_device_id rcar_thermal_dt_ids[] = {
> -       { .compatible = "renesas,rcar-thermal", },
> -       { .compatible = "renesas,rcar-gen2-thermal", .data = (void *)USE_OF_THERMAL },
> +       {
> +               .compatible = "renesas,rcar-thermal",
> +               .data = (void *)&rcar_thermal,

This cast not needed.

> @@ -438,6 +473,7 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>         struct rcar_thermal_priv *priv;
>         struct device *dev = &pdev->dev;
>         struct resource *res, *irq;
> +       int nirq = rcar_of_data(dev)->type == RCAR_GEN3_THERMAL ? 2 : 1;

Why 2? Your DT patch has 3 interrupts, which matches the datasheet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
