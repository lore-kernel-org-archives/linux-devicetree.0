From: Anurup M <anurupvasu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH v1 05/11] dt-bindings: perf: hisi: Add Devicetree
 bindings for Hisilicon SoC PMU
Date: Fri, 4 Nov 2016 10:36:38 +0530
Message-ID: <581C175E.2040805@gmail.com>
References: <1478151727-20250-1-git-send-email-anurup.m@huawei.com>
 <1478151727-20250-6-git-send-email-anurup.m@huawei.com>
 <20161103182609.GA11071@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161103182609.GA11071@kozik-lap>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, zhangshaokun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, sanil.kumar-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shiju.jose-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shyju.pv-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Thursday 03 November 2016 11:56 PM, Krzysztof Kozlowski wrote:
> On Thu, Nov 03, 2016 at 01:42:01AM -0400, Anurup M wrote:
>> 	1) Device tree bindings for Hisilicon SoC PMU.
>> 	2) Add example for Hisilicon L3 cache, MN and DDRC PMU.
> Get rid of this weird indentation in all patches.
Thanks. I shall remove the TAB from the commit message in all patches.
>
>> Signed-off-by: Anurup M <anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Shaokun Zhang <zhangshaokun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> ---
>>   .../devicetree/bindings/arm/hisilicon/pmu.txt      | 127 +++++++++++++++++++++
>>   1 file changed, 127 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/hisilicon/pmu.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/pmu.txt b/Documentation/devicetree/bindings/arm/hisilicon/pmu.txt
>> new file mode 100644
>> index 0000000..e7b35e0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/hisilicon/pmu.txt
>> @@ -0,0 +1,127 @@
>> +Hisilicon SoC hip05/06/07 ARMv8 PMU
>> +===================================
>> +
>> +The Hisilicon SoC chips like hip05/06/07 etc. consist of varous independent
>> +system device PMU's such as L3 cache (L3C), Miscellaneous Nodes(MN) and DDR
>> +comtroller. These PMU devices are independent and have hardware logic to
>> +gather statistics and performance information.
>> +
>> +HiSilicon SoC chip is encapsulated by multiple CPU and IO die's. The CPU die
>> +is called as Super CPU cluster (SCCL) which includes 16 cpu-cores. Every SCCL
>> +is further grouped as CPU clusters (CCL) which includes 4 cpu-cores each.
>> +e.g. In the case of hip05/06/07, each SCCL has 1 L3 cache and 1 MN PMU device.
>> +
>> +The Hisilicon SoC PMU DT node bindigs for uncore PMU devices are as below.
>> +For PMU devices like L3 cache. MN etc. which are accessed using the djtag,
>> +the parent node will be the djtag node of the corresponding CPU die(SCCL).
>> +
>> +For uncore PMU devices there are some common required properties as detailed
>> +below.
>> +
>> +Required properties:
>> +	- compatible : This field contain two values. The first value is
>> +		always "hisilicon" and second value is the Module type as shown
>> +		in below examples:
> Over-complicated sentence. Just:
>
> 	- compatible : One of:
> 		"hisilicon,hisi-pmu-l3c-v1" for Hisilicon SoC L3C PMU
> 			device (Version 1)
> 		...
> 		...
Thanks. Shall refine it in next version.
> BTW, No need of CC-ing me. I am not a maintainer of relevant subsystems.
Sure.

Thanks,
Anurup
> Best regards,
> Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
