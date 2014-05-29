From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: realview: basic device tree implementation
Date: Thu, 29 May 2014 16:47:21 +0200
Message-ID: <53874879.2080807@gmail.com>
References: <1399586896-16906-1-git-send-email-linus.walleij@linaro.org> <201405091244.02066.arnd@arndb.de> <CACRpkdb8c=k3Ky=TisNdzycc3owJsNSQmSTu03RR5E0QvE0KZA@mail.gmail.com> <537E7B83.4020900@gmail.com> <CACRpkdap1U19EiULnq11udhY91UnnNu_-5MnLby3idbdjzBj4Q@mail.gmail.com> <53870787.3030202@gmail.com> <CACRpkdYVe+++Qb-CWrWwM1zDHxNqmpE0CFzp959Q40Zqb5sUEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYVe+++Qb-CWrWwM1zDHxNqmpE0CFzp959Q40Zqb5sUEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/29/2014 04:13 PM, Linus Walleij wrote:
> On Thu, May 29, 2014 at 12:10 PM, Sebastian Hesselbarth
> <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 05/29/2014 11:44 AM, Linus Walleij wrote:
>>> Hmmmm well I want to see that code before I believe it ... but
>>> I get what you mean.
>>
>> Well, the register set on Berlin I was thinking about tackles pinctrl,
>> padmux, clock, reset and some other freaky stuff I cannot recall. The
>> mess in it is that there is no order you can apply to split it up into
>> separate nodes. Moreover, the next SoC has some registers just shoved
>> into it, moving some other registers.
> 
> Berlin hardware engineers seem to be hellbent on complicating
> your life.

Tell me about it! ;)

Although, I don't think it is exclusive to Berlin but other vendors,
too.

>> The way we will go for it on Berlin is now:
>>
>> (a) have a single node for the whole chip-ctrl register set
>> (b) register clk driver on it (early, as it provides timer clk)
>> (c) register one chip-ctrl driver on it that will
>>     (d) reserve the iomap,
>>     (e) register a regmap-mmio,
>>     (f) register platform_devices for {pinctrl,reset,...} that will
>>         use regmap-mmio and read their properties from the single
>>         node
> 
> OK makes perfect sense actually.
> 
>> The individual drivers should stay in their respective drivers/ folder,
>> but (c) needs a good home. It would have been mach-foo in the past, and
>> could be drivers/soc now. In (f), I tend to just lookup regmap by name,
>> no DT involved at all.
> 
> OK
> 
>> BTW, syscon is of no use here at all, once it registers itself as a
>> driver for the node, there will be no other drivers registered. That
>> would at least require (again subsystem driven) dummy-nodes for
>> pinctrl, clk, reset.
> 
> Yeah that sucks, we need something more flexible no question
> about that.
> 
> Will the chipctrl driver be as generic as syscon or a
> Berlin-specific thing?

There is nothing berlin-specific about it except what regmap(s) and
platform_devices are registered. I can think of some generic helpers
to ease looping over regmap structs to be registered, IIRC driver core
already provides the same for platform_devices.

Actually, syscon is already a good starting point, it just lacks to
register platform_devices using the DT-registered regmap.

>> Also, using some of_xlate as we already have for clk, gpio, pinctrl ...
>> would put an end to syscon's syscon_get_regmap_from_{foo,bar,baz,...}
>> that gets a new helper every cycle.
> 
> This part I don't understand but I guess I will understand it
> when I see the code.

git grep 'struct regmap \*syscon' drivers/mfd/syscon.c
drivers/mfd/syscon.c:struct regmap *syscon_node_to_regmap(struct
device_node *np)
drivers/mfd/syscon.c:struct regmap
*syscon_regmap_lookup_by_compatible(const char *s)
drivers/mfd/syscon.c:struct regmap
*syscon_regmap_lookup_by_pdevname(const char *s)
drivers/mfd/syscon.c:struct regmap
*syscon_regmap_lookup_by_phandle(struct device_node *np,

and IIRC I have seen pending patches adding more syscon_regmap_by_foo
helpers.

My point is that we should have some regmap-provider to allow
us to use phandle+specifier, just like of_clk_get and friends work.

With some more time after v3.16-rc1 drops, I plan to provide a
chip-ctrl driver for Berlin. Most likely not too generic or based
on extending syscon but definitely something to talk about.

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
