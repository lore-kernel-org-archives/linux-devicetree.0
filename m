From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 8/9] clocksource: Add a new timer-ingenic driver
Date: Thu, 11 Jan 2018 08:53:22 -0600
Message-ID: <CAL_Jsq+StZS1+qTd9CG1X2_3ay5onMgEmYG9MRUVWs-4K4-EZA@mail.gmail.com>
References: <20180101143344.2099-1-paul@crapouillou.net> <20180110224838.16711-1-paul@crapouillou.net>
 <20180110224838.16711-8-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180110224838.16711-8-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 10, 2018 at 4:48 PM, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org> wrote:
> This driver will use the TCU (Timer Counter Unit) present on the Ingenic
> JZ47xx SoCs to provide the kernel with a clocksource and timers.
>
> Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
> ---
>  drivers/clocksource/Kconfig         |   8 ++
>  drivers/clocksource/Makefile        |   1 +
>  drivers/clocksource/timer-ingenic.c | 258 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 267 insertions(+)
>  create mode 100644 drivers/clocksource/timer-ingenic.c
>
>  v2: Use SPDX identifier for the license
>  v3: - Move documentation to its own patch
>      - Search the devicetree for PWM clients, and use all the TCU
>            channels that won't be used for PWM

[...]

> +static int __init ingenic_tcu_init(struct device_node *np)
> +{
> +       unsigned long available_channels = GENMASK(NUM_CHANNELS - 1, 0);
> +       struct device_node *node;
> +       struct ingenic_tcu *tcu;
> +       unsigned int i, channel;
> +       int err;
> +       u32 val;
> +
> +       for_each_node_with_property(node, "pwms") {
> +               err = of_property_read_u32_index(node, "pwms", 1, &val);

This is the right idea, but a bit fragile. Perhaps its good enough for
your platform, but it would fail if you have another PWM provider like
the gpio-pwm binding or the cell size is not 1 (BTW, I thought the PWM
binding defined 3 cells typically).

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
