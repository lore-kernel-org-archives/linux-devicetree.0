From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] arm64: dts: Add mediatek MT8173 SoC and evaluation
 board dts and Makefile
Date: Thu, 11 Dec 2014 14:02:53 +0100
Message-ID: <CABuKBeLOcr_CViztHidiXFUzjJ6keJgRrLiEr997Qr34THqicQ@mail.gmail.com>
References: <1418208602-35584-1-git-send-email-eddie.huang@mediatek.com>
	<1418208602-35584-4-git-send-email-eddie.huang@mediatek.com>
	<1418221662.21309.13.camel@mtksdaap41>
	<CABuKBe+U22ogGBToftgaSJw6fcJmciGfa9scAkyP3g5OJSaAOA@mail.gmail.com>
	<1418302026.1992.18.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418302026.1992.18.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?B?WUggQ2hlbiAo6Zmz5pix6LGqKQ==?= <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Eddie,

2014-12-11 13:47 GMT+01:00 Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> On Wed, 2014-12-10 at 15:50 +0100, Matthias Brugger wrote:
>> 2014-12-10 15:27 GMT+01:00 Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
>> >
>> > Hi,
>> >
>> > On Wed, 2014-12-10 at 18:50 +0800, Eddie Huang wrote:
>> > <...>
>> >> diff --git a/arch/arm64/boot/dts/mt8173-evb.dts b/arch/arm64/boot/dts/mt8173-evb.dts
>> >> new file mode 100644
>> >> index 0000000..adf26dd
>> >> --- /dev/null
>> >> +++ b/arch/arm64/boot/dts/mt8173-evb.dts
>> > <...>
>> >> +     timer {
>> >> +             compatible = "arm,armv8-timer";
>> >> +             interrupt-parent = <&gic>;
>> >> +             interrupts = <1 13 0x8>,
>> >> +                          <1 14 0x8>,
>> >> +                          <1 11 0x8>,
>> >> +                          <1 10 0x8>;
>> >> +             clock-frequency = <13000000>;
>> >
>> > I believe our firmware doesn't need this line. Please remove it.
>>
>> The point here would be to know if you need to enable a special timer
>> from the mtk-timer block to get the arch timer working.
>> In any case, you will need some sort of timer. This dts does not
>> describe the mtk-timer (may in the mt8173 it does not exist) but
>> defines the clocks clk26m and clk32k. So if you don't use the
>> mtk-timer, please remove the clocks as there isn't a block using them.
>>
>
> MT8173 has two timer set: CPUGPT and APBGPT, and use CPUGPT to enable
> arch_timer. Previous series only have APBGPT. MT8173 still need enable
> CPUGPT to get arch timer working, we put this in loader, and transparent
> to kernel. So I will remove clk26m and clk32k in next version.

Ok, so if this is done in the bootloader, there shouldn't be a problem
then. Perfect.

Just one more comment on the dts nodes. Can you use the makros defined
for the interrupt type
e.g "GIC_PPI 14 IRQ_TYPE_LEVEL_LOW" instead of "1 14 0x8". This makes
the dts easier to read.

Thanks,
Matthias

>



-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
