From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/7] pinctrl: imx1 core driver
Date: Mon, 23 Sep 2013 10:21:16 +0200
Message-ID: <CACRpkdYH6LwmU0jHBVekrvQMKsz4YOeEWeFa-uFqZ=MjGLFZkw@mail.gmail.com>
References: <1378020488-21129-1-git-send-email-mpa@pengutronix.de>
	<1378020488-21129-2-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378020488-21129-2-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 1, 2013 at 9:28 AM, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:

> Core driver for register formats of imx1/imx21/imx27 processors.
>
> The pins of those processors are grouped into ports. Each port has 32
> pins. The pins mux configuration is controlled by registers with 1 or 2
> bit per pin, depending on the specific control register.
>
> Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

This patch set needs to be rebased and tested on top of v3.12-rc1.
Or preferably even my "devel" branch in the pinctrl tree.

For example:

> +static int imx1_pinconf_set(struct pinctrl_dev *pctldev,
> +                            unsigned pin_id, unsigned long config)
> +{
> +       struct imx1_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
> +       const struct imx1_pinctrl_soc_info *info = ipctl->info;
> +
> +       imx1_write_bit(ipctl, pin_id, config & 0x01, MX1_PUEN);
> +
> +       dev_dbg(ipctl->dev, "pinconf set pullup pin %s\n",
> +               info->pins[pin_id].name);
> +
> +       return 0;
> +}

This function need to change signature.

Check commit 03b054e9696c3cbd3d5905ec96da15acd0a2fe8d

Please resend all 7 patches and add Shawns+Saschas ACKs
when you have rebased and tested the result.

Thanks!
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
