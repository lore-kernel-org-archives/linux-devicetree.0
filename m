From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: vic: device tree binding
Date: Tue, 27 Sep 2011 14:38:35 +0100
Message-ID: <20110927133835.GA15913@pulham.picochip.com>
References: <1317125802-14386-1-git-send-email-jamie@jamieiles.com>
	<4E81D003.4040501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E81D003.4040501-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Sep 27, 2011 at 08:30:43AM -0500, Rob Herring wrote:
> On 09/27/2011 07:16 AM, Jamie Iles wrote:
[...]
> > +#ifdef CONFIG_OF
> > +static int
> > +vic_irq_domain_dt_translate(struct irq_domain *d, struct device_node *np,
> > +			    const u32 *intspec, unsigned int intsize,
> > +			    unsigned long *out_hwirq, unsigned int *out_type)
> > +{
> > +	if (d->of_node != np)
> > +		return -EINVAL;
> > +	if (intsize < 1)
> > +		return -EINVAL;
> > +
> > +	*out_hwirq = intspec[0];
> > +	*out_type = IRQ_TYPE_NONE;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct irq_domain_ops vic_irq_domain_ops = {
> > +	.dt_translate = vic_irq_domain_dt_translate,
> > +};
> 
> You should be able to use the simple ops here. You'll need this patch if
> you don't already have it:
> 
> https://lkml.org/lkml/2011/9/14/189

I didn't use the simple ops because I thought it would be better to only 
accept one interrupt cell, but I got it wrong and should have had:

	if (intsize != 1)
		return -EINVAL;

The simple ops would work but I'm not sure what would be best.  Any 
preference?

> > +
> > +int __init vic_of_init(struct device_node *node, struct device_node *parent)
> > +{
> > +	void __iomem *regs = of_iomap(node, 0);
> > +	struct vic_device *vic;
> > +	int irq_base;
> > +
> > +	if (WARN_ON(!regs))
> > +		return -EIO;
> > +
> > +	irq_base = irq_alloc_descs(-1, 0, 32, numa_node_id());
> > +	if (WARN_ON(irq_base < 0))
> > +		goto out_unmap;
> > +
> > +	vic = __vic_init(regs, irq_base, ~0, ~0);
> > +	if (WARN_ON(!vic))
> > +		goto out_unmap;
> > +
> > +	vic->domain.irq_base = irq_base;
> > +	vic->domain.nr_irq = 32;
> > +	vic->domain.of_node = of_node_get(node);
> > +	vic->domain.ops = &vic_irq_domain_ops;
> > +	irq_domain_add(&vic->domain);
> > +
> > +	return 0;
> > +
> > +out_unmap:
> > +	iounmap(regs);
> > +
> > +	return -EIO;
> > +}
> > +
> > +#endif /* CONFIG OF */
> > diff --git a/arch/arm/include/asm/hardware/vic.h b/arch/arm/include/asm/hardware/vic.h
> > index 5d72550..df1d895 100644
> > --- a/arch/arm/include/asm/hardware/vic.h
> > +++ b/arch/arm/include/asm/hardware/vic.h
> > @@ -41,7 +41,18 @@
> >  #define VIC_PL192_VECT_ADDR		0xF00
> >  
> >  #ifndef __ASSEMBLY__
> > +struct device_node;
> >  void vic_init(void __iomem *base, unsigned int irq_start, u32 vic_sources, u32 resume_sources);
> > -#endif
> > +
> > +#ifdef CONFIG_OF
> > +int vic_of_init(struct device_node *node, struct device_node *parent);
> > +#else /* CONFIG_OF */
> > +static inline int vic_of_init(struct device_node *node,
> > +			      struct device_node *parent)
> > +{
> > +	return -ENOSYS;
> 
> I'm doing ENODEV here for gic. We should be consistent. Which is right?

I see -ENOSYS for lots of these in include/linux, but I'm not sure it 
matters a great deal.  I'll change it to -ENODEV for the next version.

Jamie
