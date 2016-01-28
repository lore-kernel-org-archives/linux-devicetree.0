From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] genirq: fix trigger flags check for shared irqs
Date: Thu, 28 Jan 2016 12:49:37 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1601281238110.3886@nanos>
References: <96c068ece0f5d01fc85bdbd9e0798f68180eebb8.1453204950.git.brian.starkey@arm.com> <alpine.DEB.2.11.1601262142450.3886@nanos> <20160128095955.GA12884@e106950-lin.cambridge.arm.com> <alpine.DEB.2.11.1601281116310.3886@nanos>
 <20160128111041.GB12884@e106950-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160128111041.GB12884@e106950-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Starkey <brian.starkey@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 28 Jan 2016, Brian Starkey wrote:
> I've got a few devices on the same interrupt line. One driver does

Just for the record: When will hardware folks finally understand that shared
interrupt lines are a nightmare?

> something along these lines:
> 
> 	res = platform_get_resource(dev, IORESOURCE_IRQ, 0);
> 	flags = (res->flags & IRQF_TRIGGER_MASK) | IRQF_SHARED;
> 	request_irq(res->start, handler, flags, "name", dev);
> 
> This seems pretty reasonable. The problem is since 4a43d686fe33:
>    of/irq: Pass trigger type in IRQ resource flags[1]
> the trigger type information from device-tree is in res->flags.
> 
> So when the other drivers don't pass in any flags, they fail the check
> in __setup_irq().
> 
> Changing the former driver to remove the flags doesn't seem right, and
> adding flags to the latter would imply adding flags to _every_ driver,
> which is an awful lot to change - and I'm not sure it would be possible
> and/or effective in all cases.

So that commit does:

   r->flags = IORESOURCE_IRQ | irqd_get_trigger_type(irq_get_irq_data(irq));

which reads the current setting of the interrupt line.

Now we pass exactly that to request_irq(). So first irq_of_parse_and_map()
configures the interrupt type when mapping it and then hands in the same type
information when requesting the irq.

I have no idea what the purpose of this is and the changelog of that commit is
completely useless, sigh!

I've cc'ed the author and the device tree folks. Perhaps are they able to
explain what this commit tries to 'fix'.

Thanks,

	tglx
