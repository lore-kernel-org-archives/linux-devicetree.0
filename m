From: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH Resend 0/2] arm64: Add PMU node for APM X-Gene Storm SoC
Date: Tue, 12 Aug 2014 09:20:50 -0700
Message-ID: <CAL85gmDw3-yacob+t+DcBU2qNhTUSj=cTBkv7kNc9ocTb+=FCA@mail.gmail.com>
References: <1407800853-3149-1-git-send-email-fkan@apm.com>
	<CALrVBkumLjUZMsfWTn3e_5U=jDFerx0LLzESiuNPZrnBVVfgQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALrVBkumLjUZMsfWTn3e_5U=jDFerx0LLzESiuNPZrnBVVfgQg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anup Patel <anup.patel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: patches <patches-qTEPVZfXA3Y@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dann Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 11, 2014 at 8:47 PM, Anup Patel <anup.patel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 12 August 2014 05:17, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org> wrote:
>> This patch series adds PMU node for APM X-Gene's Potenza CPU.
>> Potenza CPU PMU is compatible with ARMv8-PMUv3.
>>
>> I have remove the previous notice regarding the dependancy on the GIC driver
>> from the commit message.
>>
>> Feng Kan (1):
>>   dt-bindings: Add Potenza PMU binding
>>
>> Vinayak Kale (1):
>>   arm64: dts: Add PMU node for APM X-Gene Storm SOC
>>
>>  Documentation/devicetree/bindings/arm/pmu.txt | 1 +
>>  arch/arm64/boot/dts/apm-storm.dtsi            | 5 +++++
>>  2 files changed, 6 insertions(+)
>>
>> --
>> 1.9.1
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
> Hi Feng,
>
> Please follow proper protocol when resending patchset originally
> authored by someone else.
> (http://comments.gmane.org/gmane.linux.ports.arm.kernel/310795)
I will retract this patch and reauthor it. The person originally started the
patch has left the company. I will take over to resubmit it.


>
> Also, I see that original patchset clearly states that second patch
> depends on a GIC patch [1] authored by you:
>
> [1]- https://lkml.org/lkml/2014/2/27/605
> (irqchip:gic: change access of gicc_ctrl register to read modify write)
>
> I have recently posted RFC patch for PMU support in KVM ARM64
> which also requires your GIC patch for APM X-Gene.
>
> Regards,
> Anup
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
