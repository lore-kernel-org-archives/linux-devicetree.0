From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: add R8A77970 PFC support
Date: Tue, 14 Nov 2017 09:48:40 +0100
Message-ID: <CAMuHMdVoyjB_9q9=5hF3XKtF7bdJOCCgCWkTnRZwC4Zxaix_BA@mail.gmail.com>
References: <20171110181552.227541251@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171110181552.227541251@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, Nov 10, 2017 at 6:59 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the PFC support for the R8A77970 SoC including pin groups for some
> on-chip devices such as CAN-FD, EtherAVB, [H]SCIF, I2C, INTC-EX, MMC,
> MSIOF, PWM, VIN...
>
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns@hitachi.com>.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> --- /dev/null
> +++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77970.c

> +/* - EtherAVB --------------------------------------------------------------- */

> +static const unsigned int avb0_mdio_pins[] = {
> +       /* AVB0_MDC, AVB0_MDIO */
> +       RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14),
> +};
> +static const unsigned int avb0_mdio_mux[] = {
> +       AVB0_MDC_MARK, AVB0_MDIO_MARK,
> +};

Upon second look: this group is called "avb(0)_mdc" instead of "avb(0)_mdio"
on all other R-Car Gen3 SoCs?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
