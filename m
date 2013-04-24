From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 3/8] irq-imgpdc: add ImgTec PDC irqchip driver
Date: Wed, 24 Apr 2013 11:32:30 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1304241128320.21884@ionos>
References: <1366727607-27444-1-git-send-email-james.hogan@imgtec.com> <1366727607-27444-4-git-send-email-james.hogan@imgtec.com> <alpine.LFD.2.02.1304231647400.21884@ionos> <5177A262.1000004@imgtec.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5177A262.1000004@imgtec.com>
Sender: linux-doc-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 24 Apr 2013, James Hogan wrote:
> Thanks for the review Thomas!
> 
> On 23/04/13 16:09, Thomas Gleixner wrote:
> > On Tue, 23 Apr 2013, James Hogan wrote:
 >> +	spinlock_t		lock;
> > 
> >   raw_spinlock_t please
> 
> Okay.
> 
> If I understand right, this would be because on RT, spinlock_t becomes a
> mutex and won't work correctly with irqs actually disabled for the irq
> callbacks below, is that right?

Yep.
 
> I'll look into this. kernel/irq/generic-chip.c was added after this
> driver was written.

Fair enough.
 
> >> +static void pdc_intc_perip_isr(unsigned int irq, struct irq_desc *desc)
> >> +{
> >> +	struct pdc_intc_priv *priv;
> >> +	unsigned int i, irq_no;
> >> +
> >> +	priv = (struct pdc_intc_priv *)irq_desc_get_handler_data(desc);
> >> +
> >> +	/* find the peripheral number */
> >> +	for (i = 0; i < priv->nr_perips; ++i)
> >> +		if (irq == priv->perip_irqs[i])
> >> +			goto found;
> > 
> > Whee. Aren't these numbers linear ?
> 
> Not necessarily as they're virtual irq numbers obtained via
> platform_get_irq(), which come individually from device tree. Even their
> hardware irq numbers aren't linear as they're not wired to their irqchip
> in the same order:
> > pdc: pdc@0x02006000 {
> > 	interrupt-controller;
> > 	#interrupt-cells = <3>;
> > 
> > 	reg = <0x02006000 0x1000>;
> > 	compatible = "img,pdc-intc";
> > 
> > 	num-perips = <3>;
> > 	num-syswakes = <3>;
> > 
> > 	interrupts = <18 4 /* level */>, /* Syswakes */
> > 	             <30 4 /* level */>, /* Perip 0 (RTC) */
> > 	             <29 4 /* level */>, /* Perip 1 (IR) */
> > 	             <31 4 /* level */>; /* Perip 2 (WDT) */
> > };

Interesting. 

> >> +static int pdc_intc_remove(struct platform_device *pdev)
> >> +{
> >> +	struct pdc_intc_priv *priv = platform_get_drvdata(pdev);
> >> +
> >> +	irq_domain_remove(priv->domain);
> > 
> > And the rest of the resources is still there?
> 
> I was under the impression devm_kzalloc and devm_ioremap took care of
> that in both the probe error case and the remove case:
 
> >  * devm_kzalloc - Resource-managed kzalloc
> >  * Managed kzalloc.  Memory allocated with this function is
> >  * automatically freed on driver detach. 
> > 
> >  * devm_ioremap - Managed ioremap()
> >  * Managed ioremap().  Map is automatically unmapped on driver detach.
> 
> I may have misunderstood the whole point of their existence though?

No, that was just me missing the devm_ in front of
kzalloc/ioremap. So you're good.

Thanks,

	tglx
