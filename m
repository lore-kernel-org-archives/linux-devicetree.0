From: David Daney <ddaney.cavm@gmail.com>
Subject: Re: [PATCH v5 3/6] irqdomain: Add irq_domain_{push,pop}_irq()
 functions.
Date: Fri, 31 Mar 2017 17:21:57 -0700
Message-ID: <984721a7-6783-3848-7dcb-800d0b76c644@gmail.com>
References: <1488332932-2691-1-git-send-email-david.daney@cavium.com>
 <1488332932-2691-4-git-send-email-david.daney@cavium.com>
 <4486da82-bc22-4334-3d48-70f4304da591@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <4486da82-bc22-4334-3d48-70f4304da591@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/14/2017 09:11 AM, Marc Zyngier wrote:
> Hi David,
>
> On 01/03/17 01:48, David Daney wrote:
>> For an already existing irqdomain hierarchy, as might be obtained via
>> a call to pci_enable_msix(), a PCI driver wishing to add an additional
>> irqdomain to the hierarchy needs to be able to insert the irqdomain to
>> that already initialized hierarchy.  Calling
>> irq_domain_create_hierarchy() allows the new irqdomain to be created,
>> but no existing code allows for initializing the associated irq_data.
>
> I must say that I like this idea a lot. Pretty elegant. Now, there is a
> couple of things that do worry me. And instead of worrying, maybe I
> should just ask the questions.
>
>> Add a couple of helper functions (irq_domain_push_irq()
>> irq_domain_pop_irq()) to initialize the irq_data for the new
>> irqdomain.
>>
>> Signed-off-by: David Daney <david.daney@cavium.com>
>> ---
>>  include/linux/irqdomain.h |   3 +
>>  kernel/irq/irqdomain.c    | 137 ++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 140 insertions(+)
>>
>> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
>> index 188eced..a7a16b7 100644
>> --- a/include/linux/irqdomain.h
>> +++ b/include/linux/irqdomain.h
>> @@ -425,6 +425,9 @@ extern void irq_domain_free_irqs_common(struct irq_domain *domain,
>>  extern void irq_domain_free_irqs_top(struct irq_domain *domain,
>>  				     unsigned int virq, unsigned int nr_irqs);
>>
>> +extern int irq_domain_push_irq(struct irq_domain *domain, int virq, void *arg);
>> +extern int irq_domain_pop_irq(struct irq_domain *domain, int virq);
>> +
>>  extern int irq_domain_alloc_irqs_parent(struct irq_domain *domain,
>>  					unsigned int irq_base,
>>  					unsigned int nr_irqs, void *arg);
>> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
>> index 31805f2..d5d1c01 100644
>> --- a/kernel/irq/irqdomain.c
>> +++ b/kernel/irq/irqdomain.c
>> @@ -1304,6 +1304,143 @@ int __irq_domain_alloc_irqs(struct irq_domain *domain, int irq_base,
>>  	return ret;
>>  }
>>
>> +/* The irq_data was moved, fix the revmap to refer to the new location */
>> +static void irq_domain_fix_revmap(struct irq_data *d)
>> +{
>> +	void **slot;
>> +
>> +	if (d->hwirq < d->domain->revmap_size)
>> +		return; /* Not using radix tree. */
>> +
>> +	/* Fix up the revmap. */
>> +	mutex_lock(&revmap_trees_mutex);
>> +	slot = radix_tree_lookup_slot(&d->domain->revmap_tree, d->hwirq);
>> +	if (slot)
>> +		radix_tree_replace_slot(&d->domain->revmap_tree, slot, d);
>> +	mutex_unlock(&revmap_trees_mutex);
>> +}
>> +
>> +/**
>> + * irq_domain_push_irq() - Push a domain in to the top of a hierarchy.
>> + * @domain:	Domain to push.
>> + * @virq:	Irq to push the domain in to.
>> + * @arg:	Passed to the irq_domain_ops alloc() function.
>> + *
>> + * For an already existing irqdomain hierarchy, as might be obtained
>> + * via a call to pci_enable_msix(), add an additional domain to the
>> + * head of the processing chain.
>> + */
>> +int irq_domain_push_irq(struct irq_domain *domain, int virq, void *arg)
>> +{
>> +	struct irq_data *child_irq_data;
>> +	struct irq_data *root_irq_data = irq_get_irq_data(virq);
>> +
>> +	if (domain == NULL)
>> +		return -EINVAL;
>> +
>> +	if (WARN_ON(!domain->ops->alloc))
>> +		return -EINVAL;
>> +
>> +	if (!root_irq_data)
>> +		return -EINVAL;
>> +
>> +	child_irq_data = kzalloc_node(sizeof(*child_irq_data), GFP_KERNEL,
>> +				      irq_data_get_node(root_irq_data));
>> +	if (!child_irq_data)
>> +		return -ENOMEM;
>> +
>> +	mutex_lock(&irq_domain_mutex);
>> +
>> +	/* Copy the original irq_data. */
>> +	*child_irq_data = *root_irq_data;
>> +
>> +	irq_domain_fix_revmap(child_irq_data);
>> +
>> +	/*
>> +	 * Overwrite the root_irq_data, which is embedded in struct
>> +	 * irq_desc, with values for this domain.
>> +	 */
>> +	root_irq_data->parent_data = child_irq_data;
>> +	root_irq_data->domain = domain;
>> +	root_irq_data->mask = 0;
>> +	root_irq_data->hwirq = 0;
>> +	root_irq_data->chip = NULL;
>> +	root_irq_data->chip_data = NULL;
>
> What guarantees do we have that nobody is using this irqdesc at this
> point? Is it a "don't do that because it will hurt" kind of thing?

Yes.

> I'd be more confident if we had some locking here, just to make sure that we
> don't start processing an interrupt with all these NULL pointers.
>

The only time it makes sense to push/pop is when no request_irq() are 
active.  Perhaps checking (with proper locking) that there are no 
actions registered is the proper thing to do.

> Also, maybe moving the whole stuff to a helper in irqdesc.c if that
> makes it easier/nicer? Your call.
>
>> +	domain->ops->alloc(domain, virq, 1, arg);
>
> Check return value? You may have to revert your previous fixup if it fails.

OK.

>
>> +
>> +	if (root_irq_data->hwirq < domain->revmap_size) {
>> +		domain->linear_revmap[root_irq_data->hwirq] = virq;
>> +	} else {
>> +		mutex_lock(&revmap_trees_mutex);
>> +		radix_tree_insert(&domain->revmap_tree,
>> +				  root_irq_data->hwirq, root_irq_data);
>> +		mutex_unlock(&revmap_trees_mutex);
>> +	}
>> +
>> +	mutex_unlock(&irq_domain_mutex);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(irq_domain_push_irq);
>> +
>> +/**
>> + * irq_domain_pop_irq() - Remove a domain from the top of a hierarchy.
>> + * @domain:	Domain to remove.
>> + * @virq:	Irq to remove the domain from.
>> + *
>> + * Undo the effects of a call to irq_domain_push_irq().
>> + */
>> +int irq_domain_pop_irq(struct irq_domain *domain, int virq)
>> +{
>> +	struct irq_data *root_irq_data = irq_get_irq_data(virq);
>> +	struct irq_data *child_irq_data;
>> +	struct irq_data *tmp_irq_data;
>> +
>> +	if (domain == NULL)
>> +		return -EINVAL;
>> +
>> +	if (!root_irq_data)
>> +		return -EINVAL;
>> +
>> +	tmp_irq_data = irq_domain_get_irq_data(domain, virq);
>> +
>> +	/* We can only "pop" if this domain is at the top of the list */
>> +	if (WARN_ON(root_irq_data != tmp_irq_data))
>> +		return -EINVAL;
>> +
>> +	if (WARN_ON(root_irq_data->domain != domain))
>> +		return -EINVAL;
>> +
>> +	child_irq_data = root_irq_data->parent_data;
>> +	if (WARN_ON(!child_irq_data))
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&irq_domain_mutex);
>> +
>> +	root_irq_data->parent_data = NULL;
>> +
>> +	if (root_irq_data->hwirq >= domain->revmap_size) {
>> +		mutex_lock(&revmap_trees_mutex);
>> +		radix_tree_delete(&domain->revmap_tree, root_irq_data->hwirq);
>> +		mutex_unlock(&revmap_trees_mutex);
>> +	}
>> +
>> +	if (domain->ops->free)
>> +		domain->ops->free(domain, virq, 1);
>> +
>> +	/* Restore the original irq_data. */
>> +	*root_irq_data = *child_irq_data;
>
> Similar concerns about locking here.
>
>> +
>> +	irq_domain_fix_revmap(root_irq_data);
>> +
>> +	mutex_unlock(&irq_domain_mutex);
>> +
>> +	kfree(child_irq_data);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(irq_domain_pop_irq);
>> +
>>  /**
>>   * irq_domain_free_irqs - Free IRQ number and associated data structures
>>   * @virq:	base IRQ number
>>
>
> Thanks,
>
> 	M.
>

