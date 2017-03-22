From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 3/7] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
Date: Wed, 22 Mar 2017 11:35:35 +0100
Message-ID: <CAMuHMdUYZ0+468Djucy2NXXUq7LOZMUwm-3YmiFATVQa=M_CTg@mail.gmail.com>
References: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org> <1490026491-21742-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490026491-21742-4-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 20, 2017 at 5:14 PM, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
> Add dt-bindings for Renesas r7s72100 pin controller header file.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
> ---
>  include/dt-bindings/pinctrl/r7s72100-pinctrl.h | 36 ++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/r7s72100-pinctrl.h
>
> diff --git a/include/dt-bindings/pinctrl/r7s72100-pinctrl.h b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
> new file mode 100644
> index 0000000..98852d3
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
> @@ -0,0 +1,36 @@
> +/*
> + * Defines macros and constants for Renesas RZ/A1 pin controller pin
> + * muxing functions.
> + */
> +#ifndef __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
> +#define __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
> +
> +#define RZA1_PINS_PER_PORT     16
> +
> +/* Create the pin index from it's bank and position numbers */

its bank

> +#define PIN(b, p)              ((b) * RZA1_PINS_PER_PORT + (p))
> +
> +/*
> + * Flags to apply to alternate function configuration
> + * All of the following are mutually exclusive.
> + */
> +
> +/*
> + * Pin is bi-directional.
> + * Alternate function that need both input/outpu functionalities shall

An alternate function that needs ... output

> + * be configured as bidirectional.
> + * Eg. SDA/SCL pins of an I2c interface.
> + */
> +#define BI_DIR                 (1 << 3)
> +
> +/*
> + * Flags used to ask software drive the pin I/O direction overriding the

to drive

> + * alternate function configuration.
> + * Some alternate function requires software to force I/O direction of a pin,

functions require

> + * ovverriding the designated one.

overriding

> + * Reference to the HW manual to know when this flag shall be used.

Refer

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
