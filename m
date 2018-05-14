Return-Path: <SRS0=3T5d=IB=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1526008947-26667-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526008947-26667-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526008947-26667-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 May 2018 22:13:56 +0200
Message-ID: <CAMuHMdWEzRic5dy_Daj-JDkwCjn7mPTmWbVb7zTPLbuxcQ22Fg@mail.gmail.com>
Subject: Re: [PATCH 3/6] pinctrl: sh-pfc: r8a77990: Add bias pinconf support
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

On Fri, May 11, 2018 at 5:22 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch implements control of pull-up and pull-down. On this SoC there
> is no simple mapping of GP pins to bias register bits, so we need a table.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c

> @@ -1227,10 +1248,55 @@ enum {
>
>         PINMUX_IPSR_GPSR(IP15_31_28,            USB30_OVC),
>         PINMUX_IPSR_MSEL(IP15_31_28,            USB0_OVC_A,     SEL_USB_20_CH0_0),
> +
> +/*
> + * Static pins can not be muxed between different functions but
> + * still needs a mark entry in the pinmux list. Add each static

need mark entries

> + * pin to the list without an associated function. The sh-pfc
> + * core will do the right thing and skip trying to mux then pin

mux the pin

> + * while still applying configuration to it

period

I have just sent a patch to fix the other copies, in the hope these grammar
atrocities will stop spreading ;-)

> @@ -1708,8 +1774,263 @@ enum {
>         { },
>  };
>
> +static const struct pinmux_bias_reg pinmux_bias_regs[] = {

The register definitions look OK to me.
I'll review the actual pin mappings later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
