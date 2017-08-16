From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 5/8] pinctrl: sh-pfc: r8a77995: Add EthernetAVB pins,
 groups and functions
Date: Wed, 16 Aug 2017 13:06:22 +0200
Message-ID: <CAMuHMdWQD9Gnt0hCHf8nwdq0etWQW=zSuXqFe7qrxmQ7SAEVjw@mail.gmail.com>
References: <1502281187-24068-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1502281187-24068-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502281187-24068-6-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Takeshi Kihara <takeshi.kihara.df-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san, Kihara-san,

On Wed, Aug 9, 2017 at 2:19 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> From: Takeshi Kihara <takeshi.kihara.df-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

But before I apply this, please see my question below...

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c

> +static const char * const avb0_groups[] = {
> +       "avb0_td",
> +       "avb0_rd",
> +       "avb0_tx_ctl",
> +       "avb0_rx_ctl",
> +       "avb0_txc",
> +       "avb0_rxc",
> +       "avb0_txcrefclk",
> +       "avb0_link",
> +       "avb0_magic",
> +       "avb0_phy_int",
> +       "avb0_mdc",
> +       "avb0_mdio",
> +       "avb0_avtp_pps_a",
> +       "avb0_avtp_match_a",
> +       "avb0_avtp_capture_a",
> +       "avb0_avtp_pps_b",
> +       "avb0_avtp_match_b",
> +       "avb0_avtp_capture_b",
> +};

Is there any specific reason this uses a different split than the
EtherAVB groups
in pinctrl drivers for other SoCs?

Note that I do understand that the different prefix ("avb0" vs. "avb")
was used to
match the R-Car D3 datasheet, which is thus OK.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
