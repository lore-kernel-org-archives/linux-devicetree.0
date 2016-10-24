From: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: arch_timer: Add device tree binding for
 hisilicon-161x01 erratum
Date: Mon, 24 Oct 2016 16:43:25 +0800
Message-ID: <6697f1a4-3c22-d0ef-e2c2-41f0ff36fbf0@huawei.com>
References: <962ea92f-870b-e1d0-5bb7-1a6d66c35122@huawei.com>
 <3a29c03a-2da1-7bfe-28ff-21dada50ee8d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3a29c03a-2da1-7bfe-28ff-21dada50ee8d-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2016/10/24 16:36, Marc Zyngier wrote:
> On 23/10/16 04:21, Ding Tianhong wrote:
>> This erratum describes a bug in logic outside the core, so MIDR can't be
>> used to identify its presence, and reading an SoC-specific revision
>> register from common arch timer code would be awkward.  So, describe it
>> in the device tree.
>>
>> Signed-off-by: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/arch_timer.txt | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arch_timer.txt b/Documentation/devicetree/bindings/arm/arch_timer.txt
>> index ef5fbe9..26bc837 100644
>> --- a/Documentation/devicetree/bindings/arm/arch_timer.txt
>> +++ b/Documentation/devicetree/bindings/arm/arch_timer.txt
>> @@ -31,6 +31,12 @@ to deliver its interrupts via SPIs.
>>    This also affects writes to the tval register, due to the implicit
>>    counter read.
>>
>> +- hisilicon,erratum-161x01 : A boolean property. Indicates the presence of
>> +  QorIQ erratum 161201, which says that reading the counter is
> 
> Other than the copy/paste of the FSL erratum, please document the actual
> erratum number. Is that 161x01 or 161201?
> 

Sorry for the lazy behavior.

>> +  unreliable unless the small range of value is returned by back-to-back reads.
> 
> That's a detail that doesn't belong in the DT, but that would be much
> better next to the code doing the actual handling.
> 
Got it.

Thanks
Ding

>> +  This also affects writes to the tval register, due to the implicit
>> +  counter read.
>> +
>>  ** Optional properties:
>>
>>  - arm,cpu-registers-not-fw-configured : Firmware does not initialize
>>
> 
> Thanks,
> 
> 	M.
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
