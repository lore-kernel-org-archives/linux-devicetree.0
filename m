From: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/4] gpio: brcmstb: Add interrupt and wakeup source support
Date: Mon, 13 Jul 2015 19:29:33 -0700
Message-ID: <CADtm3G6SMtG3AE2MA1Ft37EbK7_ZrmM0EWEn+Br-NCr4mwYb9A@mail.gmail.com>
References: <1434589243-502-1-git-send-email-gregory.0xf0@gmail.com>
 <1434589243-502-4-git-send-email-gregory.0xf0@gmail.com> <CACRpkdYNGdWHk1kqhFWHziLPy3mZXTcUjYFBCVo5dRCh60bQ_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYNGdWHk1kqhFWHziLPy3mZXTcUjYFBCVo5dRCh60bQ_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 13, 2015 at 5:58 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Jun 18, 2015 at 3:00 AM, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
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
>
> Sorry for the unclarities, this is a bit hairy. Suggestions as to
> how we can make it easier and/or bring code for this into gpiolib
> are welcome. Right now I have a hard time seeing any way to
> make this more generic and helpful :/

I'll see about putting together an update to the documentation
discussing more about the case where you have one IRQ shared by
multiple GPIO banks.

>
> Overall this patch looks real nice. Some nitpicks below.
>
>> @@ -164,6 +398,16 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
>>         priv->reg_base = reg_base;
>>         priv->pdev = pdev;
>>
>> +       if (of_property_read_bool(np, "interrupt-controller")) {
>> +               priv->parent_irq = platform_get_irq(pdev, 0);
>> +               if (priv->parent_irq < 0) {
>
> This should be <= 0 since 0 is NO_IRQ

Will fix.

>
>> +                       dev_err(dev, "Couldn't get IRQ");
>> +                       return -ENOENT;
>> +               }
>> +       } else {
>> +               priv->parent_irq = -ENOENT;
>> +       }
>
> Why should this code only execute if the node is marked
> "interrupt-controller"? It makes it seem like IRQs cannot arrive
> to it unless it is intended to serve other consumers.
>
> Maybe in practice this is true, but...

If the node does not contain the "interrupt-controller" property, the
hardware does not support GPIO interrupts, and I designed the driver
specifically to allow that to work.
If the node does contain that property, then being unable to complete
IRQ setup is a fatal error, because something is badly misconfigured.

>
>> +               if (priv->parent_irq >= 0) {
>> +                       err = brcmstb_gpio_irq_setup(pdev, bank);
>> +                       if (err)
>> +                               goto fail;
>> +               }
>
> Again 0 is NO_IRQ so this should be > 0 not >= 0.

OK, will change.

Thanks,
Gregory
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
