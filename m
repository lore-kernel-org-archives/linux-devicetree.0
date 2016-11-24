From: John Garry <john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 1/6] arm64: arch_timer: Add device tree binding for
 hisilicon-161601 erratum
Date: Thu, 24 Nov 2016 12:12:22 +0000
Message-ID: <624c1751-9b66-1d10-78ae-8cb4edea6109@huawei.com>
References: <1479212167-5812-1-git-send-email-dingtianhong@huawei.com>
 <c3020c0d-bc45-2bb1-f53a-c5e76ab45499@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c3020c0d-bc45-2bb1-f53a-c5e76ab45499-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 21/11/2016 12:49, Ding Tianhong wrote:
> Ping....

Hi,

was there a cover letter for 0/6? I never saw it.

Thanks,
John

>
> On 2016/11/15 20:16, Ding Tianhong wrote:
>> This erratum describes a bug in logic outside the core, so MIDR can't be
>> used to identify its presence, and reading an SoC-specific revision
>> register from common arch timer code would be awkward.  So, describe it
>> in the device tree.
>>
>> v2: Use the new erratum name and update the description.
>>
>> Signed-off-by: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/arch_timer.txt | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arch_timer.txt b/Documentation/devicetree/bindings/arm/arch_timer.txt
>> index ef5fbe9..c27b2c4 100644
>> --- a/Documentation/devicetree/bindings/arm/arch_timer.txt
>> +++ b/Documentation/devicetree/bindings/arm/arch_timer.txt
>> @@ -31,6 +31,14 @@ to deliver its interrupts via SPIs.
>>    This also affects writes to the tval register, due to the implicit
>>    counter read.
>>
>> +- hisilicon,erratum-161601 : A boolean property. Indicates the presence of
>> +  erratum 161601, which says that reading the counter is unreliable unless
>> +  reading twice on the register and the value of the second read is larger
>> +  than the first by less than 32. If the verification is unsuccessful, then
>> +  discard the value of this read and repeat this procedure until the verification
>> +  is successful.  This also affects writes to the tval register, due to the
>> +  implicit counter read.
>> +
>>  ** Optional properties:
>>
>>  - arm,cpu-registers-not-fw-configured : Firmware does not initialize
>>
>
> _______________________________________________
> linuxarm mailing list
> linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
> http://rnd-openeuler.huawei.com/mailman/listinfo/linuxarm
>
> .
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
