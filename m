From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] genirq: fix trigger flags check for shared irqs
Date: Thu, 28 Jan 2016 09:58:08 -0600
Message-ID: <CAL_JsqLTFu18a-Mj_XPZBpcFkD+R-uiK70yLnCT27np2YK6_ag@mail.gmail.com>
References: <96c068ece0f5d01fc85bdbd9e0798f68180eebb8.1453204950.git.brian.starkey@arm.com>
 <alpine.DEB.2.11.1601262142450.3886@nanos> <20160128095955.GA12884@e106950-lin.cambridge.arm.com>
 <alpine.DEB.2.11.1601281116310.3886@nanos> <20160128111041.GB12884@e106950-lin.cambridge.arm.com>
 <alpine.DEB.2.11.1601281238110.3886@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1601281238110.3886@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 28, 2016 at 5:49 AM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> On Thu, 28 Jan 2016, Brian Starkey wrote:
>> I've got a few devices on the same interrupt line. One driver does
>
> Just for the record: When will hardware folks finally understand that shared
> interrupt lines are a nightmare?
>
>> something along these lines:
>>
>>       res = platform_get_resource(dev, IORESOURCE_IRQ, 0);
>>       flags = (res->flags & IRQF_TRIGGER_MASK) | IRQF_SHARED;
>>       request_irq(res->start, handler, flags, "name", dev);
>>
>> This seems pretty reasonable. The problem is since 4a43d686fe33:
>>    of/irq: Pass trigger type in IRQ resource flags[1]
>> the trigger type information from device-tree is in res->flags.
>>
>> So when the other drivers don't pass in any flags, they fail the check
>> in __setup_irq().
>>
>> Changing the former driver to remove the flags doesn't seem right, and
>> adding flags to the latter would imply adding flags to _every_ driver,
>> which is an awful lot to change - and I'm not sure it would be possible
>> and/or effective in all cases.
>
> So that commit does:
>
>    r->flags = IORESOURCE_IRQ | irqd_get_trigger_type(irq_get_irq_data(irq));
>
> which reads the current setting of the interrupt line.
>
> Now we pass exactly that to request_irq(). So first irq_of_parse_and_map()
> configures the interrupt type when mapping it and then hands in the same type
> information when requesting the irq.
>
> I have no idea what the purpose of this is and the changelog of that commit is
> completely useless, sigh!
>
> I've cc'ed the author and the device tree folks. Perhaps are they able to
> explain what this commit tries to 'fix'.

It's certainly not clear what driver was being fixed. I think the
intention was to provide the trigger flags from the DT to drivers in a
standard, non-DT specific way. The implementation of it certainly
seems convoluted. The usecase I can think of is drivers may need the
trigger information for cases where the device can support different
trigger modes/polarity. The DT says which trigger mode to use and the
device and irqchip need to be programmed to match. IIRC, SMSC ethernet
chips frequently used on ARM boards do this.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
