From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [V9 PATCH 2/2] irqchip: gicv2m: Add supports for ARM GICv2m MSI(-X)
Date: Mon, 03 Nov 2014 14:10:15 +0000
Message-ID: <54578CC7.4050901@arm.com>
References: <1414743990-28421-1-git-send-email-suravee.suthikulpanit@amd.com> <1414743990-28421-3-git-send-email-suravee.suthikulpanit@amd.com> <54574FF7.706@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54574FF7.706-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org" <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, "Harish.Kasiviswanathan-5C7GfCeVMHo@public.gmane.org" <Harish.Kasiviswanathan-5C7GfCeVMHo@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/11/14 09:50, Marc Zyngier wrote:

>> @@ -843,10 +847,14 @@ static int gic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
>>         unsigned int type = IRQ_TYPE_NONE;
>>         struct of_phandle_args *irq_data = arg;
>>
>> -       ret = gic_irq_domain_xlate(domain, irq_data->np, irq_data->args,
>> -                                  irq_data->args_count, &hwirq, &type);
>> -       if (ret)
>> -               return ret;
>> +       if (irq_data) {
>> +               ret = gic_irq_domain_xlate(domain, irq_data->np, irq_data->args,
>> +                                          irq_data->args_count, &hwirq, &type);
>> +               if (ret)
>> +                       return ret;
>> +       } else {
>> +               hwirq = virq;
>> +       }
> 
> I'm slightly puzzled here. What's the purpose of this? The whole goal of
> the domain hierarchy is to avoid that kind of thing. Also, you should
> never have to call xlate on an MSI, because it should never be described
> in the device tree the first place.

Thinking of it some more:

The actual reason why this is required is because the MSI domain calls
into this via irq_domain_alloc_irqs_parent(). But because MSIs are not
described in DT, they do not have a of_phandle to pass down to the xlate
helper. In this case, the v2m widget has the knowledge of what are the
valid SPI numbers, and the core GIC code must blindly accept it.

This definitely requires a fat comment, because this is far from obvious.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
