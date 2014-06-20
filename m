From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] dt/documentation: add specification of dma bus information
Date: Fri, 20 Jun 2014 15:02:43 -0400
Message-ID: <53A48553.2080504@ti.com>
References: <1401981720-6946-1-git-send-email-santosh.shilimkar@ti.com> <CAL_JsqJAtWnHKPVpDsdOOzT_X=npc3hroLNTGqULM2SJr=1OEg@mail.gmail.com> <53A46CB7.1030109@ti.com> <4193075.zZSpRTFEYz@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4193075.zZSpRTFEYz@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 20 June 2014 02:56 PM, Arnd Bergmann wrote:
> On Friday 20 June 2014 13:17:43 Santosh Shilimkar wrote:
>>>> +                       dma-coherent;
>>>> +                       dma-ranges;
>>>> +
>>>> +                       dwc3@2690000 {
>>>> +                               compatible = "synopsys,dwc3";
>>>> +                               [...]
>>>> +                       };
>>>
>>> This example is a bit strange. I don't understand the relationship
>>> between keystone-dwc3 and synopsys,dwc3, nor do I want to. I'd prefer
>>> to see a simple example here.
> 
> 
>>> dma-ranges is a property of the parent which you show, but
>>> dma-coherent originally was a property of the bus master itself. While
>>> we need to support that, are we changing that? We need to be clear on
>>> where the property belongs even if the kernel is more lax.
>>>
>> I don't think we are changing it fundamentally but may be I missing
>> your point. The dma-coherent as is now a per-device property.
>> USB is one of the bus master supports coherency and hence showed
>> up in above example.
> 
> I think it's enough if you just drop the "synopsys,dwc3" node and the
> intermediate dma-ranges property from the example, leaving the
> dma-coherent property in the "ti,keystone-dwc3" node.
> 
Thanks Arnd. That should avoid the confusion. Just to see if Rob is
fine by it, the example will look like below.

Example:
soc {
		compatible = "ti,keystone","simple-bus";
		ranges = <0x0 0x0 0x0 0xc0000000>;
		dma-ranges = <0x80000000 0x8 0x00000000 0x80000000>;

		[...]

		usb: usb@2680000 {
			compatible = "ti,keystone-dwc3";

			[...]
			dma-coherent;
		};
};

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
