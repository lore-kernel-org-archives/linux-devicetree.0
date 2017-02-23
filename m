From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 5/6] gpio: Add gpio driver support for ThunderX and OCTEON-TX
Date: Thu, 23 Feb 2017 14:46:41 +0100
Message-ID: <CACRpkdbxZ8g1ef7aSHBukbkBY9GN=rvtHP7aCqJFakHLXkD71g@mail.gmail.com>
References: <1487206866-4011-1-git-send-email-david.daney@cavium.com> <1487206866-4011-6-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487206866-4011-6-git-send-email-david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 16, 2017 at 2:01 AM, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org> wrote:

> Cavium ThunderX and OCTEON-TX are arm64 based SoCs.  Add driver for
> the on-chip GPIO pins.
>
> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

Hm due to an API change in the upstream kernel you will still have
to respin this driver, but I'm sure you will fix it in 5 minutes.

> +#define  GPIO_BIT_CFG_FIL_CNT_SHIFT    4
> +#define  GPIO_BIT_CFG_FIL_SEL_SHIFT    8
(...)
> +#define GLITCH_FILTER_400NS ((4ull << GPIO_BIT_CFG_FIL_SEL_SHIFT) | \
> +                            (9ull << GPIO_BIT_CFG_FIL_CNT_SHIFT))

This is what we call debounce in the API I think.

You can consider implementing it below in the .set_config()
function:

> +/*
> + * Weird, setting open-drain mode causes signal inversion.  Note this
> + * so we can compensate in the dir_out function.
> + */
> +static int thunderx_gpio_set_single_ended(struct gpio_chip *chip,
> +                                         unsigned int line,
> +                                         enum single_ended_mode mode)


This function is renamed .set_config() in v4.11.

This can also be used for setting debounce for the line, and
you proabably at some point want to add support for using the
more elaborate settings in the glitch filter for that.

> +       chip->label = KBUILD_MODNAME;
> +       chip->parent = dev;
> +       chip->owner = THIS_MODULE;
> +       chip->base = -1; /* System allocated */
> +       chip->can_sleep = false;
> +       chip->ngpio = ngpio;
> +       chip->direction_input = thunderx_gpio_dir_in;
> +       chip->get = thunderx_gpio_get;
> +       chip->direction_output = thunderx_gpio_dir_out;
> +       chip->set = thunderx_gpio_set;
> +       chip->set_multiple = thunderx_gpio_set_multiple;
> +       chip->set_single_ended = thunderx_gpio_set_single_ended;

So .set_config() is what we call this now. See converted drivers like
gpio-wcove.c etc for examples.

Hm no .get_direction() callback? I suggest to add that. It is useful
for the userspace ABI and more.

You could also add a ->names array with names for all the
lines if you like. This is also nice for userspace and for PCI-based
drivers that is the only way to insert line names for the chip.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
