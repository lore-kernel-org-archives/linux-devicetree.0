From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [Patch] ARM: dts: keystone: add pll controller syscon entry
Date: Wed, 21 May 2014 22:22:50 +0400
Message-ID: <537CEEFA.8080805@cogentembedded.com>
References: <1400681875-24432-1-git-send-email-ivan.khoronzhuk@ti.com> <537CEE13.5040908@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537CEE13.5040908-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, santosh.shilimkar-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/21/2014 10:18 PM, Sergei Shtylyov wrote:

>> The pll controller register set includes sets of registers with
>> different purposes, so it's logically to add syscon entry to be able
>> to access them from appropriate places.

>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
>> ---

>> Based on linux-next/master

>>   arch/arm/boot/dts/keystone.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>
>> diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
>> index d9f99e7..5e67c5b 100644
>> --- a/arch/arm/boot/dts/keystone.dtsi
>> +++ b/arch/arm/boot/dts/keystone.dtsi
>> @@ -66,6 +66,11 @@
>>           ranges = <0x0 0x0 0x0 0xc0000000>;
>>           dma-ranges = <0x80000000 0x8 0x00000000 0x80000000>;
>>
>> +        pllctrl: pll_controller {

>    I think it's better to follow the pattern established by "reset-controller"
> and use hyphen ISO dash in the node name. This is also a common practice to

    Oops, hyphen and dash are basically the same thing; I meant 
s/dash/underscore/.

> use hyphens in the device trees overall.

>> +            compatible = "ti,keystone-pllctrl", "syscon";
>> +            reg = <0x2310000 0x200>;
>> +        };
>> +
>>           rstctrl: reset-controller {
>>               compatible = "ti,keystone-reset";
>>               reg = <0x023100e8 4>;    /* pll reset control reg */
>>

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
