From: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 1/5] irqchip/irq-bcm7038-l1: Add PM support
Date: Sun, 22 Sep 2019 13:31:08 +0100
Message-ID: <20190922133108.09211a17@why>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
        <20190913191542.9908-2-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190913191542.9908-2-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-kernel@vger.kernel.org, Justin Chen <justinpopo6@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:BROADCOM BMIPS MIPS
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 13 Sep 2019 12:15:38 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> From: Justin Chen <justinpopo6@gmail.com>
> 
> The current l1 controller does not mask any interrupts when dropping
> into suspend. This mean we can receive unexpected wake up sources.
> Modified MIPS l1 controller to mask the all non-wake interrupts before
> dropping into suspend.
> 
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/irqchip/irq-bcm7038-l1.c | 98 ++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
> index fc75c61233aa..f5e4ff5251ab 100644
> --- a/drivers/irqchip/irq-bcm7038-l1.c
> +++ b/drivers/irqchip/irq-bcm7038-l1.c
> @@ -27,6 +27,7 @@
>  #include <linux/types.h>
>  #include <linux/irqchip.h>
>  #include <linux/irqchip/chained_irq.h>
> +#include <linux/syscore_ops.h>
>  
>  #define IRQS_PER_WORD		32
>  #define REG_BYTES_PER_IRQ_WORD	(sizeof(u32) * 4)
> @@ -39,6 +40,10 @@ struct bcm7038_l1_chip {
>  	unsigned int		n_words;
>  	struct irq_domain	*domain;
>  	struct bcm7038_l1_cpu	*cpus[NR_CPUS];
> +#ifdef CONFIG_PM_SLEEP
> +	struct list_head	list;
> +	u32			wake_mask[MAX_WORDS];
> +#endif
>  	u8			affinity[MAX_WORDS * IRQS_PER_WORD];
>  };
>  
> @@ -47,6 +52,17 @@ struct bcm7038_l1_cpu {
>  	u32			mask_cache[0];
>  };
>  
> +/*
> + * We keep a list of bcm7038_l1_chip used for suspend/resume. This hack is
> + * used because the struct chip_type suspend/resume hooks are not called
> + * unless chip_type is hooked onto a generic_chip. Since this driver does
> + * not use generic_chip, we need to manually hook our resume/suspend to
> + * syscore_ops.
> + */
> +#ifdef CONFIG_PM_SLEEP
> +static LIST_HEAD(bcm7038_l1_intcs_list);
> +#endif

nit: this could be moved down to be close to the rest of the PM_SLEEP
ifdefery.

> +
>  /*
>   * STATUS/MASK_STATUS/MASK_SET/MASK_CLEAR are packed one right after another:
>   *
> @@ -287,6 +303,77 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int bcm7038_l1_suspend(void)
> +{
> +	struct bcm7038_l1_chip *intc;
> +	unsigned long flags;
> +	int boot_cpu, word;
> +
> +	/* Wakeup interrupt should only come from the boot cpu */
> +	boot_cpu = cpu_logical_map(smp_processor_id());

What guarantees that you're actually running on the boot CPU at this
point? If that's actually the case, why isn't cpu_logical_map(0) enough?

> +
> +	list_for_each_entry(intc, &bcm7038_l1_intcs_list, list) {
> +		raw_spin_lock_irqsave(&intc->lock, flags);

And if this can only run on a single CPU, what's the purpose of this
lock?

> +		for (word = 0; word < intc->n_words; word++) {
> +			l1_writel(~intc->wake_mask[word],
> +				intc->cpus[boot_cpu]->map_base +
> +				reg_mask_set(intc, word));
> +			l1_writel(intc->wake_mask[word],
> +				intc->cpus[boot_cpu]->map_base +
> +				reg_mask_clr(intc, word));

nit: Please don't split the write address across two lines, it makes it
harder to read.

> +		}
> +		raw_spin_unlock_irqrestore(&intc->lock, flags);
> +	}
> +
> +	return 0;
> +}
> +
> +static void bcm7038_l1_resume(void)
> +{
> +	struct bcm7038_l1_chip *intc;
> +	unsigned long flags;
> +	int boot_cpu, word;
> +
> +	boot_cpu = cpu_logical_map(smp_processor_id());
> +
> +	list_for_each_entry(intc, &bcm7038_l1_intcs_list, list) {
> +		raw_spin_lock_irqsave(&intc->lock, flags);
> +		for (word = 0; word < intc->n_words; word++) {
> +			l1_writel(intc->cpus[boot_cpu]->mask_cache[word],
> +				intc->cpus[boot_cpu]->map_base +
> +				reg_mask_set(intc, word));
> +			l1_writel(~intc->cpus[boot_cpu]->mask_cache[word],
> +				intc->cpus[boot_cpu]->map_base +
> +				reg_mask_clr(intc, word));
> +		}
> +		raw_spin_unlock_irqrestore(&intc->lock, flags);
> +	}
> +}
> +
> +static struct syscore_ops bcm7038_l1_syscore_ops = {
> +	.suspend	= bcm7038_l1_suspend,
> +	.resume		= bcm7038_l1_resume,
> +};
> +
> +static int bcm7038_l1_set_wake(struct irq_data *d, unsigned int on)
> +{
> +	struct bcm7038_l1_chip *intc = irq_data_get_irq_chip_data(d);
> +	unsigned long flags;
> +	u32 word = d->hwirq / IRQS_PER_WORD;
> +	u32 mask = BIT(d->hwirq % IRQS_PER_WORD);
> +
> +	raw_spin_lock_irqsave(&intc->lock, flags);
> +	if (on)
> +		intc->wake_mask[word] |= mask;
> +	else
> +		intc->wake_mask[word] &= ~mask;
> +	raw_spin_unlock_irqrestore(&intc->lock, flags);
> +
> +	return 0;
> +}
> +#endif
> +
>  static struct irq_chip bcm7038_l1_irq_chip = {
>  	.name			= "bcm7038-l1",
>  	.irq_mask		= bcm7038_l1_mask,
> @@ -295,6 +382,9 @@ static struct irq_chip bcm7038_l1_irq_chip = {
>  #ifdef CONFIG_SMP
>  	.irq_cpu_offline	= bcm7038_l1_cpu_offline,
>  #endif
> +#ifdef CONFIG_PM_SLEEP
> +	.irq_set_wake		= bcm7038_l1_set_wake,
> +#endif
>  };
>  
>  static int bcm7038_l1_map(struct irq_domain *d, unsigned int virq,
> @@ -340,6 +430,14 @@ int __init bcm7038_l1_of_init(struct device_node *dn,
>  		goto out_unmap;
>  	}
>  
> +#ifdef CONFIG_PM_SLEEP
> +	/* Add bcm7038_l1_chip into a list */
> +	INIT_LIST_HEAD(&intc->list);
> +	list_add_tail(&intc->list, &bcm7038_l1_intcs_list);

No locking to manipulate this list? Is that safe?

> +
> +	register_syscore_ops(&bcm7038_l1_syscore_ops);

Do you really register the syscore_ops for each and every L1 irqchip?

> +#endif
> +
>  	pr_info("registered BCM7038 L1 intc (%pOF, IRQs: %d)\n",
>  		dn, IRQS_PER_WORD * intc->n_words);
>  

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.
