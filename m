From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 03/30] usb: dwc2: gadget: Add descriptor DMA binding
Date: Tue, 8 Nov 2016 14:32:16 -0800
Message-ID: <1a86e2e9-9719-40f6-978f-073783bcd920@synopsys.com>
References: <cover.1478558343.git.johnyoun@synopsys.com>
 <e0d302ebcbad32242da84894c173b743b9199f71.1478558343.git.johnyoun@synopsys.com>
 <87r36mib8z.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87r36mib8z.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Vahram Aharonyan <vahrama-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/8/2016 1:15 AM, Felipe Balbi wrote:
> John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
> 
>> From: Vahram Aharonyan <vahrama-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>
>> Add the devicetree binding to enable descriptor DMA and read it in to
>> the corresponding parameter during probe.
>>
>> Signed-off-by: Vahram Aharonyan <vahrama-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/usb/dwc2.txt |  1 +
>>  drivers/usb/dwc2/core.h                        |  4 ++++
>>  drivers/usb/dwc2/gadget.c                      | 11 +++++++++++
>>  drivers/usb/dwc2/params.c                      |  4 ++++
>>  4 files changed, 20 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
>> index 389a461..1db9c37 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
>> @@ -27,6 +27,7 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
>>    Refer to usb/generic.txt
>>  - snps,host-dma-disable: disable host DMA mode.
>>  - snps,gadget-dma-enable: enable gadget DMA mode.
>> +- snps,gadget-dma-desc-enable: enable gadget DMA descriptor mode.
> 
> seems to be discoverable as well:
> 
> #define GHWCFG4_DESC_DMA_DYN			(1 << 31)
> #define GHWCFG4_DESC_DMA			(1 << 30)
> 
> care to comment?
> 

This is just following patch 1/30 for consistency.

We can make it discoverable and set automatically as well.

John


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
