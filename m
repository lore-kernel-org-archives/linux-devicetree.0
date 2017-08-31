From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3 v8] ARC: hsdk: initial port for HSDK board
Date: Thu, 31 Aug 2017 10:38:17 -0700
Message-ID: <c689523e-3fb9-8763-c3ec-83815cadbfd4@synopsys.com>
References: <20170712094023.23226-1-Eugeniy.Paltsev@synopsys.com>
 <20170712094023.23226-4-Eugeniy.Paltsev@synopsys.com>
 <20170717173823.lklxhoyylhdxjawa@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170717173823.lklxhoyylhdxjawa@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: arcml <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 07/17/2017 10:38 AM, Rob Herring wrote:
> On Wed, Jul 12, 2017 at 12:40:23PM +0300, Eugeniy Paltsev wrote:
>> From: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>
>> This initial port adds support of ARC HS Development Kit board with some
>> basic features such serial port, USB, SD/MMC and Ethernet.
>>
>> Essentially we run Linux kernel on all 4 cores (i.e. utilize SMP) and
>> heavily use IO Coherency for speeding-up DMA-aware peripherals.
>>
>> Note as opposed to other ARC boards we link Linux kernel to
>> 0x9000_0000 intentionally because cores 1 and 3 configured with DCCM
>> situated at our more usual link base 0x8000_0000. We still can use
>> memory region starting at 0x8000_0000 as we reallocate DCCM in our
>> platform code.
>>
>> Note that PAE remapping for DMA clients does not work due to an RTL bug,
>> so CREG_PAE register must be programmed to all zeroes, otherwise it will
>> cause problems with DMA to/from peripherals even if PAE40 is not used.
>>
>> Signed-off-by: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> ---
>> Changes v7 -> v8:
>>   * DTS: move cpu_intc, idu_intc, arcpct, timer, gfrc nodes to root
>>     level and out of the cpus node.
>>   * DTS: add vendor-specific compatible for ohci and ehci nodes.
>>   * DTS: style fixes
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> 
>> +		ohci@60000 {
>> +			compatible = "snps,hsdk-v1.0-ohci", "generic-ohci";
>> +			reg = <0x60000 0x100>;
>> +			interrupts = <15>;
>> +		};
>> +
>> +		ehci@40000 {
>> +			compatible = "snps,hsdk-v1.0-ehci", "generic-ehci";
>> +			reg = <0x40000 0x100>;
>> +			interrupts = <15>;
>> +		};
> 
> Of course, now these compatibles need to be documented. You can do that
> in a separate follow-up patch.


Are these v1 suffixes really needed. We don't envision any change to usb IP even 
if we were to ever do a respin of the board !

Thx,
-Vineet
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
