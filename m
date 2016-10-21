From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/8] drm: bridge: vga-dac: Add adi,adv7123 compatible
 string
Date: Fri, 21 Oct 2016 16:13:23 +0530
Message-ID: <99996136-cb5b-d39a-2dc1-9ee06762cae3@codeaurora.org>
References: <1476887143-24831-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1476887143-24831-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <2e22947f-1c8c-710a-cb60-bd6b52f219eb@codeaurora.org>
 <295438587.dQSmbaFSXR@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <295438587.dQSmbaFSXR@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 10/21/2016 03:52 PM, Laurent Pinchart wrote:
> Hi Archit,
>
> On Friday 21 Oct 2016 10:43:34 Archit Taneja wrote:
>> On 10/19/2016 07:55 PM, Laurent Pinchart wrote:
>>> The ADV7123 is a transparent VGA DAC. Unlike dumb VGA DACs it can be
>>> controlled through a power save pin, and requires a power supply.
>>> However, on most boards where the device is used neither the power save
>>> signal nor the power supply are controllable.
>>>
>>> To avoid developing a separate device-specific driver add an
>>> "adi,adv7123" compatible entry to the dumb-vga-dac driver. This will
>>> allow supporting most ADV7123-based boards easily, while allowing future
>>> development of an adv7123 driver when needed without breaking backward
>>> compatibility.
>>
>> Shouldn't we have a DT binding doc for ADV7123, even if it's sharing
>> the dumb vga driver for now?
>
> Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
>
>> Same query for the Thine LVDS encoder.
>
> Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt

Cool, didn't know these already existed :)

Thanks,
Archit

>
>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Signed-off-by: Laurent Pinchart
>>> <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>>> ---
>>>
>>>  drivers/gpu/drm/bridge/dumb-vga-dac.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c
>>> b/drivers/gpu/drm/bridge/dumb-vga-dac.c index afec232185a7..b33e3f829e4f
>>> 100644
>>> --- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
>>> +++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
>>> @@ -204,6 +204,7 @@ static int dumb_vga_remove(struct platform_device
>>> *pdev)>
>>>  static const struct of_device_id dumb_vga_match[] = {
>>>
>>>  	{ .compatible = "dumb-vga-dac" },
>>> +	{ .compatible = "adi,adv7123" },
>>>  	{},
>>>  };
>>>  MODULE_DEVICE_TABLE(of, dumb_vga_match);
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
