From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM64: dts: enable clock support for Broadcom NS2
Date: Wed, 18 Nov 2015 16:07:51 -0800
Message-ID: <564D12D7.7090407@gmail.com>
References: <1447888430-4451-1-git-send-email-jonmason@broadcom.com> <1447888430-4451-4-git-send-email-jonmason@broadcom.com> <564D11C0.409@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <564D11C0.409-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 18/11/15 16:03, Ray Jui wrote:
> 
> 
> On 11/18/2015 3:13 PM, Jon Mason wrote:
>> Add device tree entries for clock support for Broadcom Northstar 2 SoC
>>
>> Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>   arch/arm64/boot/dts/broadcom/ns2.dtsi | 80
>> ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 79 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi
>> b/arch/arm64/boot/dts/broadcom/ns2.dtsi
>> index 9610822..a510d3a 100644
>> --- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
>> +++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
>> @@ -31,6 +31,7 @@
>>    */
>>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/clock/bcm-ns2.h>
>>
>>   /memreserve/ 0x84b00000 0x00000008;
>>
>> @@ -109,6 +110,33 @@
>>                        <&A57_3>;
>>       };
>>
>> +    clocks {
> 
> Is this a new convention? That is, group all clocks without a base
> register address in a node named "clocks", but at the same time, put all
> other clocks with base register address under a bus node.

I do not think that is new, lots of platforms do that. The clock
providers/controllers would typically be in the 'bus' nodes because it
has a register interface, while the synthetic clocks would be under
'clocks'.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
