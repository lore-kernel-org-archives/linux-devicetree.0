From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: gic: add irq_domain support
Date: Thu, 29 Sep 2011 12:15:40 -0500
Message-ID: <20110929171540.GC6800@ponder.secretlab.ca>
References: <1317268436-1613-1-git-send-email-robherring2@gmail.com>
	<1317268436-1613-2-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1317268436-1613-2-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2011 at 10:53:55PM -0500, Rob Herring wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> Convert the gic interrupt controller to use irq domains in preparation
> for device-tree binding and MULTI_IRQ. This allows for translation between
> GIC interrupt IDs and Linux irq numbers.
> 
> The meaning of irq_offset has changed. It now is just the number of skipped
> GIC interrupt IDs for the controller. It will be 16 for primary GIC and 32
> for secondary GICs.

[...]

>  /*
> @@ -81,7 +82,7 @@ static inline unsigned int gic_irq(struct irq_data *d)
>   */
>  static void gic_mask_irq(struct irq_data *d)
>  {
> -	u32 mask = 1 << (d->irq % 32);
> +	u32 mask = 1 << (gic_irq(d) % 32);

This can probably change simply to d->hwirq if irq_offset is
eliminated as I describe below.

>  void __init gic_init(unsigned int gic_nr, unsigned int irq_start,
>  	void __iomem *dist_base, void __iomem *cpu_base)
>  {
>  	struct gic_chip_data *gic;
> +	struct irq_domain *domain;
> +	int gic_irqs;
>  
>  	BUG_ON(gic_nr >= MAX_GIC_NR);
>  
>  	gic = &gic_data[gic_nr];
> +	domain = &gic->domain;
>  	gic->dist_base = dist_base;
>  	gic->cpu_base = cpu_base;
> -	gic->irq_offset = (irq_start - 1) & ~31;
>  
> -	if (gic_nr == 0)
> +	/*
> +	 * For primary GICs, skip over SGIs.
> +	 * For secondary GICs, skip over PPIs, too.
> +	 */
> +	if (gic_nr == 0) {
>  		gic_cpu_base_addr = cpu_base;
> +		gic->irq_offset = 16;
> +		irq_start = (irq_start & ~31) + 16;

With the switch to irq_domain, there should no longer be any need for
a ~31 mask on the irq_start number.  Yes, you'll want to make sure
that it doesn't allocate below irq 16, but the driver should
completely use the irq_domain to manage the mapping from linux-irq
number to hwirq number.  The ~31 mask appears to have been an
optimization to quickly calculate hwirq number from the linux one, but
that value is now found in irq_data->hwirq.

irq_offset could almost be dropped entirely outside of probe because
it no longer matters.  Instead, populate the to_irq() hook so that the
hwirq value gets set correctly from the outset.

It would be better in general to have a consistent view of what the
hwirq number means regardless of if it is a root GIC.

g.
