From: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 3/7] ARM: dts: enable hi4511 with device tree
Date: Wed, 16 Oct 2013 10:09:31 +0800
Message-ID: <CAD6h2NTb8-8nSuaa6eQNYBFk3gv94TptZbX7xmz8WKFfCXZ5fg@mail.gmail.com>
References: <1381828577-27998-1-git-send-email-haojian.zhuang@linaro.org>
	<1381828577-27998-4-git-send-email-haojian.zhuang@linaro.org>
	<201310152018.10908.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201310152018.10908.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Shaojie Sun <shaojie.sun-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 16 October 2013 02:18, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 15 October 2013, Haojian Zhuang wrote:
>> Enable Hisilicon Hi4511 development platform with device tree support.
>>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Based on my other mail, some more comments here:
>
>> +/ {
>> +     clocks {
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +             ranges;
>
> Since all clocks are in the fc802000 page, I would prefer using a non-empty
> ranges to map the clocks into their own address space, like
>
>                 ranges = <0 0xfc802000 0x1000>;
>
>
OK.

>> +             timer4_mux: timer4_mux@fc802018 {
>> +                     compatible = "hisilicon,clk-mux";
>> +                     #clock-cells = <0>;
>> +                     clocks = <&osc32k &timerclk45>;
>> +                     clock-output-names = "timer4_mux";
>> +                     reg = <0xfc802018 0x4>;
>> +                     clkmux-mask = <0x3>;
>> +                     clkmux-table = <0 0x1>;
>> +             };
>
> which would turn this into
>
>                 timer4_mux: timer4_mux@18 {
>                         ...
>                         reg = <0x18 0x4>;
>                         ...
>                 };
>
> The code would not be impacted by this.
>
> On a related note, I find it strange that you have multiple devices with the
> same register. Normally, we try to have device node names be generic,
> e.g. 'clock@18' rather than 'timer4_mux@18', but that won't work if the
> register is the same for all of them. Maybe some DT expert can comment
> on this.
>
Because multiple clock nodes (clock mux/clock gate/clock divider) are
sharing the same register. I think that it's common on ARM SoC. At
least, I can find this in both Hisilicon & Marvell PXA/MMP SoC.

If I force to merge multiple clock nodes into the same device node,
it'll become mess. Different clock nodes have different properties.
The property won't work any more if they are merged into the same
device node.

>> +
>> +     amba {
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +             compatible = "arm,amba-bus";
>> +             interrupt-parent = <&gic>;
>> +             ranges;
>> +
>> +             L2: l2-cache {
>> +                     compatible = "arm,pl310-cache";
>> +                     reg = <0xfc10000 0x100000>;
>> +                     interrupts = <0 15 4>;
>> +                     cache-unified;
>> +                     cache-level = <2>;
>> +             };
>
> For this node, we could use the same trick with the non-empty ranges, since
> all amba devices seem to be in the 0xfc000000 range.
>
OK.

> If you do that, it probably makes sense to move the clock controller under here
> as well.
Could I keep them into hi3620-clk.dtsi? Since both hi3620.dtsi &
hi3620-clk.dtsi are not small, merge them together only make people
reading hard.

>
>         Arnd

Best Regards
Haojian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
