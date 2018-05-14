Return-Path: <SRS0=3T5d=IB=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1526008947-26667-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526008947-26667-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526008947-26667-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 May 2018 17:23:18 +0200
Message-ID: <CAMuHMdVSU3fok9BrA8Vz4AjddxNQX5etRrP23XckNdNK8HU3DA@mail.gmail.com>
Subject: Re: [PATCH 1/6] pinctrl: sh-pfc: Add PORT_GP_11 helper macro
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

On Fri, May 11, 2018 at 5:22 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This follows the style of existion PORT_GP_X macros and
> will be used by a follow-up patch for the r8a77990 SoC.

Thanks for your patch!

> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.18...

> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -415,9 +415,13 @@ struct sh_pfc_soc_info {
>         PORT_GP_CFG_1(bank, 9,  fn, sfx, cfg)
>  #define PORT_GP_10(bank, fn, sfx)      PORT_GP_CFG_10(bank, fn, sfx, 0)
>
> -#define PORT_GP_CFG_12(bank, fn, sfx, cfg)                             \
> +#define PORT_GP_CFG_11(bank, fn, sfx, cfg)                             \
>         PORT_GP_CFG_10(bank, fn, sfx, cfg),                             \
> -       PORT_GP_CFG_1(bank, 10, fn, sfx, cfg),                          \
> +       PORT_GP_CFG_1(bank, 10,  fn, sfx, cfg)

... with one space in fron of "fn" removed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
