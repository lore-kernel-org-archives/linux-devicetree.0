From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] pinctrl: sh-pfc: r8a7791: add R8A7743 support
Date: Thu, 20 Apr 2017 13:33:57 +0200
Message-ID: <CAMuHMdXxf3qq3G=8ubmt=1a6h6FG3wKRtCXHNqUYfnqyy=y4LA@mail.gmail.com>
References: <20170413201346.358012116@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170413201346.358012116@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Thu, Apr 13, 2017 at 10:13 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Renesas RZ/G1M (R8A7743) is pin compatible with R-Car M2-W/N (R8A7791/3),
> however it doesn't have several automotive specific peripherals. Annotate
> all the items that only exist on the R-Car SoCs and only supply  the pin
> groups/functions existing on a given SoC...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> This patch is against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
> repo plus  4  R8A7791 PFC fixes and the "grand I2C rename" patch...
>
> Changes in version 3:
> - updated the PFC bindings.
>
> Changes in version 2:
> - switch to supplying exactly the groups/functions existing on a given SoC,
>   update the patch descriptions accordingly;
> - resolved rejects due to the "grand I2C rename" patch being updated.

Thanks for the update!

> --- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> +++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7791.c

> @@ -129,11 +129,12 @@ enum {
>         FN_A9, FN_MSIOF1_SS2, FN_I2C0_SDA,
>         FN_A10, FN_MSIOF1_TXD, FN_MSIOF1_TXD_D,
>         FN_A11, FN_MSIOF1_RXD, FN_I2C3_SCL_D, FN_MSIOF1_RXD_D,
> -       FN_A12, FN_FMCLK, FN_I2C3_SDA_D, FN_MSIOF1_SCK_D,
> -       FN_A13, FN_ATAG0_N_C, FN_BPFCLK, FN_MSIOF1_SS1_D,
> -       FN_A14, FN_ATADIR0_N_C, FN_FMIN, FN_FMIN_C, FN_MSIOF1_SYNC_D,
> -       FN_A15, FN_BPFCLK_C,
> -       FN_A16, FN_DREQ2_B, FN_FMCLK_C, FN_SCIFA1_SCK_B,
> +       FN_A12, FN_FMCLK /* R8A779x only */, FN_I2C3_SDA_D, FN_MSIOF1_SCK_D,
> +       FN_A13, FN_ATAG0_N_C, FN_BPFCLK /* R8A779x only */, FN_MSIOF1_SS1_D,
> +       FN_A14, FN_ATADIR0_N_C, FN_FMIN /* R8A779x only */,
> +       FN_FMIN_C /* R8A779x only */, FN_MSIOF1_SYNC_D,
> +       FN_A15, FN_BPFCLK_C /* R8A779x only */,
> +       FN_A16, FN_DREQ2_B, FN_FMCLK_C /* R8A779x only */, FN_SCIFA1_SCK_B,

I still have mixed feelings about adding all these annotations.
IMHO the groups and functions provide sufficient documentation, and not adding
the annotations means less code has to be changed now, and perhaps in the
future.

More about that in the r8a7794 patch...

> @@ -4419,359 +4506,367 @@ static const unsigned int vin2_clk_mux[]
>         VI2_CLK_MARK,
>  };
>
> -static const struct sh_pfc_pin_group pinmux_groups[] = {
> -       SH_PFC_PIN_GROUP(adi_common),
> -       SH_PFC_PIN_GROUP(adi_chsel0),

[...]

> -       SH_PFC_PIN_GROUP(vin2_clkenb),
> -       SH_PFC_PIN_GROUP(vin2_clk),
> +static const struct {
> +       struct sh_pfc_pin_group common[341];
> +       struct sh_pfc_pin_group r8a779x[9];
> +} pinmux_groups = {

Thanks, that's exactly what I had in mind!

> +       .common = {
> +               SH_PFC_PIN_GROUP(audio_clk_a),
> +               SH_PFC_PIN_GROUP(audio_clk_b),

[...]

> +               SH_PFC_PIN_GROUP(i2c4),
> +               SH_PFC_PIN_GROUP(i2c4_b),
> +               SH_PFC_PIN_GROUP(i2c4_c),
> +               SH_PFC_PIN_GROUP(i2c8),
> +               SH_PFC_PIN_GROUP(i2c8_b),
> +               SH_PFC_PIN_GROUP(i2c8_c),

What happened to i2c7? (revealed by "git show -b").

> +               SH_PFC_PIN_GROUP(i2c8),
> +               SH_PFC_PIN_GROUP(i2c8_b),
> +               SH_PFC_PIN_GROUP(i2c8_c),

[...]

> +               SH_PFC_PIN_GROUP(vin2_clkenb),
> +               SH_PFC_PIN_GROUP(vin2_clk),
> +       },
> +       .r8a779x = {
> +               SH_PFC_PIN_GROUP(adi_common),
> +               SH_PFC_PIN_GROUP(adi_chsel0),
> +               SH_PFC_PIN_GROUP(adi_chsel1),
> +               SH_PFC_PIN_GROUP(adi_chsel2),
> +               SH_PFC_PIN_GROUP(adi_common_b),
> +               SH_PFC_PIN_GROUP(adi_chsel0_b),
> +               SH_PFC_PIN_GROUP(adi_chsel1_b),
> +               SH_PFC_PIN_GROUP(adi_chsel2_b),
> +               SH_PFC_PIN_GROUP(mlb_3pin),
> +       }

Given the relatively small additional set of data needed to support
r8a779[13], it's probably not worth protecting it with #if
defined(CONFIG_PINCTRL_PFC_R8A7791) || defined(CONFIG_PINCTRL_PFC_R8A7793).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
