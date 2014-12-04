From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 03/12] irqchip: gic: define register_routable_domain_ops
 conditional
Date: Thu, 4 Dec 2014 01:03:10 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1412040057090.16275@nanos>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch> <1417565531-4507-4-git-send-email-stefan@agner.ch> <5174649.NxPq80uDz8@wuerfel> <alpine.DEB.2.11.1412031303000.16275@nanos> <8eccedc781df2636a132dae449cbe774@agner.ch>
 <547F5EBD.6040705@arm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547F5EBD.6040705-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sricharan R <r.sricharan-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 3 Dec 2014, Marc Zyngier wrote:
> On 03/12/14 17:28, Stefan Agner wrote:
> > On 2014-12-03 14:04, Thomas Gleixner wrote:
> >> The shared interrupts are allocated through the router domain which
> >> decides whether the interrupt can be assigned to a particular core or
> >> not. If it can be assigned it allocates the corresponding interrupt in
> >> the parent domain, sets up the routing and everything just works.
> > 
> > What do you mean by the shared state in the drawing above? Currently, I
> > check whether a interrupt is already used by the other core by reading
> > the register (do this configuration register reflect the "shared state"
> > in your drawing?).
> 
> I think that is basically it. It should only be the register that
> decides on the actual routing. BTW, how do you arbitrate between
> concurrent accesses to this register? Or is only the A5 allowed to
> change it?

What I meant with 'shared state' is basically the configuration
register space. Plus depending on the mechanism you want to use for
correlating the routing between the A5 and the M4 some shared memory
state, locking, IPC or whatever you need for this.
 
> >> http://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/log/?h=irq/irqdomain-arm
> >>
> > 
> > Thanks for the link. So my work would involve to support domain
> > hierarchy for NVIC (proper irq_domain_ops, introduce arm,routable-irqs
> > property, anything else?) and then make use of the hierarchy code in my
> > MSCM driver like for instance the mtk-sysirq driver...?
> 
> I don't think we need the arm,routable-irq property at all, and I'm
> looking at refactoring the crossbar thingy to remove most of its
> entanglement with the GIC.
> 
> All you need to know is the range of interrupts you're allowed to
> request through the "routable" domain. The inner-most irqchip shouldn't
> even know about it (after all, they are just wires coming in). It should
> be the duty of the outer-most irqchip (the "router") to generate the
> correct request to the GIC/NVIC. So all the knowledge should be at the
> router level.
> 
> The mtk-sysrq code is indeed a good example of what you can do.

The gic-v2m MSI stuff is probably helpful as well.
 
> > What is the state of the IRQ domain hierarchy, when will it go upstream?
> 
> Scheduled for 3.19, if everything goes according to plan. Don't think we
> can go back anyway... ;-)

Indeed. That would be a major headache...

Thanks,

	tglx

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
