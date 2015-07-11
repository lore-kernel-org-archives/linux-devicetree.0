From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 4/4] irqchip: Add bcm2836 interrupt controller for
 Raspberry Pi 2.
Date: Sat, 11 Jul 2015 09:51:08 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1507110940420.17353@nanos>
References: <1436303617-17185-1-git-send-email-eric@anholt.net> <1436303617-17185-5-git-send-email-eric@anholt.net> <55A0A5EB.4090007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55A0A5EB.4090007-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrea Merello <andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 10 Jul 2015, Stephen Warren wrote:
> On 07/07/2015 03:13 PM, Eric Anholt wrote:
> > +static struct arm_local_intc intc  __read_mostly;
> 
> It'd be nice to give everything (types, functions, variables) a
> consistent symbol prefix; bcm2836_arm_irqchip_ sounds like a good
> bikeshed to me, but perhaps just propagating the above arm_local_ to the
> functions too would be good, although that seems to risk symbol name
> collisions with other ARM SoCs.

Which is irrelevant because its static.

> > +static void bcm2836_mask_per_cpu_irq(unsigned int reg, unsigned int bit)
> > +{
> > +	void __iomem *reg_base = intc.base + reg;
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < 4; i++)
> 
> Is "4" there the CPU count? Perhaps this should use one of the Linux
> APIs to query the CPU count rather than hard-coding it?
> 
> Should per-CPU IRQs automatically be masked on all CPUs at once, or only
> on the current CPU? A very quick look at the ARM GIC driver implies it
> doesn't iterate over all CPUs when masking per-CPU IRQs.

Usually per cpu interrupts are only masked on the cpu which is calling
the function. The whole reason why per cpu interrupts exist is that
you can share the same interrupt number for all cores.

So masking all interrupts is not a good idea. In this case if a cpu is
hot unplugged, then all other cpus would not longer get timer
interrupts. Not what you really want, right?
 
> > +static void bcm2836_mask_gpu_irq(struct irq_data *d)
> > +{
> > +}
> > +
> > +static void bcm2836_unmask_gpu_irq(struct irq_data *d)
> > +{
> > +}
> 
> If the IRQs can't be masked, should these functions actually be implemented?

We have a few places in the core which expect at least mask/unmask to
be implemented.
 
Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
