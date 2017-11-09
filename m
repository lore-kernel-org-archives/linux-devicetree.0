From: YiPing Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: hi3660: improve pmu description
Date: Thu, 9 Nov 2017 16:17:15 +0800
Message-ID: <6b698589-3847-020e-563d-b7807ddb50d4@hisilicon.com>
References: <1510131578-84235-1-git-send-email-xuyiping@hisilicon.com>
 <CAL_JsqKFMSvRCB48X4eiPpi5nAL4WGGVGh8GRJpp_JMNdALjbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKFMSvRCB48X4eiPpi5nAL4WGGVGh8GRJpp_JMNdALjbw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 2017/11/8 23:55, Rob Herring wrote:
> On Wed, Nov 8, 2017 at 2:59 AM, Xu YiPing <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org> wrote:
>> cortex a73 pmu is supported, use it instead of armpmu-v3
>
> The subject is misleading and you need a better commit message. Why is
> this change needed? You are going from 1 to 2 devices.
>
> Missing your S-o-B, too.
>
>> ---
>>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 22 +++++++++++++---------
>>  1 file changed, 13 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
>> index 13ae69f..f638897 100644
>> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
>> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
>> @@ -203,21 +203,25 @@
>>                                          IRQ_TYPE_LEVEL_HIGH)>;
>>         };
>>
>> -       pmu {
>> -               compatible = "arm,armv8-pmuv3";
>> +       pmu_a53 {
>
> Don't use '_' in node names. Building with W=2 will tell you this.

OK, i'll modify it
>
>> +               compatible = "arm,cortex-a53-pmu";
>>                 interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
>>                              <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
>>                              <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
>> -                            <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
>> -                            <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
>> -                            <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
>> -                            <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
>> -                            <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>> +                            <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
>>                 interrupt-affinity = <&cpu0>,
>>                                      <&cpu1>,
>>                                      <&cpu2>,
>> -                                    <&cpu3>,
>> -                                    <&cpu4>,
>> +                                    <&cpu3>;
>> +       };
>> +
>> +       pmu_a73 {
>> +               compatible = "arm,cortex-a73-pmu";
>> +               interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>> +               interrupt-affinity = <&cpu4>,
>>                                      <&cpu5>,
>>                                      <&cpu6>,
>>                                      <&cpu7>;
>> --
>> 2.7.4
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
> .
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
