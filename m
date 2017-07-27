From: Suzuki K Poulose <Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 5/6] dt-bindings: Document devicetree binding for ARM
 DSU PMU
Date: Thu, 27 Jul 2017 17:09:02 +0100
Message-ID: <0df5b445-6bbe-03ba-c302-9e1d580e9228@arm.com>
References: <1501168218-26741-1-git-send-email-suzuki.poulose@arm.com>
 <1501168218-26741-6-git-send-email-suzuki.poulose@arm.com>
 <CAL_JsqLkeaMh8afWvYwca61OrX7QYzDt+eup_b3rQuyxumLwfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLkeaMh8afWvYwca61OrX7QYzDt+eup_b3rQuyxumLwfw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 27/07/17 16:52, Rob Herring wrote:
> +DT list
>
> On Thu, Jul 27, 2017 at 10:10 AM, Suzuki K Poulose
> <suzuki.poulose-5wv7dgnIgG8@public.gmane.org> wrote:
>> This patch documents the devicetree bindings for ARM DSU PMU.
>>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  .../devicetree/bindings/arm/arm-dsu-pmu.txt        | 27 ++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/arm-dsu-pmu.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm-dsu-pmu.txt b/Documentation/devicetree/bindings/arm/arm-dsu-pmu.txt
>> new file mode 100644
>> index 0000000..b9935ac
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm-dsu-pmu.txt
>> @@ -0,0 +1,27 @@
>> +* ARM DynamIQ Shared Unit (DSU) Performance Monitor Unit (PMU)
>> +
>> +ARM DyanmIQ Shared Unit (DSU) integrates one or more CPU cores
>> +with a shared L3 memory system, control logic and external interfaces to
>> +form a multicore cluster. The PMU enables to gather various statistics on
>> +the operations of the DSU. The PMU provides independent 32bit counters that
>> +can count any of the supported events, along with a 64bit cycle counter.
>> +The PMU is accessed via CPU system registers and has no MMIO component.
>> +
>> +** DSU PMU required properties:
>> +
>> +- compatible   : should be one of :
>> +
>> +               "arm,dsu-pmu"
>
> Seems kind of generic. There's only one flavor is DSU?
>

Yes, there is only flavor. It is not something others can modify.
There could be different revisions of the product (in the future), but that
can be identified from the ID registers and can be handled accordingly.

>> +
>> +- interrupts   : Exactly 1 SPI must be listed.
>> +
>> +- cpus         : List of phandles for the CPUs connected to this DSU instance.
>> +
>> +
>> +** Example:
>> +
>> +dsu_pmu@0 {
>
> Don't use "_" in node names and unit-address is not valid without a
> reg property.

Ok.

Thanks for the comments, I will fix them in the next version.

Suzuki

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
