From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] Drivers: USB: DA8xx MUSB: added DT support
Date: Mon, 8 Feb 2016 15:25:00 +0300
Message-ID: <56B8891C.3080409@cogentembedded.com>
References: <1454693676-20211-1-git-send-email-petr@barix.com>
 <56B67351.1030604@cogentembedded.com> <56B85DB6.9030605@barix.com>
 <56B87A07.1060103@cogentembedded.com> <56B88098.1070309@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B88098.1070309-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2/8/2016 2:48 PM, Petr Kulhavy wrote:

>>    And the patch is against 3.17? You should only submit patches against the
>> recent kernel. In this case, against the -next branch of Felipe's repo on
>> kernel.org.
>
> Could you give me the full branch name please.

    See the MAINTAINERS entry for drivers/usb/musb/. The branch is named just 
'next'.

>>> I was wondering about a PHY driver too. However the AM1808 has no standalone
>>> PHY module like e.g. the AM335x does.  The PHY together with the USB core are
>>> integrated into a single block and there is only a little control through the
>>> SYSCFG registers.
>>
>>    The CFGCHIP2 register controls the PHY in practice. The code manipulating
>> it should be moved to a PHY driver.
>>
> I'm not sure if I can do that at the moment. Would you accept the patch using
> the current situation, i.e. the CFGCHIP2 being manipulated in the da8xx.c?

    Felipe accepts MUSB changes, not me. I'll ACK the patch once it's in good 
shape, w/o the PHY driver.

[...]

>>> All the other MUSBs specify these parameters in the DT. Do you want to make an
>>> exception?
>>
>>    I'd prefer doing it that way, sure.

> OK. So I will move the num_eps and ram_bits into the "compatible" structure.
> And leave the mode, power and multipoint still configurable via DT as they
> depend on the hardware wiring.

    As for the mode and power, I agree -- they are part of the board-specific 
platform data (there's also power-on-to-power-good delay BTW which you missed).

> I believe someone still might want to set multipoint to 0 if he has a single
> device (not a hub) hard-connected directly to the controller. Even if I don't
> see a benefit of doing so.

> Why does this parameter exist at all?

    No, multipoint is a part of the 'struct musb_hdrc_config' and IIRC just 
indicates whether the target endpoint control registers are present.

>>>>> @@ -527,6 +561,35 @@ static const struct platform_device_info
>>>>> da8xx_dev_info = {
>>>>>       .dma_mask    = DMA_BIT_MASK(32),
>>>>>   };
>>>>>
>>>>> +static int get_musb_port_mode(struct device_node *np)
>>>>> +{
>>>>> +    enum usb_dr_mode mode;
>>>>> +
>>>>> +    mode = of_usb_get_dr_mode(np);
>>>>> +    switch (mode) {
>>>>> +    case USB_DR_MODE_HOST:
>>>>> +        return MUSB_HOST;
>>>>> +
>>>>> +    case USB_DR_MODE_PERIPHERAL:
>>>>> +        return MUSB_PERIPHERAL;
>>>>> +
>>>>> +    case USB_DR_MODE_OTG:
>>>>> +        return MUSB_OTG;
>>>>> +
>>>>> +    default:
>>>>> +        return MUSB_UNDEFINED;
>>>>> +    }
>>>>> +}
>>>>
>>>>    This is clearly MUSB generic code.
>>>
>>> So what does it mean?
>>
>>    Define this function in musb_core.c.
>>
> I will do. Why doesn't the musb core use directly the USB_DR_MODE_xxx literals
> instead?

    MUSB driver predates these (DT specific?) definitions IIRC...

[...]

> Regards
> Petr

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
