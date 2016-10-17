From: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: Update Broadcom NS2 to generic IOMMU
 binding
Date: Mon, 17 Oct 2016 16:27:05 -0700
Message-ID: <fd300ca1-e848-f6dd-b8eb-5883ac441f07@broadcom.com>
References: <acf4f770eab43fec8c5b6e9cddb6dd0defc52138.1476706244.git.robin.murphy@arm.com>
 <f2de1b15adb2f57529734a4769ef04d9cde3cc5d.1476706244.git.robin.murphy@arm.com>
 <6f96a6cc-7e12-6827-ce88-65e2accda576@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6f96a6cc-7e12-6827-ce88-65e2accda576-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Florian,

Could you add this to the queue?

On 16-10-17 02:50 PM, Ray Jui wrote:
> Hi Robin,
>
> On 10/17/2016 5:13 AM, Robin Murphy wrote:
>> With the "mmu-masters" property now deprecated and optional, the
>> generic binding offers a more efficient way to specify no masters.
>>
>> CC: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> CC: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> CC: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/broadcom/ns2.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi
>> b/arch/arm64/boot/dts/broadcom/ns2.dtsi
>> index d95dc408629a..65530e193e8a 100644
>> --- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
>> +++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
>> @@ -248,7 +248,7 @@
>>                       <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
>>                       <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
>>                       <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
>> -            mmu-masters;
>> +            #iommu-cells = <1>;
>>          };
>>
>>          pinctrl: pinctrl@6501d130 {
>>
>
> Thanks!
>
> Acked-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Thanks,
  Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
