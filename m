From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 05/15] genirq: Generic chip: Add big endian I/O accessors
Date: Thu, 30 Oct 2014 13:40:03 +0100
Message-ID: <2056740.mEUKBXLZZT@wuerfel>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com> <14243833.KJsSScVrGS@wuerfel> <alpine.DEB.2.11.1410301233500.5308@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1410301233500.5308@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 30 October 2014 13:30:04 Thomas Gleixner wrote:
> On Thu, 30 Oct 2014, Arnd Bergmann wrote:
> > On Wednesday 29 October 2014 19:17:58 Kevin Cernekee wrote:
> > >  static LIST_HEAD(gc_list);
> > >  static DEFINE_RAW_SPINLOCK(gc_lock);
> > >  
> > > +static int is_big_endian(struct irq_chip_generic *gc)
> > > +{
> > > +       return !!(gc->domain->gc->gc_flags & IRQ_GC_BE_IO);
> > > +}
> > > +
> > >  static void irq_reg_writel(struct irq_chip_generic *gc,
> > >                            u32 val, int reg_offset)
> > >  {
> > > -       writel(val, gc->reg_base + reg_offset);
> > > +       if (is_big_endian(gc))
> > > +               iowrite32be(val, gc->reg_base + reg_offset);
> > > +       else
> > > +               writel(val, gc->reg_base + reg_offset);
> > >  }
> > >  
> > 
> > What I had in mind was to use indirect function calls instead, like
> > 
> > #ifndef irq_reg_writel
> > static inline void irq_reg_writel_le(u32 val, void __iomem *addr)
> > {
> > 	return writel(val, addr);
> > }
> > #endif
> > 
> > #ifndef irq_reg_writel_be
> > static inline void irq_reg_writel_be(u32 val, void __iomem *addr)
> > {
> > 	return iowrite32_be(val, addr);
> > }
> > #endif
> > 
> > 
> > static inline void irq_reg_writel(struct irq_chip_generic *gc, u32 val, int reg_offset)
> > {
> >        if (IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP) &&
> 
> That's inside of the generic irq chip, so CONFIG_GENERIC_IRQ_CHIP is
> always set when this is compiled.

The part that I mentioned in the other mail and omitted here is that
I'd then build the kernel/irq/generic-chip.c file when one or both of
CONFIG_GENERIC_IRQ_CHIP or CONFIG_GENERIC_IRQ_CHIP_BE is set.

The alternative would be to introduce CONFIG_GENERIC_IRQ_CHIP_LE along
with CONFIG_GENERIC_IRQ_CHIP_BE, which might be cleaner, but requires
all existing 39 'select GENERIC_IRQ_CHIP' statements to be changed to
'GENERIC_IRQ_CHIP_LE'.

Either way would work.

> >            !IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP_BE))
> > 		return irq_reg_writel_le(val, gc->reg_base + reg_offset);
> > 
> >        if (IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP) &&
> >            !IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP_BE))
> 
> 	     s/!// ?

typo: I put the ! in the wrong line, sorry.

> > 		return irq_reg_writel_be(val, gc->reg_base + reg_offset);
> 
> I don't think the above will cover all combinations.
> 
> ..._CHIP_BE	...CHIP_LE
> N		N			; Default behaviour: readl/writel

that would not be allowed with my approach. It should probably cause
a compile-error if we introduce all three symbols.

> Y		N			; ioread/write32be
> N		Y			; Default behaviour: readl/writel
> Y		Y			; Runtime selected



> > 	return gc->writel(val, gc->reg_base + reg_offset);
> > }
> > 
> > This would take the condition out of the callers.
> 
> So you trade a conditional for an indirect call. Not sure what's more
> expensive. The indirect call is definitely a smaller text footprint,
> so we should opt for this.

It depends on the register pressure in the caller and on the pipeline
of the CPU. My guess was that indirect call is generally more efficient,
but you are right that this is not obvious, and I have no reliable data
to back up my guess.

If we do the conditional, we could also just add an extra byte swap,
instead of choosing between two function calls.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
