From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 4/9] pinctrl: meson: allow gpio to request irq
Date: Tue, 25 Oct 2016 14:38:11 +0100
Message-ID: <dee26f0b-e175-f8a0-2b73-08e8e324841c@arm.com>
References: <1476871709-8359-1-git-send-email-jbrunet@baylibre.com>
 <1476871709-8359-5-git-send-email-jbrunet@baylibre.com>
 <CACRpkdaCZPS45t3eTcjJExOu=YT_YkjNkdpg09jQqvLQOJH=Qw@mail.gmail.com>
 <1477040798.15560.96.camel@baylibre.com>
 <CACRpkdYUVXny57AC9rKX3VRAyooEk_2XLvqe9jOuT3rOaE75rg@mail.gmail.com>
 <ec7c6cc5-cf9a-9c75-4b07-e337064c7d6e@arm.com>
 <1477400900.2482.51.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477400900.2482.51.camel-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 25/10/16 14:08, Jerome Brunet wrote:
> On Tue, 2016-10-25 at 11:38 +0100, Marc Zyngier wrote:
>>>
>> On 25/10/16 10:14, Linus Walleij wrote:
>>>
>>> On Fri, Oct 21, 2016 at 11:06 AM, Jerome Brunet <jbrunet@baylibre.c
>>> om> wrote:
>>>
>>>>
>>>>>
>>>>> Isn't this usecase (also as described in the cover letter) a
>>>>> textbook
>>>>> example of when you should be using hierarchical irqdomain?
>>>>>
>>>>> Please check with Marc et al on hierarchical irqdomains.
>>>>
>>>> Linus,
>>>> Do you mean I should create a new hierarchical irqdomains in each
>>>> of
>>>> the two pinctrl instances we have in these SoC, these domains
>>>> being
>>>> stacked on the one I just added for controller in irqchip ?
>>>>
>>>> I did not understand this is what you meant when I asked you the
>>>> question at ELCE.
>>>
>>> Honestly, I do not understand when and where to properly use
>>> hierarchical irqdomain, even after Marc's talk at ELC-E.
>>
>> I probably didn't do that good a job explaining it then. Let's try
>> again. You want to use hierarchical domains when you want to describe
>> an
>> interrupt whose path traverses multiple controllers without ever
>> being
>> multiplexed with other signals. As long as you have this 1:1
>> relationship between controllers, you can use them.
>>
> 
> Linus, Marc,
> 
> The calculation is question here is meant to get the appropriate hwirq
> number from a particular gpio (and deal with the gpios that can't
> provide an irq at all). 
> 
> If I look at other gpio drivers, many are doing exactly this kind of
> calculation before calling 'irq_create_mapping' in the to_irq callback.
> For example:
> - pinctrl/nomadik/pinctrl-abx500.c
> - pinctrl/samsung/pinctrl-exynos5440.c
> 
> Some can afford to create all the mappings in the probe and just call
> 'irq_find_mapping' (gpio/gpio_tegra.c) but this would not work here. We
> have only 8 upstream irqs for 130+ pins, so only 8 mappings possible at
> a time. 
> 
> My understanding is that irqdomain provide a way to map hwirq to linux
> virq (and back), not map gpio number to hwirq, right?

But why are those number different? Why don't you use the same
namespace? If gpio == hwirq, all your problems are already solved. If
you don't find the mapping in the irqdomain, then there is no irq, end
of story. What am I missing?

> 
> Even if I implement an another irqdomain at the gpio level, I would
> still have to perform this kind of calculation, one way or the other.
> 
>>> Which is problematic since quite a few GPIO drivers now
>>> need to use them.
>>>
>>> I will review his slides, in the meantime I would say: whatever
>>> Marc ACKs is fine with me. I trust this guy 100%. So I guess I
>>> could ask that he ACK the entire chain of patches
>>> from GIC->specialchip->GPIO.
> 
> Actually this discussion go me thinking about another issue we have
> with this hardware.
> We are looking for a way to implement support for IRQ_TYPE_EDGE_BOTH
> (needed for things like gpio-keys or mmc card detect). 
> The controller can do each edge but not both at the same time.
> I'm thinking that implementing another irqdomain at the gpio level
> would allow to properly check the pad level in the EOI callback then
> set the next expected edge type accordingly (using
> 'irq_chip_set_type_parent')
> 
> Would it be acceptable ?

I really don't see what another irqdomain brings to the table. This is
not a separate piece of HW, so the hwirq:irq mapping is still the same.
I fail to see what the benefit is.

> It looks a few other drivers deal with IRQ_TYPE_EDGE_BOTH in a similar
> way (gpio/gpio-omap.c, gpio/gpio-dwapb.c)

Being already done doesn't make it reliable. If the line goes low
between latching the rising edge and reprogramming the trigger, you've
lost at least *two* interrupts (the falling edge and the following
rising edge).

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
