From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [[RFC PATCH]] gpio: gpio-mxc: make sure gpio is input when
 request IRQ
Date: Fri, 25 Jul 2014 13:38:55 +0200
Message-ID: <CACRpkdarH_-2uW55C5bAUxM1ESgSb6tJAWc4UqEoWr8uc_kQRQ@mail.gmail.com>
References: <1405518664-31313-1-git-send-email-list-09_linux_arm@tqsc.de>
	<20140722062803.GA21229@dragon>
	<53CE107A.1000000@tqsc.de>
	<20140722074257.GC21229@dragon>
	<CACRpkdYxOv+k2Sazm83sA=LwKUv5yMzag44A=Ez8pNQHRO3V6A@mail.gmail.com>
	<53D0C008.70305@tqsc.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53D0C008.70305-7U5DVgMjAv4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Niebel <list-09_linux_arm-7U5DVgMjAv4@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Markus Niebel <Markus.Niebel-HVi9AzVXQk5Wk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 24, 2014 at 10:12 AM, Markus Niebel
<list-09_linux_arm-7U5DVgMjAv4@public.gmane.org> wrote:
> Am 23.07.2014 18:14, wrote Linus Walleij:

>> So always prepare the hardware and make it ready for action in respective
>> callbacks from the GPIO and irqchip APIs. Do not rely on gpiod_to_irq() having
>> been called first.
>>
>
> So a gpio driver is responsible to read status of gpio lines and flag any gpio line
> currently configured as out (base on the information read from hardware registers)
> on driver probe time - correct?

I don't think anyone reads that information explicitly to set up
these flags.

Drivers just leave the pins in their power-on maiden state without
trying to figure out how they're set-up. But as you say, if you call
gpiod_get_direction() on them, the flag gets set up indeed.

So usually these flags are set by code, calling
gpiod_[get/set]_direction().
Then they do get flagged as outputs or inputs.

> If yes is the driver allowed to call
> gpiod_get_direction() to have the FLAG_IS_OUT set in the gpiolib layer?

I don't know if it'd be a good idea to loop over all gpios in a new
irqchip and fetch the direction just to get the flags right, so far
we haven't done that and I don't know what the usecase would be.

If we need that we should do it in gpiolib for all drivers don't you
think?

But then we need a rationale for doing it, other than it's nice :-)
It is already called on-the-fly by debugfs when a user needs that
info.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
