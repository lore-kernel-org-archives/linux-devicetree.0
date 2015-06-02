From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/6] gpio: Add GPIO support for Broadcom STB SoCs
Date: Tue, 2 Jun 2015 15:40:53 +0200
Message-ID: <CACRpkdaAcsB4CK9jfjTXUZDLkG3nt3ofTngmoiU92fhTowg6fw@mail.gmail.com>
References: <1432865650-4062-1-git-send-email-gregory.0xf0@gmail.com>
	<1432865650-4062-2-git-send-email-gregory.0xf0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432865650-4062-2-git-send-email-gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 29, 2015 at 4:14 AM, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> This adds support for the GPIO IP "UPG GIO" used on Broadcom STB SoCs
> (BCM7XXX and some others).  Uses basic_mmio_gpio to instantiate a
> gpio_chip for each bank.  The driver assumes that it handles the base
> set of GPIOs on the system and that it can start its numbering sequence
> from 0, so any GPIO expanders used with it must dynamically assign GPIO
> numbers after this driver has finished registering its GPIOs.
>
> Does not implement the interrupt-controller portion yet, will be done in a
> future commit.
>
> List-usage-fixed-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> v2:
> - change include to use <linux/gpio/driver.h> instead of <linux/gpio.h>
> - get rid of unnecessary imask member in struct bank
> - rename GPIO_PER_BANK -> MAX_GPIO_PER_BANK
> - always have 32 GPIOs per bank and add 'width' member in struct bank to hold
>   actual number of GPIOs in use
> - mark of_match table as const

This v2 version of 1/5 applied.

I recognize that you need one driver for all banks. I'm still hesitant
about the complexity it brings to e.g. the IRQ handling.

Another possibility would be to spawn one driver per bank anyways,
then have the IRQ requested as IRQF_SHARED so the IRQ
handler for the shared IRQ would walk all drivers IRQ handlers
and eventually figure out what GPIO fired it. But this
implementation is quicker I guess.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
