From: Zhi Li <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: imx7d: add arch timer
Date: Thu, 17 Dec 2015 15:23:59 -0600
Message-ID: <CAHrpEqTQFkme-BmVOPHbFwguQkpbYboaXymrRMc-6TDjwO8dUg@mail.gmail.com>
References: <1449789132-18976-1-git-send-email-Frank.Li@freescale.com>
	<024b6540b3ebd5f132d171ba40c6e727@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <024b6540b3ebd5f132d171ba40c6e727-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: "Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 17, 2015 at 2:45 PM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
> On 2015-12-10 15:12, Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
>> From: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>
>> add cortex a7 arch timer.
>> uboot v2016.01-rc2 supported psci basic support.
>> smp can be supported by psci
>
> This sounds a bit overly simplified log message. I am not very into this
> PSCI topic, is this a prerequisit for the ARM arch timers? Maybe you
> could elaborate that a bit more.

No.
But according to previous discussion. Shawn want us to use psci to enable
second core.  We need enable arch timer if second core enabled.

>
> Also, I would prefer full sentences and commonly used spellings such as
> Cortex-A7, U-Boot etc...
>
> --
> Stefan
>
>>
>> Signed-off-by: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/imx7d.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
>> index 489604a..a621af6 100644
>> --- a/arch/arm/boot/dts/imx7d.dtsi
>> +++ b/arch/arm/boot/dts/imx7d.dtsi
>> @@ -119,6 +119,15 @@
>>               clock-output-names = "osc";
>>       };
>>
>> +     timer {
>> +             compatible = "arm,armv7-timer";
>> +             interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +                          <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +                          <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +                          <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>> +             interrupt-parent = <&intc>;
>> +     };
>> +
>>       etr@30086000 {
>>               compatible = "arm,coresight-tmc", "arm,primecell";
>>               reg = <0x30086000 0x1000>;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
