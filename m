From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 06/27] irq_domain/powerpc: eliminate irq_map; use
 irq_alloc_desc() instead
Date: Fri, 6 Apr 2012 13:12:52 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1204061312210.2542@ionos>
References: <1329383368-12122-1-git-send-email-grant.likely@secretlab.ca> <1329383368-12122-7-git-send-email-grant.likely@secretlab.ca> <m2iphj3zxr.fsf@igel.home> <m2hax2qeqs.fsf@igel.home> <20120402202848.1EB833E02A7@localhost> <m2y5qdow0v.fsf@igel.home>
 <20120404154020.40C513E09D5@localhost> <m21uo2v4cw.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <m21uo2v4cw.fsf@igel.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Milton Miller <miltonm@bga.com>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Thu, 5 Apr 2012, Andreas Schwab wrote:
> Grant Likely <grant.likely@secretlab.ca> writes:
> 
> > I bet it is NR_IRQS related.  You have SPARSE_IRQ enabled, which means
> > the maximum number of irq_descs is IRQ_BITMAP_BITS (NR_IRQS + 8192).
> 
> The actual definition uses NR_IRQS + 8196.  Guess that's a typo.  (Does
> it really make sense to add NR_IRQS here?)
> 
> > diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
> > index cf417e51..9edf499 100644
> > --- a/arch/powerpc/include/asm/irq.h
> > +++ b/arch/powerpc/include/asm/irq.h
> > @@ -20,7 +20,7 @@
> >  
> >  /* Define a way to iterate across irqs. */
> >  #define for_each_irq(i) \
> > -       for ((i) = 0; (i) < NR_IRQS; ++(i))
> > +       for ((i) = 0; (i) < nr_irqs; ++(i))
> 
> There are exactly two uses of for_each_irq, one is related to cpu
> hotplug, the other to kexec, so that cannot make any difference.

Though that wants to be fixed nevertheless.

Thanks,

	tglx
