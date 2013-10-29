From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 1/8] pinctrl: imx1 core driver
Date: Tue, 29 Oct 2013 15:09:00 +0100
Message-ID: <CACRpkdbrRhqd-Dho1eW2bWiGZSkgWzV-irEchrrFHdio9rei3Q@mail.gmail.com>
References: <1382950843-26066-1-git-send-email-mpa@pengutronix.de>
	<1382950843-26066-2-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382950843-26066-2-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 28, 2013 at 10:00 AM, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:

> +static int imx1_pinconf_get(struct pinctrl_dev *pctldev,
> +                            unsigned pin_id, unsigned long *config)
> +{
> +       struct imx1_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
> +
> +       *config = imx1_read_bit(ipctl, pin_id, MX1_PUEN);
> +
> +       return 0;
> +}
> +
> +static int imx1_pinconf_set(struct pinctrl_dev *pctldev,
> +                            unsigned pin_id, unsigned long *configs,
> +                            unsigned num_configs)
> +{
> +       struct imx1_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
> +       const struct imx1_pinctrl_soc_info *info = ipctl->info;
> +       int i;
> +
> +       for (i = 0; i != num_configs; ++i) {
> +               imx1_write_bit(ipctl, pin_id, configs[i] & 0x01, MX1_PUEN);
> +
> +               dev_dbg(ipctl->dev, "pinconf set pullup pin %s\n",
> +                       info->pins[pin_id].name);
> +       }
> +
> +       return 0;
> +}

I should mention that this is only acceptable if modeled after the
other i.MX drivers. If we got a new, unrelated driver today, we
would require that it used GENERIC_PINCONF for this,
especially for something that can apparently only do
pull-up and nothing else.

The generic pinconf has standardized DT bindings and share
code with other drivers so it is generally very nice.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
