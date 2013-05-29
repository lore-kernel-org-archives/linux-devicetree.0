From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 7/8] genirq: generic chip: Add linear irq domain
 support
Date: Wed, 29 May 2013 10:23:18 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1305291019450.2995@ionos>
References: <20130503212258.385818955@linutronix.de> <20130506142348.321859745@linutronix.de> <20130506142539.450634298@linutronix.de> <20130529022249.DE5ED3E14F1@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130529022249.DE5ED3E14F1@localhost>
Sender: linux-doc-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Arnd Bergmann <arnd@arndb.de>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jean-Francois Moine <moinejf@free.fr>, Gerlando Falauto <gerlando.falauto@keymile.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 29 May 2013, Grant Likely wrote:
> > --- linux-2.6.orig/include/linux/irq.h
> > +++ linux-2.6/include/linux/irq.h
> > @@ -678,6 +678,8 @@ struct irq_chip_type {
> >   * @wake_active:	Interrupt is marked as an wakeup from suspend source
> >   * @num_ct:		Number of available irq_chip_type instances (usually 1)
> >   * @private:		Private data for non generic chip callbacks
> > + * @installed:		bitfield to denote installed interrupts
> > + * @domain:		irq domain pointer
> >   * @list:		List head for keeping track of instances
> >   * @chip_types:		Array of interrupt irq_chip_types
> >   *
> > @@ -699,6 +701,8 @@ struct irq_chip_generic {
> >  	u32			wake_active;
> >  	unsigned int		num_ct;
> >  	void			*private;
> > +	unsigned long		installed;
> 
> This is probably something that the irqdomain should be keeping track of
> internally, but that's an issue for a separate patch series.

Ok. I just need access to that information, so I can figure out if
it's the first irq of the chip which gets mapped. I need this for
initializing the mask cache.
 
> [...]
> > +struct irq_domain_ops irq_generic_chip_ops = {
> > +	.map = irq_map_generic_chip,
> > +	.xlate = irq_domain_xlate_onecell,
> 
> As discussed on IRC, should use onetwocell here for greater
> compatibility with existing bindings.

Changed that.

Thanks,

	tglx
