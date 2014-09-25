From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH] [RFC] Using hierarchy irqdomian to implement MTK
 intpol.
Date: Wed, 24 Sep 2014 23:17:11 -0400
Message-ID: <20140925031711.GV23926@titan.lakedaemon.net>
References: <1411574696-1881-1-git-send-email-srv_yingjoe.chen@mediatek.com>
 <1411611417.21763.56.camel@mtksdaap41>
 <54238645.8090502@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54238645.8090502-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "Joe.C" <srv_yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 25, 2014 at 11:04:37AM +0800, Jiang Liu wrote:
> Hi Joe,
> 	Thanks, I will merge them into my next version.
> Regards!
> Gerry
> 
> On 2014/9/25 10:16, Joe.C wrote:
> > 
> > Jiang,
> > 
> > Please consider merge the following 2 changes into your next round.

ummm.  I'm confused.  I'll admit I'm a bit liquored up atm, but it looks
like "Joe C." posted a patch 'From: Joe C.', and 'Signed-off-by: Joe C.'.
_Then_, Joe C. replied to himself and asked someone *else* to merge the
below changes into the originally posted patch.  The real kicker is that
someone responded and said they would do it. (?!)

Please tell me the scotch is making this look more fucked up than it
really is...

Also, if Joe.C could please fix his mailer and git config to produce a
complete, correct name, that would be appreciated.

thx,

Jason.

> > On Thu, 2014-09-25 at 00:04 +0800, Joe.C wrote:
> >> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> >> index e285f3a..01e852b 100644
> >> --- a/kernel/irq/irqdomain.c
> >> +++ b/kernel/irq/irqdomain.c
> >> @@ -467,7 +467,7 @@ unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data)
> >>  	struct irq_domain *domain;
> >>  	irq_hw_number_t hwirq;
> >>  	unsigned int type = IRQ_TYPE_NONE;
> >> -	unsigned int virq;
> >> +	int virq;
> >>  
> >>  	domain = irq_data->np ? irq_find_host(irq_data->np) : irq_default_domain;
> >>  	if (!domain) {
> >> @@ -493,8 +493,8 @@ unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data)
> >>  	else
> >>  #endif
> >>  		virq = irq_create_mapping(domain, hwirq);
> >> -	if (!virq)
> >> -		return virq;
> >> +	if (virq <= 0)
> >> +		return 0;
> >>  
> >>  	/* Set type if specified and different than the current one */
> >>  	if (type != IRQ_TYPE_NONE &&
> > 
> > irq_of_parse_and_map()/of_irq_to_resource() expect
> > irq_create_of_mapping() to return 0 when fail. Return error code will
> > cause of_irq_to_resource crash.
> > 
> > 
> >> @@ -716,20 +716,20 @@ const struct irq_domain_ops irq_domain_simple_ops = {
> >>  };
> >>  EXPORT_SYMBOL_GPL(irq_domain_simple_ops);
> >>  
> >> -static int irq_domain_alloc_descs(int virq, unsigned int nr_irqs,
> >> +static int irq_domain_alloc_descs(int virq, unsigned int cnt,
> >>  				  irq_hw_number_t hwirq, int node)
> >>  {
> >>  	unsigned int hint;
> >>  
> >>  	if (virq >= 0) {
> >> -		virq = irq_alloc_descs(virq, virq, nr_irqs, node);
> >> +		virq = irq_alloc_descs(virq, virq, cnt, node);
> >>  	} else {
> >>  		hint = hwirq % nr_irqs;
> >>  		if (hint == 0)
> >>  			hint++;
> >> -		virq = irq_alloc_descs_from(hint, nr_irqs, node);
> >> +		virq = irq_alloc_descs_from(hint, cnt, node);
> >>  		if (virq <= 0 && hint > 1)
> >> -			virq = irq_alloc_descs_from(1, nr_irqs, node);
> >> +			virq = irq_alloc_descs_from(1, cnt, node);
> >>  	}
> >>  
> >>  	return virq;
> > 
> > This come from irq_create_mapping(), the original code is using global
> > nr_irqs. Change to match original behavior.
> > 
> > Joe.C
> > 
> > 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
