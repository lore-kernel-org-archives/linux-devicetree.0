From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: xhci: add relaxed timing quirk bit
Date: Tue, 21 Nov 2017 14:06:13 -0600
Message-ID: <CAL_JsqLZgnTTEiLXD8ZOK-0qd58i16e7h_-2yjHN+zRFfqvH4Q@mail.gmail.com>
References: <1511284690-3878-1-git-send-email-awallis@codeaurora.org>
 <1511284690-3878-2-git-send-email-awallis@codeaurora.org> <20171121191103.5oczqvrlo4gtwjqc@rob-hp-laptop>
 <f200ce55-ac67-02f9-4dbf-7a3ba5b52b39@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f200ce55-ac67-02f9-4dbf-7a3ba5b52b39-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adam Wallis <awallis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 21, 2017 at 1:49 PM, Adam Wallis <awallis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 11/21/2017 2:11 PM, Rob Herring wrote:
>> On Tue, Nov 21, 2017 at 12:18:09PM -0500, Adam Wallis wrote:
>>> Certain systems may run with CPUs at a very slow frequency. This
>>> patch adds a quirk bit that can be used to relax certain timings, etc.
>>>
>>> This quirk might be needed for other fields in the future, but
>>> initially, it will be used only on the IRQ control register to allow
>>> firmare to control the value of the register. This can prevent an
>>
>> s/firmare/firmware/
>>
>
> Thanks, good catch.
>
>> By firmware control, you mean the register is initialized on boot and
>> then not touched by the kernel? What if the XHCI block is reset? Not
>> sure if that's possible.
>>
>>> "interrupt storm" effect on certain systems.
>>
>> So now we have 2 ways to deal with this? The existing MediaTek quirk and
>> now this one.
>
> I do agree that 2 different ways to deal with it is not ideal. I also think that
> having one hard-coded value (and one alternate for MTK) is also not ideal.

Agreed.

>>
>> I think you should change the existing quirk to a value and set the
>> value based on compatible strings.
>
> I like where you are going with this. Are you saying that I could read for a
> device property read from firmware (for DTB or ACPI) like DWC3 does for
> "snps,hird-threshold"?

Is that for the same thing? If so, drop the vendor prefix and use
that. Otherwise, a separate property should really be something that
is per board rather than per SoC.

> If you mean this, where do you recommend I store the
> desired IRQ_CONTROL value - in struct xhci_hcd ?

No idea.

> Or by "compatible" strings, did you mean storing hard-coded values in the
> of_device_id usb_xhci_of_match[] array? This would still be hard-coding (which I
> would like to avoid) and also would not work for the ACPI case.

ACPI has match tables too?

It would only be hardcoded per compatible which should be per SoC. Do
you need per board/device tuning? If so, use a property.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
