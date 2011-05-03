From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 2/6] powerpc: make irq_{alloc, free}_virt private and
	remove count argument
Date: Tue, 03 May 2011 11:47:47 +1000
Message-ID: <1304387267.2513.298.camel@pasglop>
References: <20110428192227.8979.49181.stgit@ponder>
	<20110428200153.8979.23873.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110428200153.8979.23873.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2011-04-28 at 14:01 -0600, Grant Likely wrote:
> irq_alloc_virt() and irq_free_virt() aren't called anywhere but from
> arch/powerpc/kernel/irq.c, and they are only ever called with count=1.
> This patch removes the prototypes from the header file, removes the
> count arguments, and cuts out the dead code.
> 
> Also removes obsolete references to irq_early_init()

Nack.

The count was intended to be able to allocate blocks of interrupts. This
was not used so far because we didn't support MSI blocks (for non-X
MSIs) but that is coming, and unfortunately, the API that was designed
for that is crap and requires contiguous IRQ numbers on the linux side
as well as on the device side (well device side is a HW requirement but
we could have been smarter on the Linux side).

So the ability to allocate blocks will be needed. In fact it's not clear
yet whether we'll also need them to be naturally aligned powers of two
or not at this stage. It depends how the bloody API is going to be used
by drivers.

Cheers,
Ben.

> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> ---
>  arch/microblaze/kernel/setup.c |    2 -
>  arch/powerpc/include/asm/irq.h |   32 ----------------
>  arch/powerpc/kernel/irq.c      |   82 ++++++++++++++++++++--------------------
>  3 files changed, 40 insertions(+), 76 deletions(-)
> 
> diff --git a/arch/microblaze/kernel/setup.c b/arch/microblaze/kernel/setup.c
> index 8e2c09b..19d3ab7 100644
> --- a/arch/microblaze/kernel/setup.c
> +++ b/arch/microblaze/kernel/setup.c
> @@ -51,8 +51,6 @@ void __init setup_arch(char **cmdline_p)
>  
>  	unflatten_device_tree();
>  
> -	/* NOTE I think that this function is not necessary to call */
> -	/* irq_early_init(); */
>  	setup_cpuinfo();
>  
>  	microblaze_cache_init();
> diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
> index e1983d5..4d2cc6f 100644
> --- a/arch/powerpc/include/asm/irq.h
> +++ b/arch/powerpc/include/asm/irq.h
> @@ -264,38 +264,6 @@ extern unsigned int irq_linear_revmap(struct irq_host *host,
>  				      irq_hw_number_t hwirq);
>  
> 
> -
> -/**
> - * irq_alloc_virt - Allocate virtual irq numbers
> - * @host: host owning these new virtual irqs
> - * @count: number of consecutive numbers to allocate
> - * @hint: pass a hint number, the allocator will try to use a 1:1 mapping
> - *
> - * This is a low level function that is used internally by irq_create_mapping()
> - * and that can be used by some irq controllers implementations for things
> - * like allocating ranges of numbers for MSIs. The revmaps are left untouched.
> - */
> -extern unsigned int irq_alloc_virt(struct irq_host *host,
> -				   unsigned int count,
> -				   unsigned int hint);
> -
> -/**
> - * irq_free_virt - Free virtual irq numbers
> - * @virq: virtual irq number of the first interrupt to free
> - * @count: number of interrupts to free
> - *
> - * This function is the opposite of irq_alloc_virt. It will not clear reverse
> - * maps, this should be done previously by unmap'ing the interrupt. In fact,
> - * all interrupts covered by the range being freed should have been unmapped
> - * prior to calling this.
> - */
> -extern void irq_free_virt(unsigned int virq, unsigned int count);
> -
> -/**
> - * irq_early_init - Init irq remapping subsystem
> - */
> -extern void irq_early_init(void);
> -
>  static __inline__ int irq_canonicalize(int irq)
>  {
>  	return irq;
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index 422672b..5ccf38f 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -647,6 +647,9 @@ void irq_set_virq_count(unsigned int count)
>  		irq_virq_count = count;
>  }
>  
> +static unsigned int irq_alloc_virt(struct irq_host *host, unsigned int hint);
> +static void irq_free_virt(unsigned int virq);
> +
>  static int irq_setup_virq(struct irq_host *host, unsigned int virq,
>  			    irq_hw_number_t hwirq)
>  {
> @@ -675,7 +678,7 @@ static int irq_setup_virq(struct irq_host *host, unsigned int virq,
>  errdesc:
>  	irq_free_descs(virq, 1);
>  error:
> -	irq_free_virt(virq, 1);
> +	irq_free_virt(virq);
>  	return -1;
>  }
>  
> @@ -689,7 +692,7 @@ unsigned int irq_create_direct_mapping(struct irq_host *host)
>  	BUG_ON(host == NULL);
>  	WARN_ON(host->revmap_type != IRQ_HOST_MAP_NOMAP);
>  
> -	virq = irq_alloc_virt(host, 1, 0);
> +	virq = irq_alloc_virt(host, 0);
>  	if (virq == NO_IRQ) {
>  		pr_debug("irq: create_direct virq allocation failed\n");
>  		return NO_IRQ;
> @@ -742,7 +745,7 @@ unsigned int irq_create_mapping(struct irq_host *host,
>  	} else {
>  		/* Allocate a virtual interrupt number */
>  		hint = hwirq % irq_virq_count;
> -		virq = irq_alloc_virt(host, 1, hint);
> +		virq = irq_alloc_virt(host, hint);
>  		if (virq == NO_IRQ) {
>  			pr_debug("irq: -> virq allocation failed\n");
>  			return NO_IRQ;
> @@ -856,7 +859,7 @@ void irq_dispose_mapping(unsigned int virq)
>  
>  	irq_free_descs(virq, 1);
>  	/* Free it */
> -	irq_free_virt(virq, 1);
> +	irq_free_virt(virq);
>  }
>  EXPORT_SYMBOL_GPL(irq_dispose_mapping);
>  
> @@ -974,36 +977,31 @@ unsigned int irq_linear_revmap(struct irq_host *host,
>  	return revmap[hwirq];
>  }
>  
> -unsigned int irq_alloc_virt(struct irq_host *host,
> -			    unsigned int count,
> -			    unsigned int hint)
> +/**
> + * irq_alloc_virt() - Allocate virtual irq numbers
> + * @host: host owning these new virtual irqs
> + * @hint: pass a hint number, the allocator will try to use a 1:1 mapping
> + *
> + * This is a low level function that is used internally by irq_create_mapping()
> + */
> +static unsigned int irq_alloc_virt(struct irq_host *host, unsigned int hint)
>  {
>  	unsigned long flags;
>  	unsigned int i, j, found = NO_IRQ;
>  
> -	if (count == 0 || count > (irq_virq_count - NUM_ISA_INTERRUPTS))
> -		return NO_IRQ;
> -
>  	raw_spin_lock_irqsave(&irq_big_lock, flags);
>  
>  	/* Use hint for 1 interrupt if any */
> -	if (count == 1 && hint >= NUM_ISA_INTERRUPTS &&
> +	if (hint >= NUM_ISA_INTERRUPTS &&
>  	    hint < irq_virq_count && irq_map[hint].host == NULL) {
>  		found = hint;
>  		goto hint_found;
>  	}
>  
> -	/* Look for count consecutive numbers in the allocatable
> -	 * (non-legacy) space
> -	 */
> +	/* Look for a free virq in the allocatable (non-legacy) space */
>  	for (i = NUM_ISA_INTERRUPTS, j = 0; i < irq_virq_count; i++) {
> -		if (irq_map[i].host != NULL)
> -			j = 0;
> -		else
> -			j++;
> -
> -		if (j == count) {
> -			found = i - count + 1;
> +		if (irq_map[i].host == NULL) {
> +			found = i;
>  			break;
>  		}
>  	}
> @@ -1012,36 +1010,36 @@ unsigned int irq_alloc_virt(struct irq_host *host,
>  		return NO_IRQ;
>  	}
>   hint_found:
> -	for (i = found; i < (found + count); i++) {
> -		irq_map[i].hwirq = host->inval_irq;
> -		smp_wmb();
> -		irq_map[i].host = host;
> -	}
> +	irq_map[found].hwirq = host->inval_irq;
> +	smp_wmb();
> +	irq_map[found].host = host;
>  	raw_spin_unlock_irqrestore(&irq_big_lock, flags);
>  	return found;
>  }
>  
> -void irq_free_virt(unsigned int virq, unsigned int count)
> +/**
> + * irq_free_virt() - Free virtual irq numbers
> + * @virq: virtual irq number of the first interrupt to free
> + *
> + * This function is the opposite of irq_alloc_virt. It will not clear reverse
> + * maps, this should be done previously by unmap'ing the interrupt. In fact,
> + * the interrupts being freed should have been unmapped prior to calling this.
> + */
> +static void irq_free_virt(unsigned int virq)
>  {
>  	unsigned long flags;
> -	unsigned int i;
> +	struct irq_host *host;
>  
> -	WARN_ON (virq < NUM_ISA_INTERRUPTS);
> -	WARN_ON (count == 0 || (virq + count) > irq_virq_count);
> +	if ((virq < NUM_ISA_INTERRUPTS) || (virq >= irq_virq_count)) {
> +		WARN_ON(1);
> +		return;
> +	}
>  
>  	raw_spin_lock_irqsave(&irq_big_lock, flags);
> -	for (i = virq; i < (virq + count); i++) {
> -		struct irq_host *host;
> -
> -		if (i < NUM_ISA_INTERRUPTS ||
> -		    (virq + count) > irq_virq_count)
> -			continue;
> -
> -		host = irq_map[i].host;
> -		irq_map[i].hwirq = host->inval_irq;
> -		smp_wmb();
> -		irq_map[i].host = NULL;
> -	}
> +	host = irq_map[virq].host;
> +	irq_map[virq].hwirq = host->inval_irq;
> +	smp_wmb();
> +	irq_map[virq].host = NULL;
>  	raw_spin_unlock_irqrestore(&irq_big_lock, flags);
>  }
>  
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
