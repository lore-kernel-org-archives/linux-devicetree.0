From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: Add binding documentation for
 gpio-thunderx
Date: Mon, 9 Jan 2017 11:44:22 -0800
Message-ID: <a1b6c9da-5b19-c9a7-3774-0bc0e9dcdeb6@caviumnetworks.com>
References: <1483744980-25898-1-git-send-email-ddaney.cavm@gmail.com>
 <1483744980-25898-2-git-send-email-ddaney.cavm@gmail.com>
 <CACRpkdZ0xkhUC7_0A4uHxpGaU7BHgNp8TNuDPuPN9h6dDsQx4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZ0xkhUC7_0A4uHxpGaU7BHgNp8TNuDPuPN9h6dDsQx4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/09/2017 11:36 AM, Linus Walleij wrote:
> On Sat, Jan 7, 2017 at 12:22 AM, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>
>> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> (...)
>
>> +Optional Properties:
>> +- compatible: "cavium,thunder-8890-gpio", unused as PCI driver binding is used.
>> +- interrupt-controller: Marks the device node as an interrupt controller.
>> +- #interrupt-cells: Must be present and have value of 2 if
>> +                    "interrupt-controller" is present.
>> +  - First cell is the GPIO pin number relative to the controller.
>> +  - Second cell is triggering flags as defined in interrupts.txt.
>
> AFAICT this device has an optional list of interrupts as well?
> One per pin even?

I'm not sure I understand your question.

The GPIO hardware supports an interrupt on each pin.  The underlying 
interrupt mechanism is via PCI MSI-X, which are fully discoverable by 
the driver, so lack of device tree binding for the these underlying 
MSI-X is fully appropriate.  On the other hand, users of the GPIO 
interrupt pins need this "interrupt-controller" and "#interrupt-cells" 
to be able to properly find and configure the proper interrupts.

I said the "interrupt-controller" property was optional, because some 
systems don't use GPIO interrupts and can function without specifying 
that it is also an interrupt controller.


>
> Yours,
> Linus Walleij
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
