From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH] genirq: fix trigger flags check for shared irqs
Date: Thu, 28 Jan 2016 14:37:24 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1601281355200.3886@nanos>
References: <96c068ece0f5d01fc85bdbd9e0798f68180eebb8.1453204950.git.brian.starkey@arm.com> <alpine.DEB.2.11.1601262142450.3886@nanos> <20160128095955.GA12884@e106950-lin.cambridge.arm.com> <alpine.DEB.2.11.1601281116310.3886@nanos>
 <20160128111041.GB12884@e106950-lin.cambridge.arm.com> <alpine.DEB.2.11.1601281238110.3886@nanos> <20160128122212.GC12884@e106950-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160128122212.GC12884-XkuvqYGHIzfZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 28 Jan 2016, Brian Starkey wrote:

> On Thu, Jan 28, 2016 at 12:49:37PM +0100, Thomas Gleixner wrote:
> > On Thu, 28 Jan 2016, Brian Starkey wrote:
> > > I've got a few devices on the same interrupt line. One driver does
> > 
> > Just for the record: When will hardware folks finally understand that shared
> > interrupt lines are a nightmare?
> > 
> 
> In general, agreed. In this case though I think they get some grace - my
> devices are all in an FPGA which only has one interrupt line to the SoC.

No grace at all. Adding an real irqchip which lets you mask/unmask each device
irq seperately and having a demux handler on the interrupt line to the SoC is
the proper solution for this for lots of reasons.

> > So that commit does:
> > 
> >   r->flags = IORESOURCE_IRQ | irqd_get_trigger_type(irq_get_irq_data(irq));
> > 
> > which reads the current setting of the interrupt line.
> > 
> > Now we pass exactly that to request_irq(). So first irq_of_parse_and_map()
> > configures the interrupt type when mapping it and then hands in the same
> > type
> > information when requesting the irq.
> 
> Right, there's some redundancy here.

Some?

> > I have no idea what the purpose of this is and the changelog of that commit
> > is
> > completely useless, sigh!
> > 
> > I've cc'ed the author and the device tree folks. Perhaps are they able to
> > explain what this commit tries to 'fix'.
> 
> This 'fix' is what makes me hit the problem - but even without it I
> think the problem still exists.
> 
> It seems like in principle two drivers ought to be able to do
> 
> 	request_irq(irq, handler, IRQF_SHARED | IRQF_TRIGGER_HIGH, ...);
> 
> and
> 
> 	request_irq(irq, handler, IRQF_SHARED, ...);
> 
> without the latter call failing. Or do you disagree?

In principle I agree. The issue is that it really depends on the particular
hardware situation.

If there is an explicit requirement for one driver - expressed by a trigger
flag - and the other driver relies on the default configuration, then this
might cause malfunction.

The hassle is, that IRQF_TRIGGER_NONE has unclear semantics. It can mean "I
don't care" or "I rely on the hw configuration". The latter is what worries
me.

first driver: 

      creates the mapping and sets the trigger type according to the DT
      setting.

      driver calls request_irq() with IRQF_TRIGGER_NONE. It relies on the DT
      setting to be correct.

second driver:

      Finds an existing mapping. Now we have two cases:

      1) flat irqdomains:

      	 The DT setting is applied to the trigger type unconditionally.

	 So if that setting is contrary to first drivers DT setting then we
	 are already in trouble.

	 If the driver uses IRQF_TRIGGER_NONE, bad luck as nothing will notice
	 the issue.

      2) hierarchical irqdomains

      	 That code path ignores the type setting of the second driver and
      	 leaves the irq line in the existing state.

	 If the driver uses IRQF_TRIGGER_NONE, bad luck as nothing will notice
	 the issue.
      	 
So we have two problems here.

1) We should detect the mismatch already in the mapping function.

   But, that's hard for legacy reasons. Interrupts can be mapped at early boot
   with hardware default settings and we currently have no way to distinguish
   that. It shouldn't be hard to fix that.

2) How to deal with the mismatch in request_irq()

   Relaxing the check is not really a good decision. So what we could do is:

   if ((new_action->flags & IRQF_TRIGGER_MASK) == IRQF_TRIGGER_NONE)
      	new_action->flags |= irqd_get_trigger_type(irqdata);

   Now that has an issue as well. If the driver requests with
   IRQF_TRIGGER_NONE and does an explicit type setting afterwards, the
   action->flags still do not reflect it.

The whole trigger handling versus shared interrupts needs some deep thoughts
and I really want to understand what that of commit 4a43d686fe336 before
making any decisions.

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
