From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/13] pinctrl: add a pincontrol driver for BCM6348
Date: Mon, 22 Aug 2016 15:19:39 +0200
Message-ID: <CACRpkdZr7eoRHN8h2QyE9VNqZ1Gb9aukVnOYU9QfFA96cAdc9w@mail.gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com> <1471604025-21575-6-git-send-email-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471604025-21575-6-git-send-email-jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 19, 2016 at 12:53 PM, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Add a pincotrol driver for BCM6348. BCM6348 allow muxing five groups of
> up to ten gpios into fourteen potential functions. It does not allow
> muxing individual pins. Some functions require more than one group to be
> muxed to the same function.
>
> Signed-off-by: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
(...)

> +#define BCM6348_NGPIO          37
(...)
> +       struct gpio_chip gpio[2];

Seems unused.

> +static void bcm6348_rmw_mux(struct bcm6348_pinctrl *pctl, u32 mask, u32 val)
> +{
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&pctl->lock, flags);
> +
> +       reg = __raw_readl(pctl->mode);
> +       reg &= ~mask;
> +       reg |= val & mask;
> +       __raw_writel(reg, pctl->mode);
> +
> +       spin_unlock_irqrestore(&pctl->lock, flags);
> +}

Same comment as before on readl/writel_relaxed() to
be used rather than __raw_*.

> +#ifdef CONFIG_OF
> +       .dt_node_to_map         = pinconf_generic_dt_node_to_map_pin,
> +       .dt_free_map            = pinctrl_utils_free_map,
> +#endif

Same comment about depending on OF.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
