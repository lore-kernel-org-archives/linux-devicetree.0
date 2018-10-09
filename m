From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH V10 1/8] irqchip: add C-SKY SMP interrupt controller
Date: Tue, 9 Oct 2018 09:15:17 +0100
Message-ID: <a8654ba4-fe46-6842-64f6-d4141bbf8793@arm.com>
References: <cover.1538672812.git.ren_guo@c-sky.com>
 <e06484474231375248e3e7a6ab47cf8ff8893129.1538672812.git.ren_guo@c-sky.com>
 <404fb433-020e-28f9-2434-a22c6db36a15@arm.com> <20181009022357.GA826@guoren>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181009022357.GA826@guoren>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Guo Ren <ren_guo@c-sky.com>
Cc: tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, anurup.m@huawei.com, Jonathan.Cameron@huawei.com, will.deacon@arm.com, zhangshaokun@hisilicon.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/10/18 03:24, Guo Ren wrote:
> Hi Marc,
> 
> On Mon, Oct 08, 2018 at 05:35:19PM +0100, Marc Zyngier wrote:
>> Hi Guo,
>>
>> On 04/10/18 18:22, Guo Ren wrote:
>>>   - Irq-csky-mpintc is C-SKY smp system interrupt controller and it
>>>     could support 16 soft irqs, 16 private irqs, and 992 max common
>>>     irqs.
>>>
>>> Changelog:
>>>   - pass checkpatch.pl
>>>   - Move IPI_IRQ into the driver
>>>   - Remove irq_set_default_host() and use set_ipi_irq_mapping()
> 
>   [...]
> 
>>> +#ifdef CONFIG_SMP
>>> +static void csky_mpintc_send_ipi(const unsigned long *mask)
>>> +{
>>
>> Why isn't this a cpumask? It should be this driver's job to convert the
>> cpumask to an interrupt-controller specific representation, and not the SMP
>> code's.
> Ok, use cpumask.
> 
>   [...]
> 
>>> +#ifdef CONFIG_SMP
>>> +	set_send_ipi(&csky_mpintc_send_ipi);
>>> +
>>> +	set_ipi_irq_mapping(&csky_mpintc_ipi_irq_mapping);
>>
>> Since you seem to be inventing a new set_send_ipi callback, why don't you
>> define it as:
>>
>> void set_send_ipi(void (*func)(const struct cpumask *),
>> 		  unsigned int ipi_irq);
>> after having created the mapping for the IPI interrupt? It would avoid this
>> rather pointless mapping callback.
> 
> I'll define it to:
> 
> void set_send_ipi(void (*func)(const struct cpumask *));
> 
> IPI_IRQ only use software-irq-15 in mpintc driver, so arch needn't care
> about irq-num.

Except that your SMP code does a request_irq on the result of 
create_mapping. Who is going to do that if you don't pass the Linux irq 
around?

> 
> 	/*
> 	 * INTCL_SIGR[3:0] INTID
> 	 * INTCL_SIGR[8:15] CPUMASK
> 	 */
> 	writel_relaxed((*mask) << 8 | IPI_IRQ, reg_base + INTCL_SIGR);
> 
> We direct put IPI_IRQ to the hw-reg for the target core.

I can see that, but that doesn't solve the issue outlined above.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
