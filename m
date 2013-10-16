From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 3/7] ARM: dts: enable hi4511 with device tree
Date: Wed, 16 Oct 2013 09:26:56 +0200
Message-ID: <CACRpkdZ5qWiM7xp-Wc1jtQYvEOGyA11pvR80ds6NtHXP-U6AtQ@mail.gmail.com>
References: <1381828577-27998-1-git-send-email-haojian.zhuang@linaro.org>
	<1381828577-27998-4-git-send-email-haojian.zhuang@linaro.org>
	<201310152018.10908.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201310152018.10908.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Shaojie Sun <shaojie.sun-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 15, 2013 at 8:18 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 15 October 2013, Haojian Zhuang wrote:

> Since all clocks are in the fc802000 page, I would prefer using a non-empty
> ranges to map the clocks into their own address space, like
>
>                 ranges = <0 0xfc802000 0x1000>;
>
>
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

I'd rather question the addition of a reg =<>; specifier
for each and every clock.

Knowing the offsets of each and every register in a
memory-mapped device is usually overdesign, and
goes from specifying register base to specifying
register offsets and to me that is overspecifying.

I'd rather give each clock a unique ID or something,
then let the driver know the offsets, and specify the
base and size in the top node.

This becomes more obvious with a second silicon
revision moving the registers around - with this
design all of the clocks need updating, but if you're
lucky with less knowledge in the DTS you only need
a new compatible string and the knowledge of the new
whereabout for the regs is kept in the driver.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
