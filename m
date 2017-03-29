From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/7] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
Date: Wed, 29 Mar 2017 15:22:23 +0200
Message-ID: <CACRpkdZ4Z6c2YDu-e6kZ8-K7Dv_tRGxZj0vAqgPBx7rWwmHU-g@mail.gmail.com>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org> <1490368934-12494-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490368934-12494-4-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 24, 2017 at 4:22 PM, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:

> Add dt-bindings for Renesas r7s72100 pin controller header file.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>

> +/*
> + * Pin is bi-directional.
> + * An alternate function that needs both input/output functionalities shall
> + * be configured as bidirectional.
> + * Eg. SDA/SCL pins of an I2c interface.
> + */
> +#define BI_DIR                 (1 << 3)

Any specific reason why this should not simply be added to
include/linux/pinctrl/pinconf-generic.h
as PIN_CONFIG_BIDIRECTIONAL and parsed in
drivers/pinctrl/pinconf-generic.c
from the (new) DT property "bidirectional" simply?

> +/*
> + * Flags used to ask software to drive the pin I/O direction overriding the
> + * alternate function configuration.
> + * Some alternate functions require software to force I/O direction of a pin,
> + * overriding the designated one.
> + * Refer to the HW manual to know when this flag shall be used.
> + */
> +#define SWIO_IN                        (1 << 4)
> +#define SWIO_OUT               (1 << 5)

What is wrong in doing this with generic pin config using
PIN_CONFIG_INPUT_ENABLE and PIN_CONFIG_OUTPUT
(ignoring the argument)?

In the device tree use input-enable and add a new output-enable
(with unspecified value) with proper description and DT bindings?

And if you think these have no general applicability, by the end
of the day they are *still* pin config, not magic flags we can choose to
toss in with the muxing, so you can do what the Qualcomm driver
does and add custom pin configurations extending the generic
pin config, see drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
qcom,pull-up-strength etc.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
