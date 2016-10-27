From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 13/15] Documentation: devicetree: dwc2: Add host DMA
 binding
Date: Thu, 27 Oct 2016 14:33:03 -0700
Message-ID: <118c9ef9-f110-5329-4520-9e07bc0e0ad4@synopsys.com>
References: <cover.1476926069.git.johnyoun@synopsys.com>
 <1846cc28dd77ab35cd21994bb746f7685422cfb2.1476926070.git.johnyoun@synopsys.com>
 <20161026220718.2vqcpts6mw2vf7jh@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161026220718.2vqcpts6mw2vf7jh@rob-hp-laptop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/26/2016 3:07 PM, Rob Herring wrote:
> On Wed, Oct 19, 2016 at 06:22:52PM -0700, John Youn wrote:
>> Add the host-dma property to devicetree. This controls whether to use
>> DMA in host mode.
>>
>> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/usb/dwc2.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
>> index 2c30a54..17f7624 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
>> @@ -25,6 +25,7 @@ Optional properties:
>>  Refer to phy/phy-bindings.txt for generic phy consumer properties
>>  - dr_mode: shall be one of "host", "peripheral" and "otg"
>>    Refer to usb/generic.txt
>> +- host-dma: turn on or off host buffer DMA (1 or 0).
> 
> Why not boolean? Seems like disabling would be rare, so name the 
> property something like host-dma-disable.

Ok.

> Also, it needs a vendor 
> prefix.
> 

The dwc2 driver doesn't have vendor prefixes on existing DT
bindings. Is this required? If so I guess we'd have to deprecate the
old ones and add new ones with the vendor prefix?

Regards,
John
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
