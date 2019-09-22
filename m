From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 1/5] irqchip/irq-bcm7038-l1: Add PM support
Date: Sun, 22 Sep 2019 11:50:23 -0700
Message-ID: <3952c2c7-c619-eab6-e3ad-d8735104dace@gmail.com>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
 <20190913191542.9908-2-f.fainelli@gmail.com> <20190922133108.09211a17@why>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190922133108.09211a17@why>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, Justin Chen <justinpopo6@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 9/22/2019 5:31 AM, Marc Zyngier wrote:
>> +#ifdef CONFIG_PM_SLEEP
>> +static int bcm7038_l1_suspend(void)
>> +{
>> +	struct bcm7038_l1_chip *intc;
>> +	unsigned long flags;
>> +	int boot_cpu, word;
>> +
>> +	/* Wakeup interrupt should only come from the boot cpu */
>> +	boot_cpu = cpu_logical_map(smp_processor_id());
> 
> What guarantees that you're actually running on the boot CPU at this
> point? If that's actually the case, why isn't cpu_logical_map(0) enough?

This is executed from syscore_suspend() which is executed after
suspend_disable_secondary_cpus(), so we are guaranteed to be
uni-processor at that point. Good point about using 0 for addressing the
boot CPU.

> 
>> +
>> +	list_for_each_entry(intc, &bcm7038_l1_intcs_list, list) {
>> +		raw_spin_lock_irqsave(&intc->lock, flags);
> 
> And if this can only run on a single CPU, what's the purpose of this
> lock?

Humm, yes, we probably do not need that lock, syscore_suspend() is after
arch_suspend_disable_irqs().

> 
>> +		for (word = 0; word < intc->n_words; word++) {
>> +			l1_writel(~intc->wake_mask[word],
>> +				intc->cpus[boot_cpu]->map_base +
>> +				reg_mask_set(intc, word));
>> +			l1_writel(intc->wake_mask[word],
>> +				intc->cpus[boot_cpu]->map_base +
>> +				reg_mask_clr(intc, word));
> 
> nit: Please don't split the write address across two lines, it makes it
> harder to read.
> 
>> +		}
>> +		raw_spin_unlock_irqrestore(&intc->lock, flags);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void bcm7038_l1_resume(void)
>> +{
>> +	struct bcm7038_l1_chip *intc;
>> +	unsigned long flags;
>> +	int boot_cpu, word;
>> +
>> +	boot_cpu = cpu_logical_map(smp_processor_id());
>> +
>> +	list_for_each_entry(intc, &bcm7038_l1_intcs_list, list) {
>> +		raw_spin_lock_irqsave(&intc->lock, flags);
>> +		for (word = 0; word < intc->n_words; word++) {
>> +			l1_writel(intc->cpus[boot_cpu]->mask_cache[word],
>> +				intc->cpus[boot_cpu]->map_base +
>> +				reg_mask_set(intc, word));
>> +			l1_writel(~intc->cpus[boot_cpu]->mask_cache[word],
>> +				intc->cpus[boot_cpu]->map_base +
>> +				reg_mask_clr(intc, word));
>> +		}
>> +		raw_spin_unlock_irqrestore(&intc->lock, flags);
>> +	}
>> +}
>> +
>> +static struct syscore_ops bcm7038_l1_syscore_ops = {
>> +	.suspend	= bcm7038_l1_suspend,
>> +	.resume		= bcm7038_l1_resume,
>> +};
>> +
>> +static int bcm7038_l1_set_wake(struct irq_data *d, unsigned int on)
>> +{
>> +	struct bcm7038_l1_chip *intc = irq_data_get_irq_chip_data(d);
>> +	unsigned long flags;
>> +	u32 word = d->hwirq / IRQS_PER_WORD;
>> +	u32 mask = BIT(d->hwirq % IRQS_PER_WORD);
>> +
>> +	raw_spin_lock_irqsave(&intc->lock, flags);
>> +	if (on)
>> +		intc->wake_mask[word] |= mask;
>> +	else
>> +		intc->wake_mask[word] &= ~mask;
>> +	raw_spin_unlock_irqrestore(&intc->lock, flags);
>> +
>> +	return 0;
>> +}
>> +#endif
>> +
>>  static struct irq_chip bcm7038_l1_irq_chip = {
>>  	.name			= "bcm7038-l1",
>>  	.irq_mask		= bcm7038_l1_mask,
>> @@ -295,6 +382,9 @@ static struct irq_chip bcm7038_l1_irq_chip = {
>>  #ifdef CONFIG_SMP
>>  	.irq_cpu_offline	= bcm7038_l1_cpu_offline,
>>  #endif
>> +#ifdef CONFIG_PM_SLEEP
>> +	.irq_set_wake		= bcm7038_l1_set_wake,
>> +#endif
>>  };
>>  
>>  static int bcm7038_l1_map(struct irq_domain *d, unsigned int virq,
>> @@ -340,6 +430,14 @@ int __init bcm7038_l1_of_init(struct device_node *dn,
>>  		goto out_unmap;
>>  	}
>>  
>> +#ifdef CONFIG_PM_SLEEP
>> +	/* Add bcm7038_l1_chip into a list */
>> +	INIT_LIST_HEAD(&intc->list);
>> +	list_add_tail(&intc->list, &bcm7038_l1_intcs_list);
> 
> No locking to manipulate this list? Is that safe?

It is safe, by virtue of of_irq_init() having being called at init_IRQ()
and that interrupt controller being initialized early on boot, but it
does not feel safe to assume that, I will add relevant protection to the
list.

> 
>> +
>> +	register_syscore_ops(&bcm7038_l1_syscore_ops);
> 
> Do you really register the syscore_ops for each and every L1 irqchip?

We do not need, indeed thanks, I will fix those things in v3.
-- 
Florian
