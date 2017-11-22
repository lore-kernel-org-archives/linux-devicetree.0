From: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: xhci: add relaxed timing quirk bit
Date: Wed, 22 Nov 2017 17:24:45 +0200
Message-ID: <ee0ca959-1812-a4e4-346f-d57a1fdade13@linux.intel.com>
References: <1511284690-3878-1-git-send-email-awallis@codeaurora.org>
 <1511284690-3878-2-git-send-email-awallis@codeaurora.org>
 <20171121191103.5oczqvrlo4gtwjqc@rob-hp-laptop>
 <f200ce55-ac67-02f9-4dbf-7a3ba5b52b39@codeaurora.org>
 <CAL_JsqLZgnTTEiLXD8ZOK-0qd58i16e7h_-2yjHN+zRFfqvH4Q@mail.gmail.com>
 <32f8dc7e-9fde-5e45-1570-a9ec372579fa@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <32f8dc7e-9fde-5e45-1570-a9ec372579fa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adam Wallis <awallis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 22.11.2017 02:07, Adam Wallis wrote:
> On 11/21/2017 3:06 PM, Rob Herring wrote:
> 
> [..]
> 
>>> I like where you are going with this. Are you saying that I could read for a
>>> device property read from firmware (for DTB or ACPI) like DWC3 does for
>>> "snps,hird-threshold"?
>>
>> Is that for the same thing? If so, drop the vendor prefix and use
>> that. Otherwise, a separate property should really be something that
>> is per board rather than per SoC.
> 
> I don't think that's exactly the same property, but it's the same idea I would
> prefer to go with. That way, an integer can be passed in via the firmware tables.
> 
>>
>>> If you mean this, where do you recommend I store the
>>> desired IRQ_CONTROL value - in struct xhci_hcd ?
>>
>> No idea.
>>
>>> Or by "compatible" strings, did you mean storing hard-coded values in the
>>> of_device_id usb_xhci_of_match[] array? This would still be hard-coding (which I
>>> would like to avoid) and also would not work for the ACPI case.
>>
>> ACPI has match tables too?
>>
> 
> Yes, you can use DSD in a way that is similar to OF properties
> 
>> It would only be hardcoded per compatible which should be per SoC. Do
>> you need per board/device tuning? If so, use a property.
>>
> 
> The reason why I think it should dynamic via firmware tables is that
> 
> * It's much less invasive for vendors to update their DT tables if they need to
> adjust on a per device/controller/family/etc basis then to adjust a properties
> table in xhci-plat
> * This would lead to less polluting in xhci-plat code
> 
>> Rob
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> I will provide an updated proposed patch sometime this week. I also hope to get
> some feedback from Mathias to see what he prefers.

We know have at least two hosts/platforms that need custom interrupt moderation values

How about adding a u32 device property for xhci with the interrupt moderation interval in
nanoseconds?  And also add a u32 imod_interval variable to struct xhci_hcd?
  
imod_interval can be set to the current default 40000ns (160*250ns) and overwritten if
device_property_read_u32() returns something else.

XHCI_MTK_HOST could then use whatever preferred device propery interval value,
and we can get rid of using XHCI_MTK_HOST quirk flag when setting up the IMODI
  
-Mathias


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
