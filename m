From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v4 2/5] irqchip: add virtual demultiplexer
 implementation
Date: Tue, 10 Feb 2015 16:20:17 +0100
Message-ID: <20150210162017.0882cb77@bbrezillon>
References: <1422527620-8308-1-git-send-email-boris.brezillon@free-electrons.com>
	<1422527620-8308-3-git-send-email-boris.brezillon@free-electrons.com>
	<20150210150013.GD7119@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150210150013.GD7119@twins.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Peter,

On Tue, 10 Feb 2015 16:00:13 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Thu, Jan 29, 2015 at 11:33:37AM +0100, Boris Brezillon wrote:
> > +#ifdef CONFIG_VIRT_IRQ_DEMUX_CHIP
> > +/**
> > + * struct irq_chip_virt_demux - Dumb demultiplexer irq chip data structure
> 
> s/Dumb/Virtual/ ?
> 
> > + * @domain:		irq domain pointer
> > + * @available:		Bitfield of valid irqs
> > + * @unmasked:		Bitfield containing irqs status
> > + * @flags:		irq_virt_demux_flags flags
> > + * @src_irq:		irq feeding the virt demux chip
> > + *
> > + * Note, that irq_chip_generic can have multiple irq_chip_type
> > + * implementations which can be associated to a particular irq line of
> > + * an irq_chip_generic instance. That allows to share and protect
> > + * state in an irq_chip_generic instance when we need to implement
> > + * different flow mechanisms (level/edge) for it.
> 
> This seems like a copy/paste from struct irq_chip_generic; it seems not
> relevant, seeing how irq_chip_virt_demux does not even have an
> irq_chip_type pointer list.
> 
> Also, with a demuxer like this, we're bound to whatever flow type its
> host is, no?

Absolutely, I'll fix the comment by removing those lines.

> 
> > +# Dumb interrupt demuxer chip implementation
> 
> s/Dumb/Virtual/ ?

Yep, I'll fix that one too.

> 
> > +#ifdef CONFIG_VIRT_IRQ_DEMUX_CHIP
> > +/**
> > + *	handle_virt_demux_irq - Dumb demuxer irq handle function.
> 
> idem
> 
> > + *	@irq:	the interrupt number
> > + *	@desc:	the interrupt description structure for this irq
> > + *
> > + *	Dumb demux interrupts are sent from a demultiplexing interrupt handler
> 
> idem
> 
> > + *	which is not able to decide which child interrupt handler should be
> > + *	called.
> > + *
> > + *	Note: The caller is expected to handle the ack, clear, mask and
> > + *	unmask issues if necessary.
> > + */
> 
> If we're calling multiple handlers, how can they all do this and not
> collide?

It's the same problem as you noted above: a copy/paste that should have
been reworded.
I'll remove those lines too.

> 
> Over all it looks good -- in as far as my (admittedly stale IRQ
> braincells) go.
> 
> I'll go queue up these bits, if you could send me a delta patch
> addressing these 'minor' comment issues?

Thanks, I'll send you a patch addressing your comments (it would be
great if you could squash it with this patch).

Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
