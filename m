From: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/4] gpio: brcmstb: Add interrupt and wakeup source support
Date: Thu, 13 Aug 2015 16:49:57 -0700
Message-ID: <CADtm3G7NQqDKwGujZUA9CUJ15+e8fLg0Kupbn2CMc0MeK9DbMw@mail.gmail.com>
References: <1438391865-7862-1-git-send-email-gregory.0xf0@gmail.com>
 <1438391865-7862-3-git-send-email-gregory.0xf0@gmail.com> <CACRpkdaz3k_N1qS5M_jmprPz8fHXeLtTke_YT8i2gaehmme+OQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaz3k_N1qS5M_jmprPz8fHXeLtTke_YT8i2gaehmme+OQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 13, 2015 at 4:11 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Sat, Aug 1, 2015 at 3:17 AM, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> Uses the gpiolib irqchip helpers.  For this to work, the irq setup
>> function is called once per bank instead of once per device.  Note
>> that all known uses of this block have a BCM7120 L2 interrupt
>> controller as a parent.  Supports interrupts for all GPIOs.
>>
>> In the IRQ handler, we check for raised IRQs for invalid GPIOs and
>> warn (ratelimited) if they're encountered.
>>
>> Also, several drivers (e.g. gpio-keys) allow for GPIOs to be
>> configured as wakeup sources, and this GPIO controller supports that
>> through a separate interrupt path.
>>
>> The de-facto standard DT property "wakeup-source" is checked, since
>> that indicates whether the GPIO controller hardware can wake.  Uses
>> the IRQCHIP_MASK_ON_SUSPEND irq_chip flag because UPG GIO doesn't have
>> any of its own wakeup source configuration.
>>
>> Aside regarding gpiolib irqchip helpers: It wasn't obvious (to me)
>> that you can have multiple chained irqchips and associated IRQ domains
>> for a single parent IRQ, and as long as the xlate function is written
>> correctly, a GPIO IRQ request end up checking the correct domain and
>> will get associated with the correct IRQ.  What helps make this clear
>> is to read
>>   drivers/gpio/gpiolib-of.c:
>>    - of_gpiochip_find_and_xlate()
>>    - of_get_named_gpiod_flags()
>>   drivers/gpio/gpiolib.c:
>>    - gpiochip_find()
>>
>> Signed-off-by: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> v4:
>> - when checking parent_irq, use <= 0 or > 0 since 0 is NO_IRQ.
>
> Patch applied, but:
>
>
>> +       if (of_property_read_bool(np, "interrupt-controller")) {
>> +               priv->parent_irq = platform_get_irq(pdev, 0);
>> +               if (priv->parent_irq <= 0) {
>> +                       dev_err(dev, "Couldn't get IRQ");
>> +                       return -ENOENT;
>> +               }
>> +       } else {
>> +               priv->parent_irq = -ENOENT;
>> +       }
>> +
>>         if (brcmstb_gpio_sanity_check_banks(dev, np, res))
>>                 return -EINVAL;
>
> This patch does not apply cleanly because the version in my
> tree has INIT_LIST_HEAD(&priv->bank_list);
> before the sanity check.
>
> I applied it manually, but check that things are working right.

Your tree seems to be missing

commit 2252607d327d5219a6331b50e6ec266d56402be0
Author: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Wed Jun 17 18:00:40 2015 -0700

    gpio: brcmstb: fix null ptr dereference in driver remove

which you had pulled in and sent for 4.2-rc1.  It should apply cleanly
on top of that.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
