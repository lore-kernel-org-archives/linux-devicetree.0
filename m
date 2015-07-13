From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/4] gpio: brcmstb: support wakeup from S5 cold boot
Date: Mon, 13 Jul 2015 15:03:10 +0200
Message-ID: <CACRpkdZSUUk-giwckxSyV8ZvAZcQUD7KaCnjq=_hiO7k9=jVMQ@mail.gmail.com>
References: <1434589243-502-1-git-send-email-gregory.0xf0@gmail.com>
	<1434589243-502-5-git-send-email-gregory.0xf0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434589243-502-5-git-send-email-gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 18, 2015 at 3:00 AM, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> For wake from S5, we need to:
> - register a reboot handler
> - set wakeup capability before requesting IRQ so wakeup count is
>   incremented
> - mask all GPIO IRQs and clear any pending interrupts during driver
>   probe to since no driver will yet be registered to handle any IRQs
>   carried over from boot at that time, and it's possible that the
>   booted kernel does not request the same IRQ anyway.
>
> This means that /sys/.../power/wakeup_count is valid at boot time, and
> we can properly account for S5 wakeup stats. e.g.:
>
>   ### After waking from S5 from a GPIO key
>   # cat /sys/bus/platform/drivers/brcmstb-gpio/f04172c0.gpio/power/wakeup
>   enabled
>   # cat /sys/bus/platform/drivers/brcmstb-gpio/f04172c0.gpio/power/wakeup_count
>   1
>
> Signed-off-by: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

(...)
> -static int brcmstb_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
> +static int __brcmstb_gpio_irq_set_wake(struct brcmstb_gpio_priv *priv,
> +               unsigned int enable)
>  {
> -       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> -       struct brcmstb_gpio_priv *priv = brcmstb_gpio_gc_to_priv(gc);
>         int ret = 0;

I don't usually like to refactor code with __foo wrapper functions with
underscores or double underscores in front of them.

Is it possible to give this a more unique name?

> +               /*
> +                * Mask all interrupts by default, since wakeup interrupts may
> +                * be retained from S5 cold boot
> +                */
> +               bank->bgc.write_reg(reg_base + GIO_MASK(bank->id), 0);

Aha I see, that's some clever code, nice.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
