From: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 2/7] ARM: hi3xxx: add board support with device tree
Date: Wed, 16 Oct 2013 09:31:06 +0800
Message-ID: <CAD6h2NQ4fT7ycmxh+iLiBx4+u6+QB-H98309cRJLtRO3LGCbJg@mail.gmail.com>
References: <1381828577-27998-1-git-send-email-haojian.zhuang@linaro.org>
	<201310151500.36959.arnd@arndb.de>
	<CAD6h2NR6umVpgYM2t2pwrwP8-Jk-e3Kfng-7oymPJ44cNmuk-w@mail.gmail.com>
	<201310152006.38824.arnd@arndb.de>
	<CAD6h2NRvCdfNef_q=6JyNvv2ZsObmwmh=wgcKu=j6RokE3-sFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD6h2NRvCdfNef_q=6JyNvv2ZsObmwmh=wgcKu=j6RokE3-sFg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Shaojie Sun <shaojie.sun-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 16 October 2013 09:08, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 16 October 2013 02:06, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> On Tuesday 15 October 2013, Haojian Zhuang wrote:
>>> On 15 October 2013 21:00, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>>> > On Tuesday 15 October 2013, Haojian Zhuang wrote:
>>> >>
>>> >> Add board support with device tree for Hisilicon Hi3620 SoC platform.
>>> >>
>>> >> Changelog:
>>> >> v10:
>>> >> 1. Add .map_io() & debug_ll_io_init() back. Since debug_ll_io_init() is
>>> >> only called if .map_io() isn't assigned. Use .map_io() to setup static
>>> >> IO mapping that is used in clock driver.
>>> >>
>>> >
>>> > This seems like a step in the wrong direction. Why would you want to use
>>> > a static I/O mapping in the clock driver?
>>> >
>>>
>>> Because Stephen & Kevin asked me to use unit address in DTS file. They
>>> also require me to use reg property to present real hardware address
>>> in DTS file.
>>
>> Ah, so it's just an optimization, not required to make the clock driver
>> work, I misread that. Can you add a comment near the hi3620_io_desc
>> definition and verify that it still works without it?
>>
> Yes, it can work without the IO table. The IO table could save a lot
> of virtual address space for IO mapping.
>
>> I would also recommend to extend that static mapping to the entire
>> 0xfc800000-0xfcbfffff range, or whatever you can use to get the most
>> I/O devices with a small number of TLB entries.
>>
>>         Arnd
>
> OK. I'll extend the static mapping to the entire range.
>
> Regards
> Haojian

Oh, no. I shouldn't extend the static mapping table to the entire range.

Most of the registers only need to map once in the probe() function
of the driver. Whether it's using static mapping or dynamic mapping,
there's no difference.

 The sysctrl register bank is used in both clock & platform
driver. Each clock node contains reg property, it needs to be parsed
by of_iomap(). Hotplug & SMP platform driver needs to parse sysctrl
register bank also. If I don't choose the static IO mapping for sysctrl
register bank, I have to define some global variable to store the
virtual address mapping. Or I have to cost lots of redundant virtual
address space for the same IO mapping.

So I'll only keep the static IO mapping for sysctrl.

Regards
Haojian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
