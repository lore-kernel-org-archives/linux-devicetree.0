From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 6/8] pinctrl: sh-pfc: r8a77995: Add USB2.0 host support
Date: Wed, 16 Aug 2017 13:10:47 +0200
Message-ID: <CAMuHMdW27kVU2cB=iL-H7t44KeEboL+Ki0zvxkavRpZCepYuLw@mail.gmail.com>
References: <1502281187-24068-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1502281187-24068-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1502281187-24068-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san, Kihara-san,

On Wed, Aug 9, 2017 at 2:19 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> index 9eb0cef..5c0a94f 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> @@ -1302,6 +1302,15 @@ enum {
>         SCIF_CLK_MARK,
>  };
>
> +/* - USB0 ------------------------------------------------------------------- */
> +static const unsigned int usb0_pins[] = {
> +       /* PWEN, OVC */
> +       RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
> +};
> +static const unsigned int usb0_mux[] = {
> +       USB0_PWEN_MARK, USB0_OVC_MARK,
> +};

What about USB0_IDPU and USB0_IDIN?
Are they needed for normal operation, or can they be added later?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
