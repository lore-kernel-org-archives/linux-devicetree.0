From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dt/documentation: add specification of dma bus information
Date: Fri, 26 Sep 2014 11:32:25 -0500
Message-ID: <CAL_Jsq+Lu0D3o0wrFS0tug_7oTtySaAEJCEJWBaOha4RHsoxZg@mail.gmail.com>
References: <1401981720-6946-1-git-send-email-santosh.shilimkar@ti.com>
 <CAL_JsqJAtWnHKPVpDsdOOzT_X=npc3hroLNTGqULM2SJr=1OEg@mail.gmail.com>
 <53A46CB7.1030109@ti.com> <4193075.zZSpRTFEYz@wuerfel> <53A48553.2080504@ti.com>
 <CAL_JsqLYho6dRA=-ovKqF7H4EGHJcH_aN3ywd+76oXSprfTMbQ@mail.gmail.com>
 <53A73110.60405@ti.com> <541C7609.3000901@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <541C7609.3000901-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 19, 2014 at 1:29 PM, Grygorii Strashko
<grygorii.strashko-l0cyMroinI0@public.gmane.org> wrote:
> Hi Rob,
>
>
> On 06/22/2014 10:40 PM, Santosh Shilimkar wrote:
>>
>> On Friday 20 June 2014 03:46 PM, Rob Herring wrote:
>>>
>>> On Fri, Jun 20, 2014 at 2:02 PM, Santosh Shilimkar
>>> <santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
>>>>
>>>> On Friday 20 June 2014 02:56 PM, Arnd Bergmann wrote:
>>>>>
>>>>> On Friday 20 June 2014 13:17:43 Santosh Shilimkar wrote:
>>>>>>>>
>>>>>>>> +                       dma-coherent;
>>>>>>>> +                       dma-ranges;
>>>>>>>> +
>>>>>>>> +                       dwc3@2690000 {
>>>>>>>> +                               compatible = "synopsys,dwc3";
>>>>>>>> +                               [...]
>>>>>>>> +                       };
>>>>>>>
>>>>>>>
>>>>>>> This example is a bit strange. I don't understand the relationship
>>>>>>> between keystone-dwc3 and synopsys,dwc3, nor do I want to. I'd prefer
>>>>>>> to see a simple example here.
>>>>>
>>>>>
>>>>>
>>>>>>> dma-ranges is a property of the parent which you show, but
>>>>>>> dma-coherent originally was a property of the bus master itself.
>>>>>>> While
>>>>>>> we need to support that, are we changing that? We need to be clear on
>>>>>>> where the property belongs even if the kernel is more lax.
>>>>>>>
>>>>>> I don't think we are changing it fundamentally but may be I missing
>>>>>> your point. The dma-coherent as is now a per-device property.
>>>>>> USB is one of the bus master supports coherency and hence showed
>>>>>> up in above example.
>>>>>
>>>>>
>>>>> I think it's enough if you just drop the "synopsys,dwc3" node and the
>>>>> intermediate dma-ranges property from the example, leaving the
>>>>> dma-coherent property in the "ti,keystone-dwc3" node.
>>>>>
>>>> Thanks Arnd. That should avoid the confusion. Just to see if Rob is
>>>> fine by it, the example will look like below.
>>>
>>>
>>> Yes. Looks fine.
>>>
>> Great. Updated version 2 below.
>
>
> Seems, this patch has not been merged accidentally :(
> Is it possible for you to take it, or would you like me to re-send it?

Applied. Sorry for the delay.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
