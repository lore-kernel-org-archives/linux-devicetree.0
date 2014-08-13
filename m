From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/7] arm: mediatek: enable gpt6 on boot up to make arch
 timer working
Date: Wed, 13 Aug 2014 10:47:48 +0200
Message-ID: <CACRpkdZOB=9wQ3R3sfcBEiNXLVRtgob4iLZ9QWXyVrgjqyvGXQ@mail.gmail.com>
References: <1406824943-24052-1-git-send-email-matthias.bgg@gmail.com>
	<1406824943-24052-7-git-send-email-matthias.bgg@gmail.com>
	<CACRpkdbRhGE8tcKj+W_4F9-xmcm-fxcYuCmLOqX-ESC+3PAmyA@mail.gmail.com>
	<CABuKBe+Q3tnN0s22EMY-dK_6FeN_xN9SmrsW3dPONR6QDJ+V_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABuKBe+Q3tnN0s22EMY-dK_6FeN_xN9SmrsW3dPONR6QDJ+V_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, stefan-XLVq0VzYD2Y@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "Berg, Anders" <anders.berg-M7mHMAq9Yzo@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kern>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 12, 2014 at 11:02 AM, Matthias Brugger
<matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 2014-08-11 9:15 GMT+02:00 Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>> On Thu, Jul 31, 2014 at 6:42 PM, Matthias Brugger
>> <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>>> We enable GTP6 which ungates the arch timer clock. Apart we write the
>>> frequency with which the timer is running in the CNTFREQ register.
>>> In the future this should be done in the bootloader.
>>>
>>> Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> (...)
>>
>>> +       if (of_machine_is_compatible("mediatek,mt6589")) {
>>> +               /* set cntfreq register which is not done in bootloader */
>>> +               asm volatile("mcr p15, 0, %0, c14, c0, 0" : : "r" (13000000));
>>
>> I guess this is for something like the ARM arch timer in
>> drivers/clocksource/arm_arch_timer.c
>>
>> Instead of doing this, use the DT property "clock-frequency" on
>> the ARM arch timer node, as that overrides the CP15 setting.
>>
>>> +
>>> +               /* turn on GPT6 which ungates arch timer clocks */
>>> +               gpt_base = ioremap(GPT6_CON_MT65xx, 0x04);
>>> +       }
>>> +
>>> +       /* enabel clock and set to free-run */
>>> +       if (gpt_base)
>>> +               writel(0x31, gpt_base);
>>
>> Why is this not done properly in the GPT driver (I guess
>> in drivers/clocksource/mtk_timer.c) instead of remapping
>> it and fiddling around in the machine?
>
> I didn't put it in the GPT driver, because that would mean, that you
> need to have the mtk_timer to be able to use the ARM arch timer.
> From my understanding this are two independent blocks in the SoC.
> Apart from that, as stated in the commit message, this patch is a
> workaround until we have a bootloader which does this for us.
> Therefore I thought the init_time function would be the better place to do this.

OK I get the point...

What about the ARM arch timer fixup then, will that also be
fixed in the boot loader eventually?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
