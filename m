From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v5 04/14] spmi: pmic-arb: convert to v2 irq interfaces to
 support hierarchical IRQ chips
Date: Fri, 18 Jan 2019 13:12:38 +0000
Message-ID: <e604d738-dd60-62c0-869a-dbb578ce2ca8@arm.com>
References: <20190117003234.22127-1-masneyb@onstation.org>
 <20190117003234.22127-5-masneyb@onstation.org>
 <d2e3c91c-2a54-e130-7512-e4a65bf2794d@arm.com>
 <20190118122716.GA32143@basecamp>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118122716.GA32143@basecamp>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 18/01/2019 12:27, Brian Masney wrote:
> Hi Marc,
> 
> On Thu, Jan 17, 2019 at 11:22:59AM +0000, Marc Zyngier wrote:
>>> -static int qpnpint_irq_domain_map(struct irq_domain *d,
>>> -				  unsigned int virq,
>>> -				  irq_hw_number_t hwirq)
>>> -{
>>> -	struct spmi_pmic_arb *pmic_arb = d->host_data;
>>>  
>>> +static void qpnpint_irq_domain_map(struct spmi_pmic_arb *pmic_arb,
>>> +				   struct irq_domain *domain, unsigned int virq,
>>> +				   irq_hw_number_t hwirq)
>>> +{
>>>  	dev_dbg(&pmic_arb->spmic->dev, "virq = %u, hwirq = %lu\n", virq, hwirq);
>>>  
>>> -	irq_set_chip_and_handler(virq, &pmic_arb_irqchip, handle_level_irq);
>>> -	irq_set_chip_data(virq, d->host_data);
>>> -	irq_set_noprobe(virq);
>>> +	irq_domain_set_info(domain, virq, hwirq, &pmic_arb_irqchip, pmic_arb,
>>> +			    handle_level_irq, NULL, NULL);
>>
>> I understand you haven't changed the existing semantic here by always
>> setting the handler to handle_level_irq. But is that guaranteed to
>> always be the case? See below.
>>
>>> +}
>>> +
>>> +static int qpnpint_irq_domain_alloc(struct irq_domain *domain,
>>> +				    unsigned int virq, unsigned int nr_irqs,
>>> +				    void *data)
>>> +{
>>> +	struct spmi_pmic_arb *pmic_arb = domain->host_data;
>>> +	struct irq_fwspec *fwspec = data;
>>> +	irq_hw_number_t hwirq;
>>> +	unsigned int type;
>>> +	int ret, i;
>>> +
>>> +	ret = qpnpint_irq_domain_translate(domain, fwspec, &hwirq, &type);
>>
>> Here, you extract the trigger from DT.
>>
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	for (i = 0; i < nr_irqs; i++)
>>> +		qpnpint_irq_domain_map(pmic_arb, domain, virq + i, hwirq + i);
>>
>> Shouldn't you propagate it into the mapping function so that the handler
>> can be selected accordingly? Or does the interrupt controller convert
>> edge signals to level somehow?
> 
> qpnpint_irq_set_type() calls irq_set_handler_locked() to set the hander
> to be either handle_edge_irq() or handle_level_irq(). So the handler is
> initially setup incorrectly in some cases, but then setup correctly (via
> __irq_set_trigger) when __setup_irq() is called by
> request_threaded_irq().
> 
> It looks like that this will cause problems with shared IRQs to work as
> expected.
> 
> I can rework this code and get this fixed.

It'd definitely be worth it, thanks.

	M.
-- 
Jazz is not dead. It just smells funny...
