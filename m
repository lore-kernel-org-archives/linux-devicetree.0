From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/8] pinctrl: sh-pfc: r8a77995: Add SCIF pins, groups and functions
Date: Wed, 16 Aug 2017 11:38:59 +0200
Message-ID: <CAMuHMdVRwQUz8t1GyOZnX3NVmgV=X4axOZEqpzAyotorJNEcQA@mail.gmail.com>
References: <1502281187-24068-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1502281187-24068-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1502281187-24068-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san,

On Wed, Aug 9, 2017 at 2:19 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds SCIF{0,1,2,3,4,5} pins, groups and functions to R8A77995
> SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c

> +/* - SCIF3 ------------------------------------------------------------------ */
> +static const unsigned int scif3_data_a_pins[] = {
> +       /* RX, TX */
> +       RCAR_GP_PIN(2, 31), RCAR_GP_PIN(4, 00),
> +};
> +static const unsigned int scif3_data_a_mux[] = {
> +       RX3_A_MARK, TX3_A_MARK,
> +};
> +static const unsigned int scif3_clk_a_pins[] = {
> +       /* SCK */
> +       RCAR_GP_PIN(2, 30),
> +};
> +static const unsigned int scif3_clk_a_mux[] = {
> +       SCK3_A_MARK,
> +};
> +static const unsigned int scif3_data_b_pins[] = {
> +       /* RX, TX */
> +       RCAR_GP_PIN(1, 29), RCAR_GP_PIN(1, 31),

RX3_B is GP1_30...

> +};
> +static const unsigned int scif3_data_b_mux[] = {
> +       RX3_B_MARK, TX3_B_MARK,
> +};
> +static const unsigned int scif3_clk_b_pins[] = {
> +       /* SCK */
> +       RCAR_GP_PIN(1, 30),

... and SCK3_B is GP1_29 according to Rev0.4 of the R-Car D3 pin function
datasheet.

> +};
> +static const unsigned int scif3_clk_b_mux[] = {
> +       SCK3_B_MARK,
> +};

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

i.e. will queue in sh-pfc-for-v4.14 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
