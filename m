From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v7 11/14] irqchip: ti-sci-inta: Add support for Interrupt
 Aggregator driver
Date: Mon, 29 Apr 2019 11:13:02 +0100
Message-ID: <3723e553-4e04-4ce4-080b-01f1a9843ea8@arm.com>
References: <20190420100950.7997-1-lokeshvutla@ti.com>
 <20190420100950.7997-12-lokeshvutla@ti.com>
 <bb768bc0-e18b-3794-8083-1612da10b0c1@ti.com>
 <79b34c45-023b-2df4-26f4-e151e74a46ac@arm.com>
 <7d012633-e540-df8f-7c21-07702447cb8a@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7d012633-e540-df8f-7c21-07702447cb8a@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>, tglx@linutronix.de, jason@lakedaemon.net
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>, linus.walleij@linaro.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 29/04/2019 09:59, Lokesh Vutla wrote:
> 
> 
> On 29/04/19 2:17 PM, Marc Zyngier wrote:
>> On 23/04/2019 11:00, Lokesh Vutla wrote:
>>> Hi Marc,
>>
>> [...]
>>
>>>> +/**
>>>> + * ti_sci_inta_set_type() - Update the trigger type of the irq.
>>>> + * @data:	Pointer to corresponding irq_data
>>>> + * @type:	Trigger type as specified by user
>>>> + *
>>>> + * Note: This updates the handle_irq callback for level msi.
>>>> + *
>>>> + * Return 0 if all went well else appropriate error.
>>>> + */
>>>> +static int ti_sci_inta_set_type(struct irq_data *data, unsigned int type)
>>>> +{
>>>> +	struct irq_desc *desc = irq_to_desc(data->irq);
>>>> +
>>>> +	/*
>>>> +	 * .alloc default sets handle_edge_irq. But if the user specifies
>>>> +	 * that IRQ is level MSI, then update the handle to handle_level_irq
>>>> +	 */
>>>> +	if (type & IRQF_TRIGGER_HIGH)
>>>> +		desc->handle_irq = handle_level_irq;
>>>> +
>>>> +	return 0;
>>>
>>>
>>> Returning error value is causing request_irq to fail, so still returning 0. Do
>>> you suggest any other method to handle this?
>>
>> But that is the very point, isn't it? If you pass the wrong triggering
>> type to request_irq, it *must* fail. What you should have is something like:
>>
>> switch (type & IRQ_TYPE_SENSE_MASK) {
>> case IRQF_TRIGGER_HIGH:
>> 	desc->handle_irq = handle_level_irq;
>> 	return 0;
>> case IRQ_TYPE_EDGE_RISING:
>> 	return 0;
>> default:
>> 	return -EINVAL;
>> }
>>
>> (adjust as necessary).
>>
>> What's wrong with this?
> 
> I get it. Will fix it in next version. I also got the firmware update as well.
> If you are okay with rest of the series, I want to post the next version with
> the firmware update.
Then post it now, and I'll review that. I'd rather look at the latest
than providing feedback on something that has already changed.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
