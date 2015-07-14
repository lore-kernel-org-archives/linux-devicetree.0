From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 5/5] arm64: dts: mt8173: add timer node
Date: Tue, 14 Jul 2015 12:27:34 +0800
Message-ID: <CAGS+omCU=phZABBbBw_ad04BBT=Vd2HtfiBmSxepGT9nOpvYaw@mail.gmail.com>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
 <1436779969-18610-6-git-send-email-yingjoe.chen@mediatek.com> <CAGS+omAQ7bKD4Jqwm=hv=D_aMxXpT4dKgzU4QqntnLEa0Fup-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omAQ7bKD4Jqwm=hv=D_aMxXpT4dKgzU4QqntnLEa0Fup-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 14, 2015 at 12:26 PM, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Mon, Jul 13, 2015 at 5:32 PM, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>> From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>
>> Add device node to enable GPT timer. This timer will be
>> used as sched clock source.
>>
>> Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> This binding needs documentation.

Whoops.  I just found it at:
Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt

>
>> ---
>>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> index 0696f8f..04bdd8f 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> @@ -219,6 +219,15 @@
>>                         reg = <0 0x10007000 0 0x100>;
>>                 };
>>
>> +               timer: timer@10008000 {
>> +                       compatible = "mediatek,mt8173-timer",
>> +                                    "mediatek,mt6577-timer";
>> +                       reg = <0 0x10008000 0 0x1000>;
>> +                       interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW>;
>> +                       clocks = <&infracfg CLK_INFRA_CLK_13M>,
>> +                                <&topckgen CLK_TOP_RTC_SEL>;
>
> Why two clocks?  The driver only uses one.
> Please use a clock-names property.
>
> Thanks,
> -Dan
>
>> +               };
>> +
>>                 pwrap: pwrap@1000d000 {
>>                         compatible = "mediatek,mt8173-pwrap";
>>                         reg = <0 0x1000d000 0 0x1000>;
>> --
>> 1.8.1.1.dirty
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
