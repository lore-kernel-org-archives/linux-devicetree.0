From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH V2 05/15] genirq: Generic chip: Add big endian I/O
 accessors
Date: Thu, 30 Oct 2014 13:30:04 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1410301233500.5308@nanos>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com> <1414635488-14137-6-git-send-email-cernekee@gmail.com> <14243833.KJsSScVrGS@wuerfel>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <14243833.KJsSScVrGS@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kevin Cernekee <cernekee@gmail.com>, f.fainelli@gmail.com, jason@lakedaemon.net, ralf@linux-mips.org, lethal@linux-sh.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 Oct 2014, Arnd Bergmann wrote:
> On Wednesday 29 October 2014 19:17:58 Kevin Cernekee wrote:
> >  static LIST_HEAD(gc_list);
> >  static DEFINE_RAW_SPINLOCK(gc_lock);
> >  
> > +static int is_big_endian(struct irq_chip_generic *gc)
> > +{
> > +       return !!(gc->domain->gc->gc_flags & IRQ_GC_BE_IO);
> > +}
> > +
> >  static void irq_reg_writel(struct irq_chip_generic *gc,
> >                            u32 val, int reg_offset)
> >  {
> > -       writel(val, gc->reg_base + reg_offset);
> > +       if (is_big_endian(gc))
> > +               iowrite32be(val, gc->reg_base + reg_offset);
> > +       else
> > +               writel(val, gc->reg_base + reg_offset);
> >  }
> >  
> 
> What I had in mind was to use indirect function calls instead, like
> 
> #ifndef irq_reg_writel
> static inline void irq_reg_writel_le(u32 val, void __iomem *addr)
> {
> 	return writel(val, addr);
> }
> #endif
> 
> #ifndef irq_reg_writel_be
> static inline void irq_reg_writel_be(u32 val, void __iomem *addr)
> {
> 	return iowrite32_be(val, addr);
> }
> #endif
> 
> 
> static inline void irq_reg_writel(struct irq_chip_generic *gc, u32 val, int reg_offset)
> {
>        if (IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP) &&

That's inside of the generic irq chip, so CONFIG_GENERIC_IRQ_CHIP is
always set when this is compiled.

>            !IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP_BE))
> 		return irq_reg_writel_le(val, gc->reg_base + reg_offset);
> 
>        if (IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP) &&
>            !IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP_BE))

	     s/!// ?

> 		return irq_reg_writel_be(val, gc->reg_base + reg_offset);

I don't think the above will cover all combinations.

..._CHIP_BE	...CHIP_LE
N		N			; Default behaviour: readl/writel
Y		N			; ioread/write32be
N		Y			; Default behaviour: readl/writel
Y		Y			; Runtime selected

> 	return gc->writel(val, gc->reg_base + reg_offset);
> }
> 
> This would take the condition out of the callers.

So you trade a conditional for an indirect call. Not sure what's more
expensive. The indirect call is definitely a smaller text footprint,
so we should opt for this.

Thanks,

	tglx
