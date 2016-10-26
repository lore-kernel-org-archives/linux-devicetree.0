From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 1/5] ARM: davinci: da8xx: add usb phy clocks
Date: Wed, 26 Oct 2016 22:43:04 +0530
Message-ID: <2100252f-0165-96e7-2403-20e1f2d6e4e9@ti.com>
References: <1477451211-31979-1-git-send-email-david@lechnology.com>
 <1477451211-31979-2-git-send-email-david@lechnology.com>
 <6bcc1ac1-446c-6191-1c63-e37ccfaf9556@ti.com>
 <0302c410-4b05-3a5b-3801-5ab73089a9e2@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0302c410-4b05-3a5b-3801-5ab73089a9e2-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 26 October 2016 10:07 PM, David Lechner wrote:
> On 10/26/2016 02:59 AM, Sekhar Nori wrote:
>> On Wednesday 26 October 2016 08:36 AM, David Lechner wrote:
>>> Up to this point, the USB phy clock configuration was handled
>>> manually in
>>> the board files and in the usb drivers. This adds proper clocks so that
>>> the usb drivers can use clk_get and clk_enable and not have to worry
>>> about
>>> the details. Also, the related code is removed from the board files and
>>> replaced with the new clock registration functions.
>>>
>>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>>> Signed-off-by: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>> ---
>>>
>>> I have added "ARM: davinci: da8xx: Enable the usb20 "per" clk on
>>> phy_clk_enable"
>>> from Axel Haslam to this patch.
>>>
>>> In the review of Axel's patch, Sekhar said:
>>>
>>>> We should not be using a NULL device pointer here. Can you pass the
>>>> musb
>>>> device pointer available in the same file? Also, da850_clks[] in
>>>> da850.c
>>>> needs to be fixed to add the matching device name.
>>>
>>> However, the musb device may not be registered. The usb20_clk can be
>>> used to
>>> supply a 48MHz clock to USB 1.1 (ohci) without using the musb device.
>>> So, I am
>>> inclined to leave this as NULL.
>>
>> But clock look-up has nothing to do with device being registered AFAICT.
>> It is used to identify the clock consumer. Passing NULL there means the
>> clock is not associated with any device. Which is not correct as we are
>> specifically looking at MUSB module clock.
>>
>> Thanks,
>> Sekhar
>>
> 
> FWIW, clk_get() uses dev_name() to get the device name, which will
> return NULL until after the platform device is registered.

I believe you can set init_name in the device to setup an initial name
until registration.

> 
> I can add the device references anyway. However, this is complicated by
> the fact that the musb platform device declaration is inside of an #if
> IS_ENABLED(CONFIG_USB_MUSB_HDRC). I can either remove the #if or add
> more #if's. Do you have a preference on this?

Please remove the #if's. Usually device registration is never done
conditionally based on whether the driver is built or not. So this seems
incorrect anyway.

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
