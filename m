From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: add R8A77970 PFC support
Date: Mon, 13 Nov 2017 21:32:13 +0100
Message-ID: <CAMuHMdW4HhzPVK-5XZKYhxvZwFUQhxPW=TDDQd7ZYY96Bz1AMw@mail.gmail.com>
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

Thanks for your patch!

For CPU_ALL_PORT(), pins, groups, and functions:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.16, with the two nits below fixed.

> --- /dev/null
> +++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77970.c

[...]

> +/* - VIN0 ------------------------------------------------------------------- */

[...]

> +static const unsigned int vin0_sync_pins[] = {
> +       /* VSYNC#, HSYNC# */
> +       RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 2),

The order of the above doesn't match the order below (will fix while applying).

> +};
> +static const unsigned int vin0_sync_mux[] = {
> +       VI0_HSYNC_N_MARK, VI0_VSYNC_N_MARK,
> +};

> +/* - VIN1 ------------------------------------------------------------------- */

[...]

> +static const unsigned int vin1_sync_pins[] = {
> +       /* VSYNC#, HSYNC# */
> +       RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 2),

Likewise.

> +};
> +static const unsigned int vin1_sync_mux[] = {
> +       VI1_HSYNC_N_MARK, VI1_VSYNC_N_MARK,
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
