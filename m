From: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/13] pinctrl: add a pincontrol driver for BCM6328
Date: Mon, 22 Aug 2016 15:54:15 +0200
Message-ID: <CAOiHx=nE76PYpTJRMQw0YahFMwBwXmDnWD27D-ZJ8toFkYfm=g@mail.gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
 <1471604025-21575-4-git-send-email-jonas.gorski@gmail.com> <CACRpkdbZDmHimo9K1rUcs-4MyOSZH5SHUD3kuSYANppLUU0WwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbZDmHimo9K1rUcs-4MyOSZH5SHUD3kuSYANppLUU0WwQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 22 August 2016 at 15:15, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Aug 19, 2016 at 12:53 PM, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> Add a pincontrol driver for BCM6328. BCM628 supports muxing 32 pins as
>> GPIOs, as LEDs for the integrated LED controller, or various other
>> functions. Its pincontrol mux registers also control other aspects, like
>> switching the second USB port between host and device mode.
>>
>> Signed-off-by: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> This looks good. Just thinking following the other patches
> that maybe this should be a syscon child driver.
>
>> +#define BCM6328_NGPIO          32
>
> I wonder why the pin control driver cares about that?
>
>> +struct bcm6328_pinctrl {
>> +       struct pinctrl_dev *pctldev;
>> +       struct pinctrl_desc desc;
>> +
>> +       void __iomem *mode;
>> +       void __iomem *mux[3];
>> +
>> +       /* register access lock */
>> +       spinlock_t lock;
>> +
>> +       struct gpio_chip gpio;
>
> Usually this should be the other way around: the gpio_chip
> knows about the pin controller, the pin controller does not
> know about the gpio_chip.
>
> I don't see it used in the code either? Artifact?

That's because some of the drivers require it, and kept it here so to
keep the drivers as similar as possible.

>> +static void bcm6328_rmw_mux(struct bcm6328_pinctrl *pctl, unsigned pin,
>> +                           u32 mode, u32 mux)
>> +{
>> +       unsigned long flags;
>> +       u32 reg;
>> +
>> +       spin_lock_irqsave(&pctl->lock, flags);
>> +       if (pin < 32) {
>> +               reg = __raw_readl(pctl->mode);
>> +               reg &= ~BIT(pin);
>> +               if (mode)
>> +                       reg |= BIT(pin);
>> +               __raw_writel(reg, pctl->mode);
>> +       }
>> +
>> +       reg = __raw_readl(pctl->mux[pin / 16]);
>> +       reg &= ~(3UL << (pin % 16));
>> +       reg |= mux << (pin % 16);
>> +       __raw_writel(reg, pctl->mux[pin / 16]);
>> +
>> +       spin_unlock_irqrestore(&pctl->lock, flags);
>> +}
>
> Why all this __raw_* accessors? What is wrong with readl_relaxed()
> and writel_relaxed()? Or MIPS doesn't have them?

BCM63XX is one of those weird targets that are usually big endian, and
there are no native endian / big endian *_relaxed() accessors.

>
>> +#ifdef CONFIG_OF
>> +       .dt_node_to_map         = pinconf_generic_dt_node_to_map_pin,
>> +       .dt_free_map            = pinctrl_utils_free_map,
>> +#endif
>
> Nice, but why not just add
> depends on OF
> to the Kconfig and get rid of the #ifdef?

As mentioned for the generic part, I want to use it on a !OF target as well.

>
>> +static int bcm6328_pinctrl_probe(struct platform_device *pdev)
>> +{
>> +       struct bcm6328_pinctrl *pctl;
>> +       struct resource *res;
>> +       void __iomem *mode, *mux;
>> +
>> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mode");
>> +       mode = devm_ioremap_resource(&pdev->dev, res);
>> +       if (IS_ERR(mode))
>> +               return PTR_ERR(mode);
>> +
>> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mux");
>> +       mux = devm_ioremap_resource(&pdev->dev, res);
>> +       if (IS_ERR(mux))
>> +               return PTR_ERR(mux);
>
> This mishmash of remap windows makes me prefer the syscon
> design pattern.

At least for this one I would still need to have multiple syscons
because there already is one OF enabled driver that uses a non-syscon
access to drivers within this range.


Regards
Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
