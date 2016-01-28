From: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] genirq: fix trigger flags check for shared irqs
Date: Thu, 28 Jan 2016 12:22:13 +0000
Message-ID: <20160128122212.GC12884@e106950-lin.cambridge.arm.com>
References: <96c068ece0f5d01fc85bdbd9e0798f68180eebb8.1453204950.git.brian.starkey@arm.com>
 <alpine.DEB.2.11.1601262142450.3886@nanos>
 <20160128095955.GA12884@e106950-lin.cambridge.arm.com>
 <alpine.DEB.2.11.1601281116310.3886@nanos>
 <20160128111041.GB12884@e106950-lin.cambridge.arm.com>
 <alpine.DEB.2.11.1601281238110.3886@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1601281238110.3886@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 28, 2016 at 12:49:37PM +0100, Thomas Gleixner wrote:
>On Thu, 28 Jan 2016, Brian Starkey wrote:
>> I've got a few devices on the same interrupt line. One driver does
>
>Just for the record: When will hardware folks finally understand that shared
>interrupt lines are a nightmare?
>

In general, agreed. In this case though I think they get some grace - my
devices are all in an FPGA which only has one interrupt line to the SoC.

>> something along these lines:
>>
>> 	res = platform_get_resource(dev, IORESOURCE_IRQ, 0);
>> 	flags = (res->flags & IRQF_TRIGGER_MASK) | IRQF_SHARED;
>> 	request_irq(res->start, handler, flags, "name", dev);
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
>So that commit does:
>
>   r->flags = IORESOURCE_IRQ | irqd_get_trigger_type(irq_get_irq_data(irq));
>
>which reads the current setting of the interrupt line.
>
>Now we pass exactly that to request_irq(). So first irq_of_parse_and_map()
>configures the interrupt type when mapping it and then hands in the same type
>information when requesting the irq.

Right, there's some redundancy here.

>
>I have no idea what the purpose of this is and the changelog of that commit is
>completely useless, sigh!
>
>I've cc'ed the author and the device tree folks. Perhaps are they able to
>explain what this commit tries to 'fix'.

This 'fix' is what makes me hit the problem - but even without it I
think the problem still exists.

It seems like in principle two drivers ought to be able to do

	request_irq(irq, handler, IRQF_SHARED | IRQF_TRIGGER_HIGH, ...);

and

	request_irq(irq, handler, IRQF_SHARED, ...);

without the latter call failing. Or do you disagree?

-Brian

>
>Thanks,
>
>	tglx
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
