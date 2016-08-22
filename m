From: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/13] pinctrl: add bcm63xx base code
Date: Mon, 22 Aug 2016 15:44:52 +0200
Message-ID: <CAOiHx=ndEkqQjRS5Hu5LovLmXiqFsPhx0X4k+1CFmGzhD11LRA@mail.gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
 <1471604025-21575-2-git-send-email-jonas.gorski@gmail.com> <CACRpkdbAWJruB=4rv_SoPZ5D5XgWjebK_Qmv2GLgOOrSyqXcDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbAWJruB=4rv_SoPZ5D5XgWjebK_Qmv2GLgOOrSyqXcDA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 22 August 2016 at 14:46, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Aug 19, 2016 at 12:53 PM, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> Setup directory and add a helper for bcm63xx pinctrl support.
>>
>> Signed-off-by: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
>>  drivers/pinctrl/bcm63xx/Kconfig           |   3 +
>>  drivers/pinctrl/bcm63xx/Makefile          |   1 +
>
> Why not just put it in the existing pinctrl/bcm directory?

Because at the time I started writing these drivers it was still
exclusive for ARCH_BCM, will move them there.

> The drivers in there share nothing but being Broadcom
> anyways. And when you're at it, do take a look at the
> other Broadcom drivers to check if they would
> happen to share something with your hardware, I find
> it dazzling that hardware engineers repeatedly reinvents
> pin controllers but what can I do.
>
>> +config PINCTRL_BCM63XX
>> +       bool
>> +       select GPIO_GENERIC
>
> depends on ARCH_****?

This isn't a user selectable symbol so I don't see the need for that.

>
> depends on OF_GPIO?
>
> Will it really be used on non-DT systems?

I plan to use it on both mips/bcm63xx (no dts support) and bmips (dts
support), so yes.

>
>> +#define BANK_SIZE      sizeof(u32)
>> +#define PINS_PER_BANK  (BANK_SIZE * BITS_PER_BYTE)
>> +
>> +#ifdef CONFIG_OF
>> +static int bcm63xx_gpio_of_xlate(struct gpio_chip *gc,
>> +                                const struct of_phandle_args *gpiospec,
>> +                                u32 *flags)
>> +{
>> +       struct gpio_chip *base = gpiochip_get_data(gc);
>> +       int pin = gpiospec->args[0];
>> +
>> +       if (gc != &base[pin / PINS_PER_BANK])
>> +               return -EINVAL;
>> +
>> +       pin = pin % PINS_PER_BANK;
>> +
>> +       if (pin >= gc->ngpio)
>> +               return -EINVAL;
>> +
>> +       if (flags)
>> +               *flags = gpiospec->args[1];
>> +
>> +       return pin;
>> +}
>> +#endif
>
> - Do you really have to support the !OF_GPIO case? (depend in Kconfig,
>   get rid of #ifdef)

See above.

>
> - The only reason for not using of_gpio_simple_xlate() seems to be that
>   you have several GPIO banks. So why not model every bank as a
>   separate device? Or did you consider this already?

I did consider it, but it makes the !OF case more complicated, and the
current of_gpio base code requires changing for it.

That's because some of the pinctrl chips need to set the
gpio-direction for muxes, and for that need to have a reference to the
gpio-controller(s). Since any muxes directly tied to the controller
node will get applied as soon as the controller is registered, it
needs to aquire the gpio-controller references first.

On the gpio-controller side, to flag these a requiring pinctrl those
would then have a gpio-range property, which will cause the probe
being deferred until the reference to the controller can be resolved.
Which waits for the gpio-controller to be registered, so it can
resolve its references to it. A true catch 22 ;-)

This could probably resolved by deferring resolving node-to-pincontrol
devices to gpio request time. Not sure if this then would conflict
which gpio-hogs on such a gpio-controller node?

I haven't really thought how much work it would be for the !OF case,
but would probably mean I need to acquire references based on their
pdev names.

>> +               gc[i].request = gpiochip_generic_request;
>> +               gc[i].free = gpiochip_generic_free;
>> +
>> +#ifdef CONFIG_OF
>> +               gc[i].of_gpio_n_cells = 2;
>> +               gc[i].of_xlate = bcm63xx_gpio_of_xlate;
>> +#endif
>> +
>> +               gc[i].label = label;
>> +               gc[i].ngpio = pins;
>> +
>> +               devm_gpiochip_add_data(dev, &gc[i], gc);
>
> Because this also gets pretty hairy... since you don't have one device
> per gpiochip.
>
>> +static void bcm63xx_setup_pinranges(struct gpio_chip *gc, const char *name,
>> +                                   int ngpio)
>> +{
>> +       int i, chips = DIV_ROUND_UP(ngpio, PINS_PER_BANK);
>> +
>> +       for (i = 0; i < chips; i++) {
>> +               int offset, pins;
>> +
>> +               offset = i * PINS_PER_BANK;
>> +               pins = min_t(int, ngpio - offset, PINS_PER_BANK);
>> +
>> +               gpiochip_add_pin_range(&gc[i], name, 0, offset, pins);
>> +       }
>> +}
>
> And this, same thing. Could be so much easier if it was just the same
> driver instantiated twice for two banks.
>
>> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dirout");
>> +       dirout = devm_ioremap_resource(&pdev->dev, res);
>> +       if (IS_ERR(dirout))
>> +               return ERR_CAST(dirout);
>> +
>> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
>> +       data = devm_ioremap_resource(&pdev->dev, res);
>> +       if (IS_ERR(data))
>> +               return ERR_CAST(data);
>> +
>> +       sz = resource_size(res);
>> +
>> +       ret = bcm63xx_setup_gpio(&pdev->dev, gc, dirout, data, sz, ngpio);
>> +       if (ret)
>> +               return ERR_PTR(ret);
>> +
>> +       pctldev = devm_pinctrl_register(&pdev->dev, desc, priv);
>> +       if (IS_ERR(pctldev))
>> +               return pctldev;
>> +
>> +       bcm63xx_setup_pinranges(gc, pinctrl_dev_get_devname(pctldev), ngpio);
>> +
>> +       dev_info(&pdev->dev, "registered at mmio %p\n", dirout);
>> +
>> +       return pctldev;
>
> A current trend in simple MMIO devices is to simply add themselves as a
> compatible string in drivers/gpio/gpio-mmio.c. Example:
>
> https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/commit/drivers/gpio/gpio-mmio.c?h=devel&id=05cc995f4d44c2b14a1f15f3271cc9715cb81099
>
> This could be a viable approach if you find a way to flag that such a GPIO
> has a pin control backend.

The most obvious would be having a gpio-ranges property, but this
leads to issues mentioned above. And only works for OF.


Regards
Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
