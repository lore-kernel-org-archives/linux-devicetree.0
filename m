From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/6] genirq: Add handle_fasteoi_{level,edge}_irq flow
 handlers.
Date: Fri, 31 Mar 2017 16:57:15 -0700
Message-ID: <95ea6d46-be8b-1d7b-5cfc-27f604d34ea7@gmail.com>
References: <1488332932-2691-1-git-send-email-david.daney@cavium.com>
 <1488332932-2691-3-git-send-email-david.daney@cavium.com>
 <254c0505-6890-2e9f-cf04-3c8efbcfeb2d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <254c0505-6890-2e9f-cf04-3c8efbcfeb2d-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

I am finally getting back to this, sorry for the delay ...

On 03/14/2017 09:54 AM, Marc Zyngier wrote:
> On 01/03/17 01:48, David Daney wrote:
>> Follow-on patch for gpio-thunderx uses a irqdomain hierarchy which
>> requires slightly different flow handlers, add them to chip.c which
>> contains most of the other flow handlers.
>>
>> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>> ---
>>  include/linux/irq.h |   2 ++
>>  kernel/irq/chip.c   | 102 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 104 insertions(+)
>>
>> diff --git a/include/linux/irq.h b/include/linux/irq.h
>> index f887351..3db0eb8 100644
>> --- a/include/linux/irq.h
>> +++ b/include/linux/irq.h
>> @@ -518,6 +518,8 @@ static inline int irq_set_parent(int irq, int parent_irq)
>>  extern int irq_chip_pm_get(struct irq_data *data);
>>  extern int irq_chip_pm_put(struct irq_data *data);
>>  #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
>> +extern void handle_fasteoi_edge_irq(struct irq_desc *desc);
>> +extern void handle_fasteoi_level_irq(struct irq_desc *desc);
>>  extern void irq_chip_enable_parent(struct irq_data *data);
>>  extern void irq_chip_disable_parent(struct irq_data *data);
>>  extern void irq_chip_ack_parent(struct irq_data *data);
>> diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
>> index 73ea90b..213105d 100644
>> --- a/kernel/irq/chip.c
>> +++ b/kernel/irq/chip.c
>> @@ -981,6 +981,108 @@ void irq_cpu_offline(void)
>>
>>  #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
>>  /**
>> + *	handle_fasteoi_edge_irq - irq handler for edge hierarchy
>> + *	stacked on transparent controllers
>> + *
>> + *	@desc:	the interrupt description structure for this irq
>> + *
>> + *	Like handle_fasteoi_irq(), but for use with hierarchy where
>> + *	the irq_chip also needs to have its ->irq_ack() function
>> + *	called.
>> + */
>> +void handle_fasteoi_edge_irq(struct irq_desc *desc)
>> +{
>> +	struct irq_chip *chip = desc->irq_data.chip;
>> +
>> +	raw_spin_lock(&desc->lock);
>> +
>> +	if (!irq_may_run(desc))
>> +		goto out;
>> +
>> +	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
>> +
>> +	/*
>> +	 * If its disabled or no action available
>> +	 * then mask it and get out of here:
>> +	 */
>> +	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
>> +		desc->istate |= IRQS_PENDING;
>> +		mask_irq(desc);
>> +		goto out;
>> +	}
>> +
>> +	kstat_incr_irqs_this_cpu(desc);
>> +	if (desc->istate & IRQS_ONESHOT)
>> +		mask_irq(desc);
>> +
>> +	/* Start handling the irq */
>> +	desc->irq_data.chip->irq_ack(&desc->irq_data);
>> +
>> +	preflow_handler(desc);
>> +	handle_irq_event(desc);
>> +
>> +	cond_unmask_eoi_irq(desc, chip);
>> +
>> +	raw_spin_unlock(&desc->lock);
>> +	return;
>> +out:
>> +	if (!(chip->flags & IRQCHIP_EOI_IF_HANDLED))
>> +		chip->irq_eoi(&desc->irq_data);
>> +	raw_spin_unlock(&desc->lock);
>> +}
>> +EXPORT_SYMBOL_GPL(handle_fasteoi_edge_irq);
>
> So this is handle_fasteoi_irq with an irq_ack() added in the middle. In
> the spirit of making this a bit more maintainable, how about making the
> handle_fasteoi_irq code reusable (if necessary by forcing the compiler
> to inline stuff)?

You, yourself, said in response to an earlier version of the patch set:


     So you want to generalize CONFIG_IRQ_PREFLOW_FASTEOI so that it is
     on each level of a domain stack? Humm. I personally think that
     this is a massive bloat that is going to impact all the hot paths
     for no gain whatsoever, but I'll let tglx speak his mind on that.

Your current suggestion is, from the point of view of the "impact", 
almost identical to what I was proposing back then.

>
> But the one thing that makes me uncomfortable here is that we're seem to
> have this irq_ack() propagated all along the irqdata chain, which is not
> what's happening. Only the EOI gets propagated.

That is intentional.  The parent domain is handle_fasteoi_irq(), so we 
know that it has no irq_ack().


>
> Why can't you just put the irq_ack call in your top level irq_eoi
> callback? That'd make it similar to what is happening on the mbigen side
> (not exactly surprising, since they are doing very similar things).

irq_ack() must be called before handle_irq_event(), otherwise there is a 
race condition where edge interrupts could be lost.


>
> Same remark about handle_fasteoi_level_irq.
>
> Thoughts?

Several:

1) Adding the additional mask_ack_irq()/irq_ack() to 
handle_fasteoi_irq() is probably the cleanest solution, however ...

2) There is a risk of breaking systems that inadvertently supply the new 
chip methods, but the methods don't currently get called by 
handle_fasteoi_irq().

3) Checking for the presence of mask_ack_irq()/irq_ack() methods may 
introduce additional branch mispredictions and cache misses on all 
non-ThunderGPIO systems.


David Daney
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
